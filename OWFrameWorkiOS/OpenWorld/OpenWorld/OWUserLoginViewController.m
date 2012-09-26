//
//  OWUserLoginViewController.m
//  OpenWorldiOS
//
//  Created by Edward Williams on 9/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OWUserLoginViewController.h"
#import "OWManager.h"
@interface OWUserLoginViewController ()

@end

@implementation OWUserLoginViewController
@synthesize userNameTextField,userPasswordTextField,createUserViewController,userLoginConnection;
@synthesize delegate;


- (void) userCreated: (NSString *) userName: (NSString * ) userEmail: (NSString *) userKey{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    [delegate newUserAuthenticated:userName :userEmail :userKey];
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
        [delegate newUserAuthenticated:userName :userEmail :userKey];

     }
    else{
        [self displayErrorMessage];
    }
    
}

- (void) displayErrorMessage{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error Loging In" message:@"Your user name cannot be found. Please create a new user." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alert show];
    
}

- (BOOL) textFieldShouldReturn:(UITextField*)textField {
    [textField resignFirstResponder];
    return YES;
}
- (IBAction) createAction{
    
 
    if (createUserViewController == nil) {
        [self setCreateUserViewController:[[OWCreateUserViewController alloc] initWithNibName:@"OWCreateUserViewController" bundle:[OWManager frameworkBundle]]];
        [createUserViewController setDelegate:self];
    }
    [self presentViewController:createUserViewController animated:YES completion:nil];
 
}
- (IBAction) loginAction{

    [userLoginConnection startConnection:[userNameTextField text] :[userPasswordTextField text]];
}



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        [self setUserLoginConnection:[[OWUserLoginConnection alloc] init:@"http://openworldserver.appspot.com/userLogin"]];
        [userLoginConnection setDelegate:self];
 
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
