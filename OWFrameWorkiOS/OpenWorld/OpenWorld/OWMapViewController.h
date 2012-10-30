//
//  OWMapViewController.h
//  OpenWorldiOS
//
//  Created by Edward Williams on 8/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h> 
#import <MapKit/MapKit.h>
#import "OWDataTypeSelectViewController.h"
#import "OWDataTypeSelectViewControllerDelegate.h"
#import "OWMapViewControllerDelegate.h"
#import "OWPointDetailViewControllerDelegate.h"
#import "OWUserLoginViewController.h"
#import "OWUserLoginViewControllerDelegate.h"
@class OWAddPointViewController, OWPointDetailViewController;
@interface OWMapViewController : UIViewController <MKMapViewDelegate, OWDataTypeSelectViewControllerDelegate, OWPointDetailViewControllerDelegate,OWUserLoginViewControllerDelegate>{
    MKMapView *owMapView;
    OWPointDetailViewController *detailViewController;
    OWAddPointViewController *addPointViewController;
    OWDataTypeSelectViewController *dataTypeSelectViewController;
    id <OWMapViewControllerDelegate> delegate;
    OWUserLoginViewController *userLoginViewController;


}
@property (nonatomic,retain) IBOutlet MKMapView *owMapView;
@property (nonatomic, retain) OWPointDetailViewController *detailViewController;
@property (nonatomic, retain) OWAddPointViewController *addPointViewController;
@property (nonatomic, retain) OWDataTypeSelectViewController *dataTypeSelectViewController;
@property (nonatomic, retain) id <OWMapViewControllerDelegate> delegate;
@property (nonatomic, retain) OWUserLoginViewController *userLoginViewController;

- (IBAction) addPointAction;
- (void) updateMapView: (NSArray *) array;
- (IBAction) changeDataTypeAction;
 @end
