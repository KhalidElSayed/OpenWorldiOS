//
//  OWAppDelegate.m
//  OpenWorldiOS
//
//  Created by Edward Williams on 8/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OWAppDelegate.h"
#import "OWMapViewController.h"
 @implementation OWAppDelegate

@synthesize window;
@synthesize currentUser,dataTypeSelectViewController,tabBarController,pointsConnection,userLoginViewController;
- (void) changeCurrentUser: (NSString *) userName: (NSString * ) userEmail: (NSString *) userKey{
    
    [self setCurrentUser:[[OWUser alloc] init]];
    currentUser.emailAddress = userEmail;
    currentUser.userName = userName;
    currentUser.userKey = userKey;
    
}
- (void) finishedUpdatingPoints: (NSObject *) arrayOrDictionary{
    if (arrayOrDictionary) {
        NSArray *array = (NSArray *) arrayOrDictionary;
        [(OWMapViewController *) [[tabBarController viewControllers] objectAtIndex:0] updateMapView:array];
    }
}
- (void) connectionFailed: (NSError *) error{
    
}
- (MKCoordinateRegion) getUserRegion{
    return [[(OWMapViewController *) [[tabBarController viewControllers] objectAtIndex:0] mapView] region];
   // return MKCoordinateRegionMake(CLLocationCoordinate2DMake(37.77, -122.4), MKCoordinateSpanMake(.10, .10));
   // return MKCoordinateRegionMake(CLLocationCoordinate2DMake(0, 0), MKCoordinateSpanMake(0, 0));
}
- (void) updatePoints{
    [pointsConnection startConnection:[self getUserRegion]];
}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  //  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
   // self.window.backgroundColor = [UIColor whiteColor];
    
    //[window addSubview:[tabBarController view]];
    
    
    [self.window makeKeyAndVisible];
    
    [self setPointsConnection:[[OWPointsConnection alloc] init:@"http://openworldserver.appspot.com"]];
    [pointsConnection setDelegate:self];
    [pointsConnection startConnection:[self getUserRegion]];
    
    
    [self setDataTypeSelectViewController:[[OWDataTypeSelectViewController alloc] initWithNibName:@"OWDataTypeSelectViewController" bundle:nil]];
    [dataTypeSelectViewController updateDataTypes];
    
    [self loginUser];
    
    
    return YES;
}

- (void) loginUser{
    if (userLoginViewController == nil) {
        [self setUserLoginViewController:[[OWUserLoginViewController alloc] initWithNibName:@"OWUserLoginViewController" bundle:nil]];
    }
    [[tabBarController selectedViewController] presentModalViewController:userLoginViewController animated:YES];
}
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
