//
//  OWConnection.h
//  OpenWorldiOS
//
//  Created by Edward Williams on 9/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OWConnectionDelegate.h"
@interface OWConnection : NSObject{
    NSURLConnection *getDataConnection;  /**< Connection to OWServer */
    NSMutableData *receivedData; /**< Data recieved from OWServer  */
    NSString *owURLString;  /**< Constant specifiying URL of OWServer  */
    id <OWConnectionDelegate> delegate;

}

- (id) init: (NSString *) urlString;
- (BOOL) startConnection;

@property (nonatomic, retain) NSURLConnection *getDataConnection;  /**< Connection to OWServer */
@property (nonatomic, retain) NSMutableData *receivedData; /**< Data recieved from OWServer  */
@property (nonatomic, retain) NSString *owURLString;  /**< Constant specifiying URL of OWServer  */
@property (nonatomic, retain) id <OWConnectionDelegate> delegate;


@end
