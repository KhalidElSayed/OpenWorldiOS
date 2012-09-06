//
//  OWPayloadViewFactory.h
//  OpenWorldiOS
//
//  Created by Edward Williams on 9/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OWAppDelegate.h"
#import "OWPayloadView.h"

@interface OWPayloadViewFactory : NSObject
+ (OWPayloadView *) createPayloadView: (OWPayloadType) type : (CGRect) frame;
@end
