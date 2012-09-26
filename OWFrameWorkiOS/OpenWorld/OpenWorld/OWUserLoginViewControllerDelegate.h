//
//  OWUserLoginViewControllerDelegate.h
//  OpenWorld
//
//  Created by Edward Williams on 9/26/12.
//  Copyright (c) 2012 Edward Williams. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol OWUserLoginViewControllerDelegate <NSObject>


- (void) newUserAuthenticated: (NSString *) userName: (NSString * ) userEmail: (NSString *) userKey;

@end
