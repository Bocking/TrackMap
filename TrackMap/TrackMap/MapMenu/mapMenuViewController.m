//
//  mapMenuViewController.m
//  TrackMap
//
//  Created by Douglas Bocking on 11/09/2014.
//  Copyright (c) 2014 DouglasBocking. All rights reserved.
//

#import "mapMenuViewController.h"
#import "SWRevealViewController.h"

@interface mapMenuViewController ()

@end

@implementation mapMenuViewController

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
    // Do any additional setup after loading the view.
    
    // set self as the data source and delegate for the table view
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    //Fetch the menu items
    self.menuItems = [[[mapMenuModel alloc] init] getMenuItems];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark Table View Delegate Methods


- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.menuItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath

{
    //Retrieve Cell
    NSString *cellIdentifier = @"MenuItemCell";
    UITableViewCell *menuCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    // Get menu item that it is asking for
    mapMenuItem *item = self.menuItems[indexPath.row];
    
    // Set menu item text and icon
    menuCell.textLabel.text = item.menuTitle;
    
    return menuCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Check which item was tapped
    mapMenuItem *item = self.menuItems[indexPath.row];
    
    switch (item.screenType)
    {
        case ScreenTypeNightcap:
            //go to Nightcap View
            [self performSegueWithIdentifier:@"GoToNightcapMapSegue" sender:self];
            break;
        
        case ScreenTypeGoonengerry:
            //go to Goonengerry View
            [self performSegueWithIdentifier:@"GoToGoonengerrySegue" sender:self];
            break;
            
        case ScreenTypeHome:
            //go back to first screen
            [self performSegueWithIdentifier:@"GoToFirstView" sender:self];
            break;
            
        default:
            break;
    // remember to enum a new screen type in Prefix.pch when creating more menu items for future maps
    
    }

}

#pragma mark Segue Methods

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Set the front View controller to be the destination one
    [self.revealViewController setFrontViewController:segue.destinationViewController];
    
    // Slide the Front View controller back into place
    [self.revealViewController revealToggleAnimated:YES];
}


@end
