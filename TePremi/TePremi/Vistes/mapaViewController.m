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
    
    [self showPoints:iZonaList];
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
        static NSString *defaultPinID = @"com.invasivecode.pin";
        pinView = (MKPinAnnotationView *)[iMapView dequeueReusableAnnotationViewWithIdentifier:defaultPinID];
        if ( pinView == nil ) pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:defaultPinID];
        
        pinView.pinColor = MKPinAnnotationColorRed; 
        pinView.canShowCallout = YES;
        pinView.animatesDrop = YES;
    } 
    else {
        [iMapView.userLocation setTitle:@"I am here"];
    }
    return pinView;
}


@end
