//
//  OWAppDelegate.h
//  OWiOSClient
//
//  Created by Edward Williams on 9/24/12.
//  Copyright (c) 2012 Edward Williams. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface OWClientAppDelegate : UIResponder{
    OWManager *openWorldManager;
    UIWindow *window;
 }
@property (nonatomic, retain) OWManager *openWorldManager;
@property (nonatomic, retain) UIWindow *window;
@end
