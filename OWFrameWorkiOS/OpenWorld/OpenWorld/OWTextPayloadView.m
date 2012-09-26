//
//  OWTextPayloadView.m
//  OpenWorldiOS
//
//  Created by Edward Williams on 9/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OWTextPayloadView.h"

@implementation OWTextPayloadView
@synthesize textView;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setTextView:[[UITextView alloc] initWithFrame:frame]];
        [self addSubview:textView];
    }
    return self;
}


- (BOOL) loadPayloadData: (NSString *) data{
 
    [textView setText:data];
    
    return YES;
}
@end
