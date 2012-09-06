//
//  OWPayloadProvider.m
//  OpenWorldiOS
//
//  Created by Edward Williams on 9/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OWPayloadProvider.h"

@implementation OWPayloadProvider
@synthesize getPayloadConnection,receivedData,delegate,payloadDictionary,owPayloadURLString;




- (id) init: (NSString *) dataUrlString{
    
    if(self = [super init]){
        
 
        
        owPayloadURLString = dataUrlString;
    }
    
    return self;
}

- (BOOL) getPayload: (NSString *) pointKey: (int) payloadIndex{
    
    //if connection already established, cancel before starting new one
    if (getPayloadConnection) {
        [getPayloadConnection cancel];
    }
    
    NSURL *dataUrl = [NSURL URLWithString:owPayloadURLString];
	NSMutableURLRequest *dataRequest = [NSMutableURLRequest requestWithURL:dataUrl];
    [dataRequest setHTTPMethod:@"POST"];
    NSString *contentType = [NSString stringWithFormat:@"application/x-www-form-urlencoded"];
    [dataRequest setValue:contentType forHTTPHeaderField:@"Content-type"];
    
    NSMutableData *postBody = [NSMutableData data];
    
    [postBody appendData:[[NSString stringWithFormat:@"key=%@&datatype=0&payloadIndex=0",pointKey] dataUsingEncoding:NSUTF8StringEncoding]];
    [dataRequest setHTTPBody:postBody];
    
    [self setGetPayloadConnection:[[NSURLConnection alloc] initWithRequest:dataRequest delegate:self startImmediately:YES]];
    
    BOOL connectionStarted = NO;
    if(getPayloadConnection){
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
    
    [delegate finishedRetrievingPayload:nil :-1];
}


- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
 	
	NSString * responseString =  [[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding];
    
	
   // NSLog(responseString);
    //quick check for invalid response
	if([[responseString substringToIndex:1] compare:@"["] != 0  ){
		
        //if retryConnection is true, than we failed on a retry -- stop and show error msg
        
		
        
        responseString = nil;
        connection = nil;
        receivedData = nil;
		
        
        
        
        [delegate finishedRetrievingPayload:nil :-1];
		return;
	}
	
	
	NSError *error =nil;
    
	NSArray *tempArray = [NSJSONSerialization JSONObjectWithData:receivedData options:NSJSONReadingMutableContainers error:&error];
    payloadDictionary = [tempArray objectAtIndex:0];
    
    NSString *payload = [payloadDictionary objectForKey:@"payload"];
    OWPayloadType payloadType = [[payloadDictionary objectForKey:@"payloadType"] intValue];
	
    
    
    responseString = nil;
    connection = nil;
    receivedData = nil;
    error = nil;
    
    

	
	[delegate finishedRetrievingPayload:payload :payloadType];
    
	
}



@end
