//
//  OWDataDetailViewControllerViewController.h
//  OpenWorldiOS
//
//  Created by Edward Williams on 9/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OWPayloadConnection.h"
#import "OWPayloadView.h"
#import "OWPayloadViewFactory.h"
#import "OWAddPayloadViewController.h"
#import "OWAnnotation.h"

@interface OWPointDetailViewController : UIViewController <OWConnectionDelegate>{
    
    OWPayloadConnection *payloadConnection;
    
    IBOutlet OWPayloadView *payloadView;
    
    IBOutlet UIButton *dismissButton;
    IBOutlet UIButton *addPayloadButton;
    IBOutlet UIButton *nextPayloadButton;
    int payloadType;
    
    OWAddPayloadViewController *addPayloadViewController;
    
    OWAnnotation *currentAnnotation;
    
    int numberOfPayloads;
    int curPayloadIndex;
    
    IBOutlet UIActivityIndicatorView *activityView;
}

@property (nonatomic, retain) OWPayloadConnection *payloadConnection;
@property (nonatomic, retain) OWPayloadView *payloadView;
@property (nonatomic, retain) IBOutlet UIButton *dismissButton;
@property (nonatomic, retain) OWAddPayloadViewController *addPayloadViewController;
@property (nonatomic, retain) OWAnnotation *currentAnnotation;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *activityView;

- (BOOL) getPayload: (NSString *) pointKey: (NSString *) dataTypeKey: (int) payloadIndex;

- (IBAction) dismissView;
- (IBAction) addPayload;
- (void) switchPayload;
- (IBAction) nextAction;
@end
