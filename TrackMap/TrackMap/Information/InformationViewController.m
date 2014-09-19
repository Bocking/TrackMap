//
//  InformationViewController.m
//  TrackMap
//
//  Created by Douglas Bocking on 11/09/2014.
//  Copyright (c) 2014 DouglasBocking. All rights reserved.
//

#import "InformationViewController.h"


@interface InformationViewController ()

@end

@implementation InformationViewController
@synthesize myMail;

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



- (IBAction)sendFeedback:(id)sender
{
    
    if ([MFMailComposeViewController canSendMail] == YES)
    {
       
        //Set up
        myMail = [[MFMailComposeViewController alloc]init];
        
        myMail.mailComposeDelegate = self;
        
        //Set the Subject
        [myMail setSubject:@"TrackMap feedback"];
        
        //To Recipients
        NSArray * toRecipients = [[NSArray alloc] initWithObjects:@"douglas.Bocking@gmail.com", nil];
        [myMail setToRecipients:toRecipients];
        
        /*
        //CC Recipients
        NSArray * ccRecipients = [[NSArray alloc] initWithObjects:@"douglas.Bocking@gmail.com",@"douglas_bocking@hotmail.com", nil];
        [myMail setCcRecipients:ccRecipients];
        
        //Bcc Recipients
        NSArray * bccRecipients = [[NSArray alloc] initWithObjects:@"douglas.Bocking@gmail.com",@"douglas_bocking@hotmail.com", nil];
        [myMail setBccRecipients:bccRecipients];
         */
        
        //Add some text to the message body
        NSString * sentFrom = @"Email sent from track map";
        [myMail setMessageBody:sentFrom isHTML:YES];
        
        //display the view controller
        [self presentViewController:myMail animated:YES completion:nil];
    }
    
    else
    {
        UIAlertView * errorAlert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Your device can not send email" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [errorAlert show];
    }
    
}

- (IBAction)sendNationalParkFeedback:(id)sender

{
    if ([MFMailComposeViewController canSendMail] == YES)
    {
        
        //Set up
        myMail = [[MFMailComposeViewController alloc]init];
        
        myMail.mailComposeDelegate = self;
        
        //Set the Subject
        [myMail setSubject:@"National Park feedback"];
        
        //To Recipients
        NSArray * toRecipients = [[NSArray alloc] initWithObjects:@"douglas.Bocking@gmail.com", nil];
        [myMail setToRecipients:toRecipients];
        
        /*
         //CC Recipients
         NSArray * ccRecipients = [[NSArray alloc] initWithObjects:@"douglas.Bocking@gmail.com",@"douglas_bocking@hotmail.com", nil];
         [myMail setCcRecipients:ccRecipients];
         
         //Bcc Recipients
         NSArray * bccRecipients = [[NSArray alloc] initWithObjects:@"douglas.Bocking@gmail.com",@"douglas_bocking@hotmail.com", nil];
         [myMail setBccRecipients:bccRecipients];
         */
        
        //Add some text to the message body
        NSString * sentFrom = @"Please specify what Natioal park you are in and your location. Thank you!";
        [myMail setMessageBody:sentFrom isHTML:YES];
        
        //display the view controller
        [self presentViewController:myMail animated:YES completion:nil];
    }
    
    else
    {
        UIAlertView * errorAlert = [[UIAlertView alloc]initWithTitle:@"Error" message:@"Your device can not send email" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
        
        [errorAlert show];
    }
}

- (void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    
    switch (result) {
        case MFMailComposeResultCancelled:
            //Do Something
            break;
        case MFMailComposeResultFailed:
            //Do Something
        case MFMailComposeResultSaved:
            //Do Something
        case MFMailComposeResultSent:
        {
            UIAlertView * thankyouAlert = [[UIAlertView alloc]initWithTitle:@"Thank You" message:@"Thankyou for your feedback" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
            
            [thankyouAlert show];
        }
            break;
        default:
            break;
    }
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


@end
