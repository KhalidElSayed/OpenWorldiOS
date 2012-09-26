//
//  OWAddPointsProvider.h
//  OpenWorldiOS
//
//  Created by Edward Williams on 9/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OWConnection.h"

@interface OWAddPointsConnection : OWConnection{
    int mLat;
    int mLon;
    NSString *mTitle;
    NSString *mSubtitle;
    NSString *mDataTypeKey;
    NSString *mCreatorKey;
}
@property int mLat;
@property int mLon;
@property (nonatomic, retain) NSString *mTitle;
@property (nonatomic, retain) NSString *mSubtitle;
@property (nonatomic, retain) NSString *mDataTypeKey;
@property (nonatomic, retain) NSString *mCreatorKey;

- (BOOL) startConnection:(int) lat: (int) lon: (NSString *) dataTypeKey: (NSString *) creatorKey: (NSString *) title: (NSString *) subtitle;
@end
