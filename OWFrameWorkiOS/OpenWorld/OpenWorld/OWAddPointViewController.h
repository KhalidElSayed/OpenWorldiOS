//
//  OWAddPointViewController.h
//  OpenWorldiOS
//
//  Created by Edward Williams on 9/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OWConnectionDelegate.h"
#import "OWAddPointsConnection.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h> 

@interface OWAddPointViewController : UIViewController <OWConnectionDelegate, UITextFieldDelegate> {
    IBOutlet UITextField *titleTextField;
    IBOutlet UITextField *subtitleTextField;
    
    OWAddPointsConnection *addPointsConnection;
    
    NSString *dataKeyString;
    NSString *creatorString;

    CLLocation *userLocation;
}

- (IBAction) cancelAction;
- (IBAction) addAction;

@property (nonatomic, retain) IBOutlet UITextField *titleTextField;
@property (nonatomic, retain) IBOutlet UITextField *subtitleTextField;
@property (nonatomic, retain) OWAddPointsConnection *addPointsConnection;

@property (nonatomic, retain) NSString *dataKeyString;
@property (nonatomic, retain) NSString *creatorString;

@property (nonatomic, retain) CLLocation *userLocation;
@end
