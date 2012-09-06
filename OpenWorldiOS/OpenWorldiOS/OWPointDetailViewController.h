//
//  OWDataDetailViewControllerViewController.h
//  OpenWorldiOS
//
//  Created by Edward Williams on 9/1/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OWPayloadProviderDelegate.h"
#import "OWPayloadProvider.h"
#import "OWPayloadView.h"
#import "OWPayloadViewFactory.h"
@interface OWPointDetailViewController : UIViewController <OWPayloadProviderDelegate>{
    
    OWPayloadProvider *payloadProvider;
    
    IBOutlet OWPayloadView *payloadView;
    
    IBOutlet UIButton *dismissButton;
    int payloadType;
    
}

@property (nonatomic, retain) OWPayloadProvider *payloadProvider;
@property (nonatomic, retain) OWPayloadView *payloadView;
@property (nonatomic, retain) IBOutlet UIButton *dismissButton;

- (BOOL) getPayload: (NSString *) pointKey: (int) payloadIndex;

- (IBAction) dismissView;
- (void) switchPayload;
@end
