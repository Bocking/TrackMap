//
//  GoonengerryViewController.m
//  TrackMap
//
//  Created by Douglas Bocking on 11/09/2014.
//  Copyright (c) 2014 DouglasBocking. All rights reserved.
//

#import "GoonengerryViewController.h"
#import "SWRevealViewController.h"

@import CoreLocation;

@interface GoonengerryViewController () <CLLocationManagerDelegate>

@property (strong,nonatomic) CLLocationManager *locationManager;

@end

@implementation GoonengerryViewController

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
    
    //[self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    
#pragma mark add web map
    // this adds webmap
    self.webmap = [[AGSWebMap alloc] initWithItemId:@"b18911de8bf04fe8a3148d06e4c4397a" credential:nil];
    self.webmap.delegate = self;
    
#pragma mark client ID
    // Set the client ID
    NSError *error;
    NSString* clientID = @"qJYZkX8iPC0lLMBh";
    
    [AGSRuntimeEnvironment setClientID:clientID error:&error];
    if(error)
        
    {
        // We had a problem using our client ID
        NSLog(@"Error using client ID : %@",[error localizedDescription]);
    }
    
    // allows GPS to be called in IOS8
    self.locationManager = [[CLLocationManager alloc]init];
    
    if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)])
    {
        [self.locationManager requestWhenInUseAuthorization];
    }
    [self.locationManager startUpdatingLocation];
    
}

-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations
{
    NSLog(@"%@", [locations lastObject]);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)webMapDidLoad:(AGSWebMap *)webmap

{
    //open webmap in mapview
    [self.webmap openIntoMapView:self.goonengerryMapView];
    
    //GPS
    
    [self.goonengerryMapView.locationDisplay startDataSource];
    
    _goonengerryMapView.locationDisplay.autoPanMode = AGSLocationDisplayAutoPanModeNavigation;
    
    
    /* self.mapView.locationDisplay.autoPanMode = AGSLocationDisplayAutoPanModeCompassNavigation ;
     
     self.mapView.locationDisplay.navigationPointHeightFactor  = 0.5; //50% along the center line from the bottom edge to the top edge */
    
}
- (IBAction)goonengerryMenuButtonPressed:(id)sender
{
        [self.revealViewController revealToggleAnimated:YES];
}

@end
