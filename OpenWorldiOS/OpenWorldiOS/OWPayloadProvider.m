//
//  OWPayloadProvider.m
//  OpenWorldiOS
//
//  Created by Edward Williams on 9/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OWPayloadProvider.h"

@implementation OWPayloadProvider
@synthesize payloadDictionary;

- (id) init: (NSString *) urlString{
    
    if(self = [super init:urlString]){
        mDataTypeKey = @"";
        mPointKey = @"";
        mPayloadIndex = -1;
    }
    
    return self;
}
- (NSData *) connectionInputData{
    
    return [[NSString stringWithFormat:@"key=%@&datatype=%@&payloadIndex=%i",mPointKey,mDataTypeKey,mPayloadIndex] dataUsingEncoding:NSUTF8StringEncoding];
}

- (BOOL) startConnection: (NSString *) pointKey: (NSString *) dataTypeKey: (int) payloadIndex{
    mPointKey = pointKey;
    mDataTypeKey = dataTypeKey;
    mPayloadIndex = payloadIndex;
    return [self startConnection];
    
}


@end
