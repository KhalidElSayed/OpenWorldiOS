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

@interface OWAppDelegate : UIResponder <UIApplicationDelegate, OWConnectionDelegate>{
    UIWindow *window;
    UITabBarController *tabBarController;
    OWPointsConnection *pointsConnection;
    OWDataTypeSelectViewController *dataTypeSelectViewController;
    
}
typedef enum {
    OWPayloadTypeText,
    OWPayloadTypeImage
} OWPayloadType;

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;
@property (nonatomic, retain) OWPointsConnection *pointsConnection;
@property (nonatomic, retain) OWDataTypeSelectViewController *dataTypeSelectViewController;

- (MKCoordinateRegion) getUserRegion;
- (void) updatePoints;
@end
