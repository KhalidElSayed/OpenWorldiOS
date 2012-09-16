//
//  OWAddPayloadViewController.h
//  OpenWorldiOS
//
//  Created by Edward Williams on 9/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OWAddPayloadViewController : UIViewController{
    IBOutlet UILabel *titleLabel;
    IBOutlet UILabel *subtitleLabel;
    IBOutlet UISegmentedControl *payloadTypeControl;
    IBOutlet UITextView *textPayload;
    IBOutlet UIImageView *imageViewPayload;
    IBOutlet UIButton *cameraButton;
}

- (IBAction) cameraAction;
- (IBAction) swichPayloadType;
- (IBAction) cancelAction;
- (IBAction) addAction;


@property (nonatomic, retain) IBOutlet UILabel *titleLabel;
@property (nonatomic, retain) IBOutlet UILabel *subtitleLabel;
@property (nonatomic, retain) IBOutlet UISegmentedControl *payloadTypeControl;
@property (nonatomic, retain) IBOutlet UITextView *textPayload;
@property (nonatomic, retain) IBOutlet UIImageView *imageViewPayload;
@property (nonatomic, retain) IBOutlet UIButton *cameraButton;
@end
