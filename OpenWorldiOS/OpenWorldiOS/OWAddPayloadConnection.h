//
//  OWAddPayloadProvider.h
//  OpenWorldiOS
//
//  Created by Edward Williams on 9/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OWConnection.h"
#import "OWAppDelegate.h"
@interface OWAddPayloadConnection : OWConnection{
    NSString *mPointKey;
    NSString *mTextPayload;
    UIImage *mImagePayload;
    int mPayloadType;
    NSString *mCreatorKey;
}
- (BOOL) startConnection: (NSString *) pointKey: (NSString *) creatorKey: (UIImage *) imagePayload: (NSString *) textPayload: (int) payloadType;

@property (nonatomic, retain) NSString *mPointKey;
@property (nonatomic, retain) NSString *mTextPayload;
@property (nonatomic, retain) UIImage *mImagePayload;
@property int mPayloadType;
@property (nonatomic, retain) NSString *mCreatorKey;

@end
