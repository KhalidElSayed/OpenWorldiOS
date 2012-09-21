//
//  OWUserLoginConnection.h
//  OpenWorldiOS
//
//  Created by Edward Williams on 9/20/12.
//
//

#import "OWConnection.h"

@interface OWUserLoginConnection : OWConnection{
    NSString *mName;
    NSString *mPassword;
}
- (BOOL) startConnection: (NSString *) name: (NSString *) password;

@end
