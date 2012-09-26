/**
 OWDataProvider class connects to a OWServer to get the dataPoints near the user. The app can search for dataPoints of a specific dataID. This class recieves updates from the OWAppDelegate when an updated list of data points is required.
 
 
 Created by Edward Williams on 8/30/12.
 TODO: Open source stuff
 */

#import <MapKit/MapKit.h>

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h> 
#import "OWDataType.h"
#import "OWConnection.h"
#define kMaxResults   199    /**< Maximum number of results*/

@interface OWPointsConnection : OWConnection
{

    	CLLocationCoordinate2D locations[kMaxResults]; 
     
    OWDataType *dataType;
    MKCoordinateRegion currentRegion;
}

@property (retain, nonatomic) OWDataType *dataType;

/**
 Attempts to open a connection to the OWServer and recieve the dataPoints that are within the user's map region.
 @returns YES if connection made, NO if connection was not made
 */
- (BOOL) startConnection:  (MKCoordinateRegion) userRegion;
@end
