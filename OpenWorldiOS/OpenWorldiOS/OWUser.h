//
//  OWUser.h
//  OpenWorldiOS
//
//  Created by Edward Williams on 9/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OWUser : NSObject{
    NSString *userName;
    NSString *userKey;
    NSMutableArray *createdPoints;
    
    NSMutableArray *favoritePoints;
    
    
}




@property (nonatomic, retain)    NSString *userName;
@property (nonatomic, retain)   NSString *userKey;
@property (nonatomic, retain)   NSMutableArray *createdPoints;

@property (nonatomic, retain) NSMutableArray *favoritePoints;

@end
