//
//  mapaViewController.h
//  TePremi
//
//  Created by David Cortés Fulla on 19/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

typedef enum{
    EBarri = 0,
    EZona = 1,
    EMobil =2
}PinTypes;

@interface mapaViewController : UIViewController<MKMapViewDelegate>
{
    MKMapView *iMapView;
    PinTypes localtionTypePin;
}

@property(nonatomic, strong) IBOutlet MKMapView *iMapView;
@property(nonatomic, strong) NSArray *iZonaList;
@property(nonatomic, strong) NSArray *iBarriList;
@property(nonatomic, strong) NSArray *iMobilList;
@property(nonatomic, strong) NSMutableArray *iZonaPins;
@property(nonatomic, strong) NSMutableArray *iBarriPins;
@property(nonatomic, strong) NSMutableArray *iMobilPins;

- (IBAction) showMobilPoints:(id)sender;
- (IBAction) showZonaPoints:(id)sender;
- (IBAction) showBarriPoints:(id)sender;

@end
