//
//  mapaViewController.m
//  TePremi
//
//  Created by David Cortés Fulla on 19/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "mapaViewController.h"

#import "LocationAnnotation.h"

@interface mapaViewController ()
- (CLLocationCoordinate2D) getLocationFromAddressString:(NSString*) addressStr;
@end

@implementation mapaViewController

@synthesize iMapView;
@synthesize iZonaList, iBarriList, iMobilList;
@synthesize iZonaPins, iBarriPins, iMobilPins;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.iZonaPins = [[NSMutableArray alloc] init];
    self.iBarriPins = [[NSMutableArray alloc] init];
    self.iMobilPins = [[NSMutableArray alloc] init];
    
    [self performSelector:@selector(configureView) withObject:nil afterDelay:0.1];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void) configureView
{    
    NSDictionary *info = [self downloadMapaInfo];
    
    self.iZonaList = [info valueForKey:@"zona"];
    self.iBarriList = [info valueForKey:@"barri"];
    self.iMobilList = [info valueForKey:@"mobil"];
    
    [self showBarriPoints];
}

- (IBAction) buttonBarriPressed:(UIButton *)sender
{    
    sender.selected = !sender.selected;
    
    if(sender.selected)
    {
        [self showBarriPoints];
    }
    else
    {
        [self removeBarriPoints];
        [iBarriPins removeAllObjects];
    }
}

- (IBAction) buttonZonaPressed:(UIButton *)sender
{
    sender.selected = !sender.selected;
    
    if(sender.selected)
    {
        [self showZonaPoints];
    }
    else
    {
        [self removeZonaPoints];
        [iZonaPins removeAllObjects];
    }
}

- (IBAction) buttonMobilPressed:(UIButton *)sender
{
    sender.selected = !sender.selected;

    if(sender.selected)
    {
        [self showMobilPoints];
    }
    else
    {
        [self removeMobilPoints];
        [iMobilPins removeAllObjects];
    }    
}


- (void) showBarriPoints
{
    localtionTypePin = EBarri;
    [self showPoints:iBarriList];
}

- (void) showZonaPoints
{
    localtionTypePin = EZona;
    [self showPoints:iZonaList];
}

- (void) showMobilPoints
{
    localtionTypePin = EMobil;
    [self showPoints:iMobilList];
}

- (void) removeBarriPoints
{
    [self removePoints:iBarriPins];
    [iBarriPins removeAllObjects];
}

- (void) removeZonaPoints
{
    [self removePoints:iZonaPins];
    [iZonaPins removeAllObjects];
}

- (void) removeMobilPoints
{
    [self removePoints:iMobilPins];
    [iMobilPins removeAllObjects];
}

- (void) removePoints:(NSArray *)aPointsList
{
    NSMutableArray *locs = [[NSMutableArray alloc] init];
    for (id <MKAnnotation> annot in aPointsList)
    {
        if ( [annot isKindOfClass:[ MKUserLocation class]] ) {
        }
        else {
            [locs addObject:annot];
        }
    }
    
    [iMapView removeAnnotations:locs];
}

- (void) showPoints:(NSArray *)aArray
{
    for (NSDictionary *point in aArray) 
    {
        NSString *adress = [point valueForKey:@"adreça"];
        adress = [[adress componentsSeparatedByString:@","] objectAtIndex:0];;
        NSString *horari = [point valueForKey:@"horari"];
        
        [self setPosition:adress andTime:horari];
    }
}

- (NSDictionary *) downloadMapaInfo
{
    // LOCAL
    NSString *pathFile = [[NSBundle mainBundle] pathForResource:@"puntsverds" ofType:@"txt"];
    
    NSData *dataInfo = [NSData dataWithContentsOfFile:pathFile];
   
    // URL
//    NSString *file = @"http://192.168.100.161/UploadWhiteB/wh.txt";
//    NSURL *fileURL = [NSURL URLWithString:file];
//    NSData *dataInfo = [[NSData alloc] initWithContentsOfURL:fileURL];

    // parse json
    NSError *myError = nil;
    NSDictionary *res = [NSJSONSerialization JSONObjectWithData:dataInfo options:NSJSONReadingMutableLeaves error:&myError];
    NSLog(@"%@",res);

    return res;
}

- (void) setPosition:(NSString *)aAdress andTime:(NSString *)AHorari
{
    CLLocationCoordinate2D coordinate = [self getLocationFromAddressString:aAdress];
    
    CLLocation *newLocation = [[CLLocation alloc] initWithLatitude:coordinate.latitude longitude:coordinate.longitude];
    CLLocationDistance distance = 11000.0;
    
    MKCoordinateRegion userLocation = MKCoordinateRegionMakeWithDistance(newLocation.coordinate, distance, distance);
    [iMapView setRegion:userLocation animated:YES];
    
    CLRegion *region = [[CLRegion alloc] initCircularRegionWithCenter:newLocation.coordinate radius:distance identifier:aAdress];
    
    LocationAnnotation *annotation = [[LocationAnnotation alloc] initWithCLRegion:region andAddress:aAdress andTime:AHorari];
    [iMapView selectAnnotation:annotation animated:YES];
    [iMapView addAnnotation:annotation];
    
    switch (localtionTypePin) {
        case EBarri:
            [iBarriPins addObject:annotation];
            break;
        case EZona:
            [iZonaPins addObject:annotation];
            break;
        case EMobil:
            [iMobilPins addObject:annotation];
            break;
        default:
            break;
    }
}

- (CLLocationCoordinate2D) getLocationFromAddressString:(NSString*) addressStr {
    NSString *urlStr = [NSString stringWithFormat:@"http://maps.google.com/maps/geo?q=%@&output=csv", [addressStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding]];
    NSString *locationStr = [NSString stringWithContentsOfURL:[NSURL URLWithString:urlStr] encoding:NSUTF8StringEncoding error:nil];
    NSArray *items = [locationStr componentsSeparatedByString:@","];
    
    double lat = 0.0;
    double lon = 0.0;
    
    if([items count] >= 4 && [[items objectAtIndex:0] isEqualToString:@"200"]) {
        lat = [[items objectAtIndex:2] doubleValue];
        lon = [[items objectAtIndex:3] doubleValue];
    }
    else {
        NSLog(@"Address, %@ not found: Error %@",addressStr, [items objectAtIndex:0]);
    }
    CLLocationCoordinate2D location;
    location.latitude = lat;
    location.longitude = lon;
    
    return location;
}

-(MKAnnotationView *)mapView:(MKMapView *)mV viewForAnnotation:(id <MKAnnotation>)annotation 
{
    MKPinAnnotationView *pinView = nil; 
    if(annotation != iMapView.userLocation) 
    {
        static NSString *defaultPinID = @"Pins";
        pinView = (MKPinAnnotationView *)[iMapView dequeueReusableAnnotationViewWithIdentifier:defaultPinID];
        if ( pinView == nil ) {
            pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:defaultPinID];
        }
        
        switch (localtionTypePin) {
            case EZona:
                pinView.pinColor = MKPinAnnotationColorPurple; 
                break;
            case EMobil:
                pinView.pinColor = MKPinAnnotationColorGreen; 
                break;
            case EBarri:
                pinView.pinColor = MKPinAnnotationColorRed; 
                break;
                
            default:
                break;
        }
        pinView.canShowCallout = YES;
        pinView.animatesDrop = YES;
        pinView.tag = localtionTypePin;
    } 
    else {
        [iMapView.userLocation setTitle:@"I am here"];
    }
    return pinView;
}


@end
