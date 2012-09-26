//
//  OWDataTypeSelectViewControllerDelegate.h
//  OpenWorld
//
//  Created by Edward Williams on 9/26/12.
//  Copyright (c) 2012 Edward Williams. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OWDataType.h"
@protocol OWDataTypeSelectViewControllerDelegate <NSObject>

- (void) dataTypeSelected: (OWDataType *) type;
@end
