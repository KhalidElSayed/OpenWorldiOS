//
//  OWPayloadProvider.h
//  OpenWorldiOS
//
//  Created by Edward Williams on 9/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OWPayloadProviderDelegate.h"
#import "OWAppDelegate.h"
@interface OWPayloadProvider : NSObject{
    NSString *owPayloadURLString;  /**< Constant specifiying URL of OWServer Payloads  */
    NSURLConnection *getPayloadConnection;  /**< Connection to OWServer */
    NSMutableData *receivedData; /**< Data recieved from OWServer  */
    id <OWPayloadProviderDelegate> delegate;
    NSDictionary *payloadDictionary;


}

@property (nonatomic, retain) 	NSString *owPayloadURLString;  /**< Constant specifiying URL of OWServer Payloads  */
@property (nonatomic, retain) 	NSURLConnection *getPayloadConnection;	
@property (nonatomic, retain) NSMutableData *receivedData;
@property (retain, nonatomic) id <OWPayloadProviderDelegate> delegate;
@property (nonatomic, retain) NSDictionary *payloadDictionary;

- (BOOL) getPayload: (NSString *) pointKey: (int) payloadIndex;
- (id) init: (NSString *) dataUrlString;

@end
