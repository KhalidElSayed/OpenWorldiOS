//
//  OWDataProvider.m
//  OpenWorldiOS
//
//  Created by Edward Williams on 8/30/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//
#import "OWPointsProvider.h"
#import "OWAppDelegate.h"

@implementation OWPointsProvider
@synthesize dataArray,getDataPointsConnection,receivedData,delegate;

- (id) init: (NSString *) dataUrlString{
    
    if(self = [super init]){
        owDataURLString = dataUrlString;
    }
    
    return self;
}

- (BOOL) updatePointList: (MKCoordinateRegion) userRegion{
    
    //if connection already established, cancel before starting new one
    if (getDataPointsConnection) {
        [getDataPointsConnection cancel];
    }
    
    
    NSURL *dataUrl = [NSURL URLWithString:owDataURLString];
	NSMutableURLRequest *dataRequest = [NSMutableURLRequest requestWithURL:dataUrl];
    [dataRequest setHTTPMethod:@"POST"];
    NSString *contentType = [NSString stringWithFormat:@"application/x-www-form-urlencoded"];
    [dataRequest setValue:contentType forHTTPHeaderField:@"Content-type"];
    
    NSMutableData *postBody = [NSMutableData data];
    

    
    double latSpan = userRegion.span.latitudeDelta;
    double lonSpan = userRegion.span.longitudeDelta;
    double lat = userRegion.center.latitude;
    double lon = userRegion.center.longitude;
    NSLog([NSString stringWithFormat:@"lat=%f&lon=%f&latspan=%f&lonspan=%f&datatype=ahFzfm9wZW53b3JsZHNlcnZlcnIRCxIKT1dEYXRhVHlwZRiwRgw",lat,lon,latSpan,lonSpan] );

    [postBody appendData:[[NSString stringWithFormat:@"lat=%f&lon=%f&latspan=%f&lonspan=%f&datatype=ahFzfm9wZW53b3JsZHNlcnZlcnIRCxIKT1dEYXRhVHlwZRiwRgw",lat,lon,latSpan,lonSpan] dataUsingEncoding:NSUTF8StringEncoding]];    
    [dataRequest setHTTPBody:postBody];
    
    [self setGetDataPointsConnection:[[NSURLConnection alloc] initWithRequest:dataRequest delegate:self startImmediately:YES]];
    
    BOOL connectionStarted = NO;

    if(getDataPointsConnection){
        receivedData=[NSMutableData data];
        connectionStarted = YES;
    }
    return connectionStarted;
}
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    // this method is called when the server has determined that it
    // has enough information to create the NSURLResponse
	
    // it can be called multiple times, for example in the case of a
    // redirect, so each time we reset the data.
    // receivedData is declared as a method instance elsewhere
    [receivedData setLength:0];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    // append the new data to the receivedData
    // receivedData is declared as a method instance elsewhere
    [receivedData appendData:data];
}

- (void)connection:(NSURLConnection *)connection
  didFailWithError:(NSError *)error
{
 
    connection = nil;
    receivedData = nil;
    // inform the user
    NSLog(@"Connection failed! Error - %@ %@",
          [error localizedDescription],
          [[error userInfo] objectForKey:NSErrorFailingURLStringKey]);
	
	
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Connection Failed" message:@"Could not establish connection to the Virtual Graffiti database. Please verify you are connected to the internet and try again. " delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
	[alert show];
     
    [delegate finishedUpdatingPoints:nil];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // do something with the data
    // receivedData is declared as a method instance elsewhere
    //  NSLog(@"Succeeded! Received %d bytes of data",[receivedData length]);
	
 	
    // release the connection, and the data object
 
 
 	
	NSString * responseString =  [[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding];

	
    NSLog(responseString);
    //quick check for invalid response
	if([[responseString substringToIndex:1] compare:@"["] != 0  ){
		
        //if retryConnection is true, than we failed on a retry -- stop and show error msg
 
		
 
        responseString = nil;
        connection = nil;
        receivedData = nil;
		
 
               
            
        [delegate finishedUpdatingPoints:nil];

		return;
	}
	
	
	NSError *error =nil;
	dataArray = [NSJSONSerialization JSONObjectWithData:receivedData options:NSJSONReadingMutableContainers error:&error];
    
 
	
    responseString = nil;
    connection = nil;
    receivedData = nil;
    error = nil;
    
 
	
	
	
    [delegate finishedUpdatingPoints:dataArray];

	
}

@end
