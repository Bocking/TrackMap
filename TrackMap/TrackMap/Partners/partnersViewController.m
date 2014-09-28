//
//  partnersViewController.m
//  TrackMap
//
//  Created by Douglas Bocking on 11/09/2014.
//  Copyright (c) 2014 DouglasBocking. All rights reserved.
//

#import "partnersViewController.h"

@interface partnersViewController ()

@end

@implementation partnersViewController

-(IBAction)RRRlink
{
   [[UIApplication sharedApplication]
    openURL:[NSURL URLWithString:@"http://www.facebook.com/RichmondRiverRiders"]];
}

-(IBAction)NRBClink
{
    [[UIApplication sharedApplication]
     openURL:[NSURL URLWithString:@"http://www.northernriversbushwalkersclub.org.au"]];
}

-(IBAction)NRTPlink
{
    [[UIApplication sharedApplication]
     openURL:[NSURL URLWithString:@"https://www.facebook.com/pages/Northern-Rivers-Team-Penners/117524518330527"]];
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
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
