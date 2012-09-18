//
//  OWAddPointsProvider.m
//  OpenWorldiOS
//
//  Created by Edward Williams on 9/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OWAddPointsConnection.h"

@implementation OWAddPointsConnection
@synthesize mLat,mLon,mDataTypeKey,mCreatorKey,mTitle,mSubtitle;
- (NSData *) connectionInputData{
    
    return [[NSString stringWithFormat:@"lat=%i&lon=%i&title=%@&subtitle=%@&dataTypeKey=%@&creatorKey=%@",mLat,mLon,mTitle,mSubtitle,mDataTypeKey,mCreatorKey] dataUsingEncoding:NSUTF8StringEncoding];
}

- (BOOL) startConnection: (int) lat: (int) lon: (NSString *) dataTypeKey: (NSString *) creatorKey: (NSString *) title: (NSString *) subtitle{

    mLat = lat;
    mLon = lon;
    mDataTypeKey = dataTypeKey;
    mCreatorKey = creatorKey;
    mTitle = title;
    mSubtitle = subtitle;
    return [self startConnection];
    
}
@end
