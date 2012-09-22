//
//  OWUserLoginViewController.m
//  OpenWorldiOS
//
//  Created by Edward Williams on 9/19/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OWUserLoginViewController.h"
#import "OWAppDelegate.h"
@interface OWUserLoginViewController ()

@end

@implementation OWUserLoginViewController
@synthesize userNameTextField,userPasswordTextField,createUserViewController,userLoginConnection;
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
        OWAppDelegate *mainDelegate = (OWAppDelegate *) [[UIApplication sharedApplication] delegate];
        
        [mainDelegate changeCurrentUser:userName :userEmail :userKey];
        
        
        [self dismissModalViewControllerAnimated:NO];
        [[mainDelegate userLoginViewController] dismissModalViewControllerAnimated:YES];
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
        [self setCreateUserViewController:[[OWCreateUserViewController alloc] initWithNibName:@"OWCreateUserViewController" bundle:nil]];
    }
    [self presentModalViewController:createUserViewController animated:YES];
 
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
