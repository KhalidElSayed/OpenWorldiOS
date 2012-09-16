//
//  OWDataTypeProvider.h
//  OpenWorldiOS
//
//  Created by Edward Williams on 9/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OWDataTypeProviderDelegate.h"
#import "OWConnection.h"
@interface OWDataTypeProvider : OWConnection
{

}

/**
 Attempts to open a connection to the OWServer and recieve the data types available
 @returns YES if connection made, NO if connection was not made
 */
- (id) init: (NSString *) urlString;
@end
