//
//  OWPayloadProvider.h
//  OpenWorldiOS
//
//  Created by Edward Williams on 9/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OWConnection.h"
@interface OWPayloadConnection : OWConnection{

    NSDictionary *payloadDictionary;
    NSString *mPointKey;
    int mPayloadIndex;
    NSString *mDataTypeKey;

}

@property (nonatomic, retain) NSDictionary *payloadDictionary;

- (BOOL) startConnection: (NSString *) pointKey: (NSString *) dataTypeKey: (int) payloadIndex;
@end
