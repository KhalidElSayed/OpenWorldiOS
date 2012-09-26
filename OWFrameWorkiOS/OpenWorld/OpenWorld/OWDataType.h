//
//  OWDataType.h
//  OpenWorldiOS
//
//  Created by Edward Williams on 9/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OWDataType : NSObject{
    NSString *key;
    NSString *name;
    
    NSString *externalServer;
}
@property (nonatomic, retain) NSString *key;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSString *externalServer;  //optional

@end
