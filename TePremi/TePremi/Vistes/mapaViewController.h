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

@property(nonatomic, strong) IBOutlet MKMapView *iMapView;
@property(nonatomic, strong) NSArray *iZonaList;
@property(nonatomic, strong) NSArray *iBarriList;
@property(nonatomic, strong) NSArray *iMobilList;


@end
