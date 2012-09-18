//
//  OWDataTypeSelectViewController.h
//  OpenWorldiOS
//
//  Created by Edward Williams on 9/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OWDataTypeConnection.h"
#import "OWDataType.h"
@interface OWDataTypeSelectViewController : UITableViewController <OWConnectionDelegate>{

    OWDataTypeConnection *dataTypeConnection;
    NSMutableArray *availableDataTypes;
    OWDataType *selectedDataType;
    
    
}
- (void) updateDataTypes;
- (IBAction)dismiss;
@property (nonatomic, retain) OWDataTypeConnection *dataTypeConnection;
@property (nonatomic, retain) NSMutableArray *availableDataTypes;
@property (nonatomic, retain) OWDataType *selectedDataType;
@end
