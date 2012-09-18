//
//  OWDataProvider.m
//  OpenWorldiOS
//
//  Created by Edward Williams on 8/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "OWPointsConnection.h"
#import "OWAppDelegate.h"

@implementation OWPointsConnection
@synthesize dataType;

- (id) init: (NSString *) urlString{
    
    if(self = [super init:urlString]){
        dataType = [[OWDataType alloc] init];
        dataType.name = @"";
        dataType.key = @"";
        currentRegion = MKCoordinateRegionMake(CLLocationCoordinate2DMake(0, 0),MKCoordinateSpanMake(1, 1 ));
    }
    
    return self;
}

- (NSData *) connectionInputData{
    
    double latSpan = currentRegion.span.latitudeDelta;
    double lonSpan = currentRegion.span.longitudeDelta;
    double lat = currentRegion.center.latitude;
    double lon = currentRegion.center.longitude;
    NSLog([NSString stringWithFormat:@"lat=%f&lon=%f&latspan=%f&lonspan=%f&datatype=ahFzfm9wZW53b3JsZHNlcnZlcnISCxIKT1dEYXRhVHlwZRiayAIM",lat,lon,latSpan,lonSpan] );
    
     return  [[NSString stringWithFormat:@"lat=%f&lon=%f&latspan=%f&lonspan=%f&datatype=%@",lat,lon,latSpan,lonSpan,dataType.key] dataUsingEncoding:NSUTF8StringEncoding];  
     
}

- (BOOL) startConnection:  (MKCoordinateRegion) userRegion{
    currentRegion = userRegion;
    return [self startConnection];
}

@end