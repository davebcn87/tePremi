//
//  categoriesViewController.m
//  TePremi
//
//  Created by David Cortés Fulla on 19/06/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "categoriesViewController.h"

@interface categoriesViewController ()
    @property (nonatomic, retain) NSMutableArray *categories;
    @property (nonatomic, retain) NSMutableArray *seleccionades;
@end

@implementation categoriesViewController
@synthesize scrollView = _scrollView;
@synthesize tableView = _tableView;

@synthesize categories = _categories;
@synthesize seleccionades = _seleccionades;

- (NSMutableArray *) seleccionades
{
    if (!_seleccionades) return _seleccionades = [[NSMutableArray alloc]init];
    else return _seleccionades;
}
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
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    [self.navigationController.navigationBar setBarStyle:UIBarStyleBlackTranslucent];
    [self.scrollView setContentSize:CGSizeMake(320, 2000)];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"categories" ofType:@"plist"];
    NSMutableArray *categories = [[NSMutableArray alloc] initWithContentsOfFile:path];
    self.categories = categories;
    
    for (NSString *categoria in categories) {
        [self.seleccionades addObject:[NSNumber numberWithBool:NO]];
    }
    
    [self setScrollView:nil];
    
    [self.tableView reloadData];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [self setTableView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table View Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *categoria = [tableView dequeueReusableCellWithIdentifier:@"categoriaCell"];
    
    UILabel *titolCat = (UILabel *)[categoria viewWithTag:1];
    titolCat.text = [self.categories objectAtIndex:indexPath.row];
    
    UIImageView *selected = (UIImageView *)[categoria viewWithTag:2];
    if ([[self.seleccionades objectAtIndex:indexPath.row] boolValue]){
        selected.hidden = NO;
    }
    else {
        selected.hidden = YES;
    }
    
    return categoria;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.categories.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    BOOL valor = [[self.seleccionades objectAtIndex:indexPath.row] boolValue];
    [self.seleccionades replaceObjectAtIndex:indexPath.row withObject:[NSNumber numberWithBool:!valor]];
    [self.tableView reloadData];
}
@end
