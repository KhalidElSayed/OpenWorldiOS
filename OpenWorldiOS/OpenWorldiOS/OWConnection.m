//
//  OWConnection.m
//  OpenWorldiOS
//
//  Created by Edward Williams on 9/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OWConnection.h"

@implementation OWConnection
@synthesize getDataConnection,receivedData,owURLString,delegate;

- (id) init: (NSString *) urlString{
    if(self = [super init]){
        owURLString = urlString;
    }
    return self;
}


- (NSData *) connectionInputData{
    
    return [[NSString stringWithFormat:@""] dataUsingEncoding:NSUTF8StringEncoding];    /*
     
     double latSpan = userRegion.span.latitudeDelta;
     double lonSpan = userRegion.span.longitudeDelta;
     double lat = userRegion.center.latitude;
     double lon = userRegion.center.longitude;
    NSLog([NSString stringWithFormat:@"lat=%f&lon=%f&latspan=%f&lonspan=%f&datatype=ahFzfm9wZW53b3JsZHNlcnZlcnISCxIKT1dEYXRhVHlwZRiayAIM",lat,lon,latSpan,lonSpan] );
    
        [postBody appendData:[[NSString stringWithFormat:@"lat=%f&lon=%f&latspan=%f&lonspan=%f&datatype=%@",lat,lon,latSpan,lonSpan,dataType.key] dataUsingEncoding:NSUTF8StringEncoding]];  
     
     */
}

- (BOOL) startConnection{
    
    //if connection already established, cancel before starting new one
    if (getDataConnection) {
        [getDataConnection cancel];
    }
    
    NSURL *dataUrl = [NSURL URLWithString:owURLString];
    
	NSMutableURLRequest *dataRequest = [NSMutableURLRequest requestWithURL:dataUrl];
    [dataRequest setHTTPMethod:@"POST"];
    NSString *contentType = [NSString stringWithFormat:@"application/x-www-form-urlencoded"];
    [dataRequest setValue:contentType forHTTPHeaderField:@"Content-type"];
    
    NSMutableData *postBody = [NSMutableData data];
    [postBody appendData:[self connectionInputData]];
    [dataRequest setHTTPBody:postBody];
    
    [self setGetDataConnection:[[NSURLConnection alloc] initWithRequest:dataRequest delegate:self startImmediately:YES]];
    
    BOOL connectionStarted = NO;
    
    if(getDataConnection){
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
    NSArray *dataArray= [NSJSONSerialization JSONObjectWithData:receivedData options:NSJSONReadingMutableContainers error:&error];
    error = nil;
	
    responseString = nil;
    connection = nil;
    receivedData = nil;
    
    [delegate finishedUpdatingPoints:dataArray];
    
	
}


@end