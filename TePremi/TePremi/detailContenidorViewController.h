//
//  detailContenidorViewController.h
//  TePremi
//
//  Created by Xavier Pinyol on 19/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface detailContenidorViewController : UIViewController
{
}

@property(strong, nonatomic) NSString *iTitleText;
@property(strong, nonatomic) NSString *iSubtitleText;
@property(strong, nonatomic) NSString *iDescriptionText;
@property(strong, nonatomic) NSString *iImageName;

@property(strong, nonatomic) IBOutlet UIImageView *iImageContenidor;
@property(strong, nonatomic) IBOutlet UILabel *iTitle;
@property(strong, nonatomic) IBOutlet UILabel *iSubtitle;
@property(strong, nonatomic) IBOutlet UILabel *iDescription;

- (IBAction) back:(id)sender;

- (IBAction) yellow:(id)sender;
- (IBAction) verd:(id)sender;
- (IBAction) blau:(id)sender;
- (IBAction) marro:(id)sender;
- (IBAction) gris:(id)sender;
- (IBAction) puntverd:(id)sender;

@end
