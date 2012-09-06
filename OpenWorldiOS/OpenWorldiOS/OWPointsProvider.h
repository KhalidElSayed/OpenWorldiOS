/**
 OWDataProvider class connects to a OWServer to get the dataPoints near the user. The app can search for dataPoints of a specific dataID. This class recieves updates from the OWAppDelegate when an updated list of data points is required.
 
 
 Created by Edward Williams on 8/30/12.
 TODO: Open source stuff
 */

#import <MapKit/MapKit.h>

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h> 
#import "OWPointsProviderDelegate.h"
#define kMaxResults   199    /**< Maximum number of results*/

@interface OWPointsProvider : NSObject
{

     NSURLConnection *getDataPointsConnection;  /**< Connection to OWServer */
    NSMutableData *receivedData; /**< Data recieved from OWServer  */
    NSString *owDataURLString;  /**< Constant specifiying URL of OWServer  */
 	CLLocationCoordinate2D locations[kMaxResults]; 
    id <OWPointsProviderDelegate> delegate;
    
    NSArray *dataArray;
}

@property (nonatomic, retain) 	NSURLConnection *getDataPointsConnection;	
@property (nonatomic, retain) NSMutableData *receivedData;
@property (retain, nonatomic) id <OWPointsProviderDelegate> delegate;
@property (retain, nonatomic) NSArray *dataArray;

/**
 Attempts to open a connection to the OWServer and recieve the dataPoints that are within the user's map region.
 @returns YES if connection made, NO if connection was not made
 */
- (BOOL) updatePointList: (MKCoordinateRegion) userRegion;

- (id) init: (NSString *) dataUrlString;
@end
