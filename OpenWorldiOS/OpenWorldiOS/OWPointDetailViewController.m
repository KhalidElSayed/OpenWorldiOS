//
//  OWDataDetailViewControllerViewController.m
//  OpenWorldiOS
//
//  Created by Edward Williams on 9/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OWPointDetailViewController.h"
#import "OWAppDelegate.h"
@interface OWPointDetailViewController ()

@end

@implementation OWPointDetailViewController
@synthesize activityView,currentAnnotation,payloadConnection,payloadView,dismissButton,addPayloadViewController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        payloadConnection = [[OWPayloadConnection alloc] init:@"http://openworldserver.appspot.com/payload"];
        [payloadConnection setDelegate:self];
        payloadType = 0;
    }
    return self;
}
/*
- (void) switchPayload{
    payloadType++;
    if (payloadType == 2) {
        payloadType = 0;
    }
    
    switch (payloadType) {
        case OWPayloadTypeText:
            [payloadProvider setOwPayloadURLString:@"http://openworldserver.appspot.com/payload"];
            break;
        case OWPayloadTypeImage:
            [payloadProvider setOwPayloadURLString:@"http://openworldserver.appspot.com/payload"];
        default:
            break;
    }
    
}
 */
- (IBAction) addPayload{
    if (addPayloadViewController == nil) {
        [self setAddPayloadViewController:[[OWAddPayloadViewController alloc] initWithNibName:@"OWAddPayloadViewController" bundle:nil]];
    }
    OWAppDelegate *mainDelegate = (OWAppDelegate *) [[UIApplication sharedApplication] delegate];
    [self presentModalViewController:addPayloadViewController animated:YES];
    [addPayloadViewController setPointKey:currentAnnotation.key];
    [addPayloadViewController setCreatorKey:[[mainDelegate currentUser] userKey]];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction) dismissView{
    [self dismissModalViewControllerAnimated:YES];
}

- (void) connectionFailed: (NSError *) error{
    
    [activityView stopAnimating];
}
- (void) finishedUpdatingPoints: (NSObject *) arrayOrDictionary{
    
    NSDictionary *payloadDictionary = (NSDictionary *) arrayOrDictionary;
    
    NSString *payload = [payloadDictionary objectForKey:@"payload"];
    OWPayloadType type = [[payloadDictionary objectForKey:@"payloadType"] intValue];
	numberOfPayloads = [[payloadDictionary objectForKey:@"payloadCount"] intValue];
    
    if (payload == nil) {
        //TODO show alert error message
    }
    else{
        if (payloadView != nil) {
            [payloadView removeFromSuperview];
        }
        [self setPayloadView:[OWPayloadViewFactory createPayloadView:type :self.view.bounds]];
        [payloadView loadPayloadData:payload];
        [[self view] addSubview:payloadView];
        
        
        [[self view] bringSubviewToFront:addPayloadButton];
        [[self view] bringSubviewToFront:nextPayloadButton];
        [[self view] bringSubviewToFront:dismissButton];
        [[self view] bringSubviewToFront:activityView];
    }
    
    [activityView stopAnimating];
    
}


- (BOOL) getPayload: (NSString *) pointKey: (NSString *) dataTypeKey: (int) payloadIndex{

    [activityView startAnimating];
    return [payloadConnection startConnection:pointKey :dataTypeKey :payloadIndex];
}

- (void) setupDetailScreen: (OWAnnotation *) annotation{
    
}
- (IBAction) nextAction{
    curPayloadIndex++;
    if (curPayloadIndex >= numberOfPayloads) {
        curPayloadIndex = 0;
    }
    [self getPayload:[currentAnnotation key] :[currentAnnotation dataTypeKey] :curPayloadIndex];
}

@end
