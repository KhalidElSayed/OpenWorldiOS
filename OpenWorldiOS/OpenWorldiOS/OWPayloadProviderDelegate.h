//
//  OWPayloadProviderDelegate.h
//  OpenWorldiOS
//
//  Created by Edward Williams on 9/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OWAppDelegate.h"

@protocol OWPayloadProviderDelegate <NSObject>
- (void) finishedRetrievingPayload :(NSString *) payload: (OWPayloadType) type;

@end
