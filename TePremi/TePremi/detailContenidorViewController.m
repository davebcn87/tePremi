//
//  detailContenidorViewController.m
//  TePremi
//
//  Created by Xavier Pinyol on 19/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "detailContenidorViewController.h"

@interface detailContenidorViewController ()

@end

@implementation detailContenidorViewController

@synthesize iTitle,iSubtitle,iTitleText,iDescription,iSubtitleText,iDescriptionText, iImageContenidor, iImageName;

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
    // Do any additional setup after loading the view from its nib.
    [iImageContenidor setImage:[UIImage imageNamed:iImageName]];
    [iTitle setText:iTitleText];
    [iSubtitle setText:iSubtitleText];
    [iDescription setText:iDescriptionText];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction) back:(id)sender
{
    [self dismissModalViewControllerAnimated:YES];
}

@end
