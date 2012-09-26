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
#import "OWUser.h"
#import "OWMapViewController.h"
#import "OWMapViewControllerDelegate.h"

@interface OWManager : NSObject <OWConnectionDelegate,OWMapViewControllerDelegate>{
      OWPointsConnection *pointsConnection;
    OWUser *currentUser;
    
    OWMapViewController *mapViewController;
}

typedef enum {
    OWPayloadTypeText,
    OWPayloadTypeImage
} OWPayloadType;



+ (NSBundle *)frameworkBundle;

 @property (nonatomic, retain) OWMapViewController *mapViewController;
@property (nonatomic, retain) OWPointsConnection *pointsConnection;
@property (nonatomic, retain) OWUser *currentUser;

- (MKCoordinateRegion) getUserRegion;
- (void) updatePoints;
- (void) changeCurrentUser: (NSString *) userName: (NSString * ) userEmail: (NSString *) userKey;
@end
