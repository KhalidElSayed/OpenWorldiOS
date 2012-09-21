//
//  OWUserLoginConnection.m
//  OpenWorldiOS
//
//  Created by Edward Williams on 9/20/12.
//
//

#import "OWUserLoginConnection.h"

@implementation OWUserLoginConnection

- (BOOL) startConnection: (NSString *) name: (NSString *) password{
    
    
    mName = name;
    mPassword = password;
    return [self startConnection];
}
- (NSData *) connectionInputData{
    
    return [[NSString stringWithFormat:@"name=%@&password=%@",mName,mPassword] dataUsingEncoding:NSUTF8StringEncoding];
}

@end
