//
//  OWTextPayloadView.h
//  OpenWorldiOS
//
//  Created by Edward Williams on 9/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OWPayloadView.h"

@interface OWTextPayloadView : OWPayloadView{
    UITextView *textView;
}

@property (nonatomic, retain) UITextView *textView;
@end
