//
//  categoriesViewController.h
//  TePremi
//
//  Created by David Cortés Fulla on 19/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface categoriesViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end
