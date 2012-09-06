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
#import "OWPointDetailViewController.h"


@interface OWMapViewController : UIViewController <MKMapViewDelegate>{
    MKMapView *mapView;
    OWPointDetailViewController *detailViewController;
}
@property (nonatomic,retain) IBOutlet MKMapView *mapView;
@property (nonatomic, retain) OWPointDetailViewController *detailViewController;

- (void) updateMapView: (NSArray *) array;
- (IBAction) payloadTypeButton;
 @end
