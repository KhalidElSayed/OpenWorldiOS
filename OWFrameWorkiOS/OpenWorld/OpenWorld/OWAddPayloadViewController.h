//
//  OWAddPayloadViewController.h
//  OpenWorldiOS
//
//  Created by Edward Williams on 9/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OWConnectionDelegate.h"
#import "OWAddPayloadConnection.h"
@interface OWAddPayloadViewController : UIViewController <OWConnectionDelegate, UITextFieldDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate> {
    IBOutlet UILabel *titleLabel;
    IBOutlet UILabel *subtitleLabel;
    IBOutlet UISegmentedControl *payloadTypeControl;
    IBOutlet UITextView *textViewPayload;
    IBOutlet UIImageView *imageViewPayload;
    IBOutlet UIButton *cameraButton;
    IBOutlet UIButton *dismissKeyboardButton;
    
    OWAddPayloadConnection *addPayloadConnection;
    NSString *creatorKey;
    NSString *pointKey;
    int payloadType;
}

- (IBAction) cameraAction;
- (IBAction) swichPayloadType;
- (IBAction) cancelAction;
- (IBAction) addAction;
- (IBAction) dismissKeyboardAction;

@property (nonatomic, retain) IBOutlet UILabel *titleLabel;
@property (nonatomic, retain) IBOutlet UILabel *subtitleLabel;
@property (nonatomic, retain) IBOutlet UISegmentedControl *payloadTypeControl;
@property (nonatomic, retain) IBOutlet UITextView *textViewPayload;
@property (nonatomic, retain) IBOutlet UIImageView *imageViewPayload;
@property (nonatomic, retain) IBOutlet UIButton *cameraButton;
@property (nonatomic, retain) IBOutlet UIButton *dismissKeyboardButton;

@property (nonatomic, retain) OWAddPayloadConnection *addPayloadConnection;
@property (nonatomic, retain) NSString *creatorKey;
@property (nonatomic, retain) NSString *pointKey;
@property int payloadType;

@end
