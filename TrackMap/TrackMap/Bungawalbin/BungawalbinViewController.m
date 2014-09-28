//
//  BungawalbinViewController.m
//  TrackMap
//
//  Created by Douglas Bocking on 11/09/2014.
//  Copyright (c) 2014 DouglasBocking. All rights reserved.
//


#import "BungawalbinViewController.h"
#import "SWRevealViewController.h"


@import CoreLocation;

@interface BungawalbinViewController () <CLLocationManagerDelegate>

@property (strong,nonatomic) CLLocationManager *locationManager;

@end

@implementation BungawalbinViewController

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
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
#pragma mark add web map
    // this adds webmap
    self.webmap = [[AGSWebMap alloc] initWithItemId:@"8c0ba29cf386496a86d71e9724072e20" credential:nil];
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
    [self.webmap openIntoMapView:self.bungawalbinMapView];
    
    //GPS
    
    [self.bungawalbinMapView.locationDisplay startDataSource];
    
    _bungawalbinMapView.locationDisplay.autoPanMode = AGSLocationDisplayAutoPanModeNavigation;
    
    
    /* self.mapView.locationDisplay.autoPanMode = AGSLocationDisplayAutoPanModeCompassNavigation ;
     
     self.mapView.locationDisplay.navigationPointHeightFactor  = 0.5; //50% along the center line from the bottom edge to the top edge */
    
}

@end
