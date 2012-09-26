//
//  OWNewUserViewController.m
//  OpenWorldiOS
//
//  Created by Edward Williams on 9/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OWCreateUserViewController.h"
#import "OWManager.h"
@interface OWCreateUserViewController ()

@end

@implementation OWCreateUserViewController
@synthesize createUserConnection,emailTextField,nameTextField,passwordTextField;
@synthesize delegate;
- (BOOL) textFieldShouldReturn:(UITextField*)textField {
    [textField resignFirstResponder];
    return YES;
}
- (IBAction) registerAction{
    [createUserConnection startConnection:[nameTextField text] :[emailTextField text]];
}

- (void) connectionFailed: (NSError *) error{
   // [self dismissModalViewControllerAnimated:YES];

}
- (void) finishedUpdatingPoints: (NSObject *) arrayOrDictionary{
    NSDictionary *doneDictionary = (NSDictionary *) arrayOrDictionary;
    NSString *userKey = [doneDictionary objectForKey:@"key"];
    NSString *userName = [doneDictionary objectForKey:@"name"];
    NSString *userEmail = [doneDictionary objectForKey:@"email"];
    NSString *errorCode = [doneDictionary objectForKey:@"error"];
    
    if (errorCode == nil) {        
        
        [self dismissViewControllerAnimated:YES completion:nil];
        [delegate userCreated:userName :userEmail :userKey];
     }
    else{
        [self displayErrorMessage];
    }

}

- (void) displayErrorMessage{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error Creating New User" message:@"A user with this name already exists" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        [self setCreateUserConnection:[[OWCreateUserConnection alloc] init:@"http://openworldserver.appspot.com/addUser"]];
        [createUserConnection setDelegate:self];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
 
    

    
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
