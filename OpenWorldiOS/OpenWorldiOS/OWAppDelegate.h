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
#import "OWPointsProviderDelegate.h"
#import "OWPointsProvider.h"
@interface OWAppDelegate : UIResponder <UIApplicationDelegate, OWPointsProviderDelegate>{
    UIWindow *window;
    UITabBarController *tabBarController;
    OWPointsProvider *dataProvider;
}
typedef enum {
    OWPayloadTypeText,
    OWPayloadTypeImage
} OWPayloadType;

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;
@property (nonatomic, retain) OWPointsProvider *dataProvider;

- (MKCoordinateRegion) getUserRegion;

@end
