//
//  OWAppDelegate.h
//  OpenWorldiOS
//
//  Created by Edward Williams on 8/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h> 
#import <MapKit/MapKit.h>
#import "OWPointsConnection.h"
#import "OWDataTypeSelectViewController.h"
#import "OWUser.h"

@interface OWAppDelegate : UIResponder <UIApplicationDelegate, OWConnectionDelegate>{
    UIWindow *window;
    UITabBarController *tabBarController;
    OWPointsConnection *pointsConnection;
    OWDataTypeSelectViewController *dataTypeSelectViewController;
    OWUser *currentUser;
}
typedef enum {
    OWPayloadTypeText,
    OWPayloadTypeImage
} OWPayloadType;

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;
@property (nonatomic, retain) OWPointsConnection *pointsConnection;
@property (nonatomic, retain) OWDataTypeSelectViewController *dataTypeSelectViewController;
@property (nonatomic, retain) OWUser *currentUser;
- (MKCoordinateRegion) getUserRegion;
- (void) updatePoints;
@end
