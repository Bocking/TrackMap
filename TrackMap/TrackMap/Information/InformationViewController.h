//
//  InformationViewController.h
//  TrackMap
//
//  Created by Douglas Bocking on 11/09/2014.
//  Copyright (c) 2014 DouglasBocking. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MessageUI/MessageUI.h>

@interface InformationViewController : UIViewController<MFMailComposeViewControllerDelegate>

@property (nonatomic, strong) MFMailComposeViewController * myMail;

- (IBAction)sendFeedback:(id)sender;

- (IBAction)sendNationalParkFeedback:(id)sender;


@end
