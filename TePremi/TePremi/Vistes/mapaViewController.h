//
//  mapaViewController.h
//  TePremi
//
//  Created by David Cortés Fulla on 19/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface mapaViewController : UIViewController<MKMapViewDelegate>
{
    MKMapView *iMapView;
}

@property(nonatomic, retain) IBOutlet MKMapView *iMapView;


@end
