//
//  OpenWorldiOSTests.h
//  OpenWorldiOSTests
//
//  Created by Edward Williams on 8/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>

#import "OWAppDelegate.h"
#import "OWPointsConnection.h"

@interface OpenWorldiOSTests : SenTestCase <OWPointsProviderDelegate>{
    OWAppDelegate *mainDelegate;
    OWPointsConnection *owDataProvider;
    NSArray * dataArray;
}

@end
