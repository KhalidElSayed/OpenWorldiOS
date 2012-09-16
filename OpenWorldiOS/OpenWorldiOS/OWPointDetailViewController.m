//
//  OWDataDetailViewControllerViewController.m
//  OpenWorldiOS
//
//  Created by Edward Williams on 9/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OWPointDetailViewController.h"

@interface OWPointDetailViewController ()

@end

@implementation OWPointDetailViewController
@synthesize payloadProvider,payloadView,dismissButton;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        payloadProvider = [[OWPayloadProvider alloc] init:@"http://openworldserver.appspot.com/payload"];
        [payloadProvider setDelegate:self];
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
    
}
- (void) finishedUpdatingPoints: (NSArray *) array{
    
    NSDictionary *payloadDictionary = [array objectAtIndex:0];
    
    NSString *payload = [payloadDictionary objectForKey:@"payload"];
    OWPayloadType type = [[payloadDictionary objectForKey:@"payloadType"] intValue];
	
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
        
        [[self view] bringSubviewToFront:dismissButton];
    }
    
}


- (BOOL) getPayload: (NSString *) pointKey: (int) payloadIndex{

    return [payloadProvider startConnection:pointKey :@"" :payloadIndex];
}

@end
