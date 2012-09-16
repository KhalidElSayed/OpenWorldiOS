//
//  OWConnectionDelegate.h
//  OpenWorldiOS
//
//  Created by Edward Williams on 9/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol OWConnectionDelegate <NSObject>
- (void) finishedUpdatingPoints :(NSArray *) array;
- (void) connectionFailed: (NSError *) error;
@end
