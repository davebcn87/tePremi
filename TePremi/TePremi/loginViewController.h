//
//  loginViewController.h
//  TePremi
//
//  Created by Xavier Pinyol on 19/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface loginViewController : UIViewController <UITextFieldDelegate>

@property (strong, nonatomic) IBOutlet UITextField *iIdentificador;
@property (strong, nonatomic) IBOutlet UITextField *iTelefon;

- (IBAction) login:(id)sender;
@end
