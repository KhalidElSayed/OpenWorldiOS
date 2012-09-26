//
//  OWUserLoginViewController.h
//  OpenWorldiOS
//
//  Created by Edward Williams on 9/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OWCreateUserViewController.h"
#import "OWUserLoginConnection.h"
#import "OWCreateUserViewControllerDelegate.h"
#import "OWUserLoginViewControllerDelegate.h"

@interface OWUserLoginViewController : UIViewController <OWConnectionDelegate, UITextFieldDelegate, OWCreateUserViewControllerDelegate>{
    IBOutlet UITextField *userNameTextField;
    IBOutlet UITextField *userPasswordTextField;
    
    OWUserLoginConnection *userLoginConnection;
    OWCreateUserViewController *createUserViewController;
    
    id <OWUserLoginViewControllerDelegate> delegate;
}
@property (nonatomic, retain) IBOutlet UITextField *userNameTextField;
@property (nonatomic, retain) IBOutlet UITextField *userPasswordTextField;

@property (nonatomic, retain) OWUserLoginConnection *userLoginConnection;
@property (nonatomic, retain) OWCreateUserViewController *createUserViewController;
@property (nonatomic, retain) id <OWUserLoginViewControllerDelegate> delegate;

- (IBAction) createAction;
- (IBAction) loginAction;
@end
