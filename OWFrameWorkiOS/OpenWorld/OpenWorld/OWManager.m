//
//  OWAppDelegate.m
//  OpenWorldiOS
//
//  Created by Edward Williams on 8/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OWManager.h"
#import "OWMapViewController.h"
 @implementation OWManager

 @synthesize currentUser,mapViewController,pointsConnection;


- (void) updatePoints: (MKCoordinateRegion) region{
    [pointsConnection startConnection:region];
}
- (void) changeCurrentDataType: (OWDataType *) type{
    [pointsConnection setDataType:type];
    [pointsConnection startConnection:[[mapViewController owMapView] region]];
}

- (NSString *) getCurrentDataTypeKeyString{
    return [[pointsConnection dataType] key];
}
- (NSString *) getCurrentUserKeyString{
    return [currentUser userKey];
}

- (void) changeCurrentUser: (NSString *) userName: (NSString * ) userEmail: (NSString *) userKey{
    
    [self setCurrentUser:[[OWUser alloc] init]];
    currentUser.emailAddress = userEmail;
    currentUser.userName = userName;
    currentUser.userKey = userKey;
    
}
- (void) finishedUpdatingPoints: (NSObject *) arrayOrDictionary{
    if (arrayOrDictionary) {
        NSArray *array = (NSArray *) arrayOrDictionary;
        [mapViewController updateMapView:array];
     }
}
- (void) connectionFailed: (NSError *) error{
    
}
- (MKCoordinateRegion) getUserRegion{
    return [[mapViewController owMapView] region];
   // return [[(OWMapViewController *) [[tabBarController viewControllers] objectAtIndex:0] mapView] region];
   // return MKCoordinateRegionMake(CLLocationCoordinate2DMake(37.77, -122.4), MKCoordinateSpanMake(.10, .10));
   // return MKCoordinateRegionMake(CLLocationCoordinate2DMake(0, 0), MKCoordinateSpanMake(0, 0));
}
- (void) updatePoints{
    [pointsConnection startConnection:[self getUserRegion]];
}
- (id) init{
    
     
    [self setMapViewController:[[OWMapViewController alloc] initWithNibName:@"MapViewController" bundle:[OWManager frameworkBundle]]];
    [mapViewController setDelegate:self];
     
    [self setPointsConnection:[[OWPointsConnection alloc] init:@"http://openworldserver.appspot.com"]];
    [pointsConnection setDelegate:self];
    [pointsConnection startConnection:[self getUserRegion]];
 
    
    
    return self;
}
+ (NSBundle *)frameworkBundle {
    static NSBundle* frameworkBundle = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        NSString* mainBundlePath = [[NSBundle mainBundle] resourcePath];
        NSString* frameworkBundlePath = [mainBundlePath stringByAppendingPathComponent:@"OpenWorld.bundle"];
        frameworkBundle = [NSBundle bundleWithPath:frameworkBundlePath];
    });
    return frameworkBundle;
}

@end
