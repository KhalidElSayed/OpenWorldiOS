//
//  OWDataTypeProvider.h
//  OpenWorldiOS
//
//  Created by Edward Williams on 9/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OWDataTypeProviderDelegate.h"

@interface OWDataTypeProvider : NSObject
{
    NSURLConnection *getDataTypesConnection;  /**< Connection to OWServer */
    NSMutableData *receivedData; /**< Data recieved from OWServer  */
    NSString *owDataTypeURLString;  /**< Constant specifiying URL of OWServer  */
     id <OWDataTypeProviderDelegate> delegate;

    NSArray *dataArray;
}

@property (nonatomic, retain) 	NSURLConnection *getDataTypesConnection;	
@property (nonatomic, retain) NSMutableData *receivedData;
@property (retain, nonatomic) id <OWDataTypeProviderDelegate> delegate;
@property (retain, nonatomic) NSArray *dataArray;

/**
 Attempts to open a connection to the OWServer and recieve the data types available
 @returns YES if connection made, NO if connection was not made
 */
- (BOOL) updateDataTypeList;
- (id) init: (NSString *) urlString;
@end
