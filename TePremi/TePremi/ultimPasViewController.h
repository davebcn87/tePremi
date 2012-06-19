//
//  ultimPasViewController.h
//  TePremi
//
//  Created by David Cortés Fulla on 19/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBarSDK.h"

@interface ultimPasViewController : UIViewController <ZBarReaderDelegate>

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end
