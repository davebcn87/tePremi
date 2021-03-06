//
//  checkinViewController.m
//  TePremi
//
//  Created by David Cortés Fulla on 19/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "checkinViewController.h"
#import "categoriesViewController.h"
#import "loginViewController.h"
@interface checkinViewController ()

@end

@implementation checkinViewController
@synthesize scrollView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}
- (void)viewDidLoad
{
    [scrollView setContentSize:CGSizeMake(320, 691)];
    [super viewDidLoad];
	// Do any additional setup after loading the view.

    loginViewController *loginVC = [self.storyboard instantiateViewControllerWithIdentifier:@"loginView"];
    [self presentModalViewController:loginVC animated:NO];
}

- (void)viewDidUnload
{
    [self setScrollView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (IBAction) checkIn:(id)sender
{
    categoriesViewController *categoriesVC = [self.storyboard instantiateViewControllerWithIdentifier:@"categoriesVC"];
    [self.navigationController pushViewController:categoriesVC animated:YES];
}
    
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
