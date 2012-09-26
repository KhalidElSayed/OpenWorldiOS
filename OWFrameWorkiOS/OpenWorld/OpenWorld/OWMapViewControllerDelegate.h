//
//  OWMapViewControllerDelegate.h
//  OpenWorld
//
//  Created by Edward Williams on 9/26/12.
//  Copyright (c) 2012 Edward Williams. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "OWDataType.h"
@protocol OWMapViewControllerDelegate <NSObject>

//Also acts as datasource for OWMapViewController

- (NSString *) getCurrentDataTypeKeyString;
- (NSString *) getCurrentUserKeyString;
- (void) changeCurrentUser: (NSString *) userName: (NSString * ) userEmail: (NSString *) userKey;
- (void) changeCurrentDataType: (OWDataType *) type;
- (void) updatePoints: (MKCoordinateRegion) region;
@end
