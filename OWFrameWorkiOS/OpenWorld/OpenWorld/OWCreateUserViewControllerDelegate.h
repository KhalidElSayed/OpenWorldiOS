//
//  OWCreateUserViewControllerDelegate.h
//  OpenWorld
//
//  Created by Edward Williams on 9/26/12.
//  Copyright (c) 2012 Edward Williams. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol OWCreateUserViewControllerDelegate <NSObject>

- (void) userCreated: (NSString *) userName: (NSString * ) userEmail: (NSString *) userKey;

@end
