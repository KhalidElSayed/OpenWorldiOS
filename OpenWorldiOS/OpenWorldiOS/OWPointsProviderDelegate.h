//
//  OWDataProviderDelegate.h
//  OpenWorldiOS
//
//  Created by Edward Williams on 8/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol OWPointsProviderDelegate <NSObject>
- (void) finishedUpdatingPoints :(NSArray *) array;
@end
