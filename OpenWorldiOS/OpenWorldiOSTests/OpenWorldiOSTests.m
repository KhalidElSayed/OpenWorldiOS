//
//  OpenWorldiOSTests.m
//  OpenWorldiOSTests
//
//  Created by Edward Williams on 8/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OpenWorldiOSTests.h"
#import <CoreLocation/CoreLocation.h> 
#import <MapKit/MapKit.h>

@implementation OpenWorldiOSTests

- (void)setUp
{
    [super setUp];
    mainDelegate = [[UIApplication sharedApplication] delegate];
    owDataProvider = [[OWPointsProvider alloc] init:@"http://10.latest.geo-tag.appspot.com/getall"];
    [owDataProvider setDelegate:self];
     // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

/*
 
 This test is testing hte OWDataProvider object and the server's handling of the request and the server response
 */

- (void) testDataProvider{
    if(![owDataProvider updatePointList:MKCoordinateRegionMake(CLLocationCoordinate2DMake(37.77, -122.4), MKCoordinateSpanMake(.10, .10))])
        STFail(@"updatePointList failed");
    
    NSDate *fiveSecondsFromNow = [NSDate dateWithTimeIntervalSinceNow:10.0];

    [[NSRunLoop currentRunLoop] runUntilDate:fiveSecondsFromNow];
    STAssertTrue(dataArray != nil, @"delegate callback completed");
   // STAssertTrue([[owDataProvider dataArray] count] > 0, @"json parsing worked correctly to load result into array" );

    
}

- (void)testExample
{
 //   STFail(@"Unit tests are not implemented yet in OpenWorldiOSTests");
}


- (void) finishedUpdatingPoints:(NSArray *) array{
    dataArray = array;
    if(dataArray)
        NSLog(@"YES");
    NSLog(@"Delegatefinished");
}
 

@end
