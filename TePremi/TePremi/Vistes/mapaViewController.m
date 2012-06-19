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


- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    [self setPosition:@"Barcelona, España"];
}


- (void) setPosition:(NSString *)aAdress
{
    CLLocationCoordinate2D coordinate = [self getLocationFromAddressString:aAdress];
    
    CLLocation *newLocation = [[CLLocation alloc] initWithLatitude:coordinate.latitude longitude:coordinate.longitude];
    CLLocationDistance distance = 1500.0;
    
    MKCoordinateRegion userLocation = MKCoordinateRegionMakeWithDistance(newLocation.coordinate, distance, distance);
    [iMapView setRegion:userLocation animated:YES];
    
    CLRegion *region = [[CLRegion alloc] initCircularRegionWithCenter:newLocation.coordinate radius:distance identifier:aAdress];
    
    LocationAnnotation *annotation = [[LocationAnnotation alloc] initWithCLRegion:region andFileName:@""];
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

- (MKAnnotationView *)mapView:(MKMapView *)aMapView viewForAnnotation:(id<MKAnnotation>)annotation
{
    static NSString *SFAnnotationIdentifier = @"SFAnnotationIdentifier";
    MKPinAnnotationView *pinView = (MKPinAnnotationView *)[aMapView dequeueReusableAnnotationViewWithIdentifier:SFAnnotationIdentifier];
    
    if (!pinView)
    {
        // if an existing pin view was not available, create one
        MKPinAnnotationView* customPinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:SFAnnotationIdentifier];
        
        customPinView.pinColor = MKPinAnnotationColorRed;
        customPinView.animatesDrop = YES;
        customPinView.canShowCallout = YES;
        
        //        UIImage *image;
        //        
        //        if (iThumbnail != nil)
        //        {
        //            image = iThumbnail;
        //        }
        //        else
        //        {
        //            image = [UIImage imageNamed:@"icon.png"];
        //        }
        
        //        UIImageView *sfIconView = [[UIImageView alloc] initWithImage:image];
        //        [sfIconView setFrame:CGRectMake(0, 0, 30, 30)];
        //        customPinView.leftCalloutAccessoryView = sfIconView;
        //        [sfIconView release];
        
        return customPinView;
    }
    else
    {
        pinView.annotation = annotation;
    }
    
    return pinView;
}


@end
