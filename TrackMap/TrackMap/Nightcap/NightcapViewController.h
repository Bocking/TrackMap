//
//  NightcapViewController.h
//  TrackMap
//
//  Created by Douglas Bocking on 11/09/2014.
//  Copyright (c) 2014 DouglasBocking. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <ArcGIS/ArcGIS.h>


@interface NightcapViewController : UIViewController<AGSWebMapDelegate, CLLocationManagerDelegate>

@property (strong, nonatomic) IBOutlet AGSMapView *nightcapMapView;

@property (retain, nonatomic) AGSWebMap *webmap;




@end
