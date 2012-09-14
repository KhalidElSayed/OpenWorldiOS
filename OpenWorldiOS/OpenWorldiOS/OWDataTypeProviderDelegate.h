//
//  OWDataTypeProviderDelegate.h
//  OpenWorldiOS
//
//  Created by Edward Williams on 9/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol OWDataTypeProviderDelegate <NSObject>
- (void) finishedUpdatingPoints :(NSArray *) array;

@end
