
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface LocationAnnotation : NSObject <MKAnnotation> {

}

@property (nonatomic, retain) CLRegion *region;
@property (nonatomic, readwrite) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

- (id)initWithCLRegion:(CLRegion *)newRegion andAddress:(NSString *)aAddress andTime:(NSString *)aTime;

@end
