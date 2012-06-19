
#import "LocationAnnotation.h"

@implementation LocationAnnotation

@synthesize region, coordinate, title, subtitle;

- (id)init {
	self = [super init];
	if (self != nil) {
		self.title = @"Monitored Region";
	}
	
	return self;	
}


- (id)initWithCLRegion:(CLRegion *)newRegion andAddress:(NSString *)aAddress andTime:(NSString *)aTime
{
	self = [self init];
	
	if (self != nil) {
		self.region = newRegion;
		self.coordinate = region.center;
		self.title = aAddress;
        self.subtitle = aTime;
	}		

	return self;		
}

/*
 This method provides a custom setter so that the model is notified when the subtitle value has changed.
 */
/*- (void)setRadius:(CLLocationDistance)newRadius {
	[self willChangeValueForKey:@"subtitle"];
	
	[self didChangeValueForKey:@"subtitle"];
}


- (NSString *)subtitle {
	return [NSString stringWithFormat: @"Lat: %.4F, Lon: %.4F", coordinate.latitude, coordinate.longitude];	
}
*/


@end
