//
//  OWPayloadViewFactory.m
//  OpenWorldiOS
//
//  Created by Edward Williams on 9/4/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OWPayloadViewFactory.h"
#import "OWTextPayloadView.h"
#import "OWImagePayoutView.h"
@implementation OWPayloadViewFactory
+ (OWPayloadView *) createPayloadView: (OWPayloadType) type : (CGRect) frame{
    
    OWPayloadView *payloadView = nil;
    
    switch (type) {
        case OWPayloadTypeText:
            payloadView = [[OWTextPayloadView alloc] initWithFrame:frame];
            break;
        case OWPayloadTypeImage:
            payloadView = [[OWImagePayoutView alloc] initWithFrame:frame];
            break;
        default:
            break;
    }
    
    return  payloadView;
}
@end
