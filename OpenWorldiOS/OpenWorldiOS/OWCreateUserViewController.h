//
//  OWNewUserViewController.h
//  OpenWorldiOS
//
//  Created by Edward Williams on 9/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OWConnection.h"
#import "OWCreateUserConnection.h"

@interface OWCreateUserViewController : UIViewController <OWConnectionDelegate, UITextFieldDelegate>     {
    
    OWCreateUserConnection *createUserConnection;
    
    IBOutlet UITextField *nameTextField;
    IBOutlet UITextField *emailTextField;
    IBOutlet UITextField *passwordTextField;
}

@property (nonatomic, retain) OWCreateUserConnection *createUserConnection;

@property (nonatomic, retain) IBOutlet UITextField *nameTextField;
@property (nonatomic, retain) IBOutlet UITextField *emailTextField;
@property (nonatomic, retain) IBOutlet UITextField *passwordTextField;

- (IBAction) registerAction;
@end
