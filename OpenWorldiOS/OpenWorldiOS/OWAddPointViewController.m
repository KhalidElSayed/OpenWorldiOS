//
//  OWAddPointViewController.m
//  OpenWorldiOS
//
//  Created by Edward Williams on 9/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OWAddPointViewController.h"

@interface OWAddPointViewController ()

@end

@implementation OWAddPointViewController

@synthesize addPointsConnection,titleTextField,subtitleTextField,dataKeyString,creatorString,userLocation;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [self setAddPointsConnection:[[OWAddPointsConnection alloc] init:@"http://openworldserver.appspot.com/addPoint"]];
        [addPointsConnection setDelegate:self];
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
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
 
    [textField resignFirstResponder];
     return YES;
}
- (IBAction) cancelAction{
    [self dismissModalViewControllerAnimated:YES];
}
- (IBAction) addAction{
    [addPointsConnection startConnection:userLocation.coordinate.latitude :userLocation.coordinate.longitude :dataKeyString :creatorString :titleTextField.text :subtitleTextField.text];

}

- (void) finishedUpdatingPoints :(NSObject *) arrayOrDictionary{
    NSDictionary *doneDictionary = (NSDictionary *) arrayOrDictionary;
    NSString *pointKey = [doneDictionary objectForKey:@"pointkey"];
    [self dismissModalViewControllerAnimated:YES];
    //TODO: add to Users's created points list
    
}
- (void) connectionFailed: (NSError *) error{

}

@end
