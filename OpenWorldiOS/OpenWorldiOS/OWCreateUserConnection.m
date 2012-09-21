//
//  OWNewUserConnection.m
//  OpenWorldiOS
//
//  Created by Edward Williams on 9/20/12.
//
//

#import "OWCreateUserConnection.h"

@implementation OWCreateUserConnection

- (NSData *) connectionInputData{
    
    return [[NSString stringWithFormat:@"name=%@&email=%@",mName,mEmail] dataUsingEncoding:NSUTF8StringEncoding];
}

- (BOOL) startConnection: (NSString *) name: (NSString *) email{
   
    mName = name;
    mEmail = email;
    return [self startConnection];
    
}
@end
