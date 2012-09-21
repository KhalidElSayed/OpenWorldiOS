//
//  OWNewUserConnection.h
//  OpenWorldiOS
//
//  Created by Edward Williams on 9/20/12.
//
//

#import "OWConnection.h"

@interface OWCreateUserConnection : OWConnection{
    NSString *mName;
    NSString *mEmail;
}
- (BOOL) startConnection: (NSString *) name: (NSString *) email;
@end
