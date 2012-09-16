//
//  OWAddPointViewController.h
//  OpenWorldiOS
//
//  Created by Edward Williams on 9/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OWAddPointViewController : UIViewController{
    IBOutlet UITextField *titleTextField;
    IBOutlet UITextField *subtitleTextField;
    
}

- (IBAction) cancelAction;
- (IBAction) addAction;

@property (nonatomic, retain) IBOutlet UITextField *titleTextField;
@property (nonatomic, retain) IBOutlet UITextField *subtitleTextField;

@end
