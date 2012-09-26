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
#import "OWPointDetailViewControllerDelegate.h"
@interface OWPointDetailViewController : UIViewController <OWConnectionDelegate>{
    
    OWPayloadConnection *payloadConnection;
    
    IBOutlet OWPayloadView *payloadView;
    
    IBOutlet UIButton *dismissButton;
    IBOutlet UIButton *addPayloadButton;
    IBOutlet UIButton *nextPayloadButton;
    IBOutlet UILabel *creatorLabel;
    int payloadType;
    IBOutlet UIButton *flagButton;
    
    OWAddPayloadViewController *addPayloadViewController;
    
    OWAnnotation *currentAnnotation;
    
    int numberOfPayloads;
    int curPayloadIndex;
    
    NSString *currentPayloadString;
    
    IBOutlet UIActivityIndicatorView *activityView;
    
    id <OWPointDetailViewControllerDelegate> delegate;
}

@property (nonatomic, retain) OWPayloadConnection *payloadConnection;
@property (nonatomic, retain) OWPayloadView *payloadView;
@property (nonatomic, retain) IBOutlet UIButton *dismissButton;
@property (nonatomic, retain) OWAddPayloadViewController *addPayloadViewController;
@property (nonatomic, retain) OWAnnotation *currentAnnotation;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *activityView;
@property (nonatomic, retain) IBOutlet UILabel *creatorLabel;
@property (nonatomic, retain) IBOutlet UIButton *flagButton;
@property (nonatomic, retain) id <OWPointDetailViewControllerDelegate> delegate;

- (BOOL) getPayload: (NSString *) pointKey: (NSString *) dataTypeKey: (int) payloadIndex;

- (IBAction) dismissView;
- (IBAction) addPayload;
- (void) switchPayload;
- (IBAction) nextAction;
- (IBAction) flagAction;
@end
