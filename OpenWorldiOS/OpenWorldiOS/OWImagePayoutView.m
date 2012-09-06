//
//  OWImagePayoutView.m
//  OpenWorldiOS
//
//  Created by Edward Williams on 9/3/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OWImagePayoutView.h"

@implementation OWImagePayoutView
@synthesize imageView;
static char encodingTable[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789)/";
static char decodingTable[128];

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        memset(decodingTable, 0, 128);
        for (NSInteger i = 0; i < 64; i++) {
            decodingTable[encodingTable[i]] = i;
        }	
        
        
        [self setImageView:[[UIImageView alloc] initWithFrame:frame]];
        [self addSubview:imageView];
        
    }
    return self;
}
- (BOOL) loadPayloadData: (NSString *) data{
    
    
    data =  [data stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    NSData *payloadData = [self decode:data];
    
    
    UIImage *payloadImage = [UIImage imageWithData:payloadData];
    [imageView setImage:payloadImage];
    return YES;
}

 
- (NSData*) decode:(const char*) string length:(NSInteger) inputLength {
	if ((string == NULL) || (inputLength % 4 != 0)) {
		return nil;
	}
	
	while (inputLength > 0 && string[inputLength - 1] == '=') {
		inputLength--;
	}
	
	NSInteger outputLength = inputLength * 3 / 4;
	NSMutableData* data = [NSMutableData dataWithLength:outputLength];
	uint8_t* output = data.mutableBytes;
	
	NSInteger inputPoint = 0;
	NSInteger outputPoint = 0;
	while (inputPoint < inputLength) {
		char i0 = string[inputPoint++];
		char i1 = string[inputPoint++];
		char i2 = inputPoint < inputLength ? string[inputPoint++] : 'A'; /* 'A' will decode to \0 */
		char i3 = inputPoint < inputLength ? string[inputPoint++] : 'A';
		
		output[outputPoint++] = (decodingTable[i0] << 2) | (decodingTable[i1] >> 4);
		if (outputPoint < outputLength) {
			output[outputPoint++] = ((decodingTable[i1] & 0xf) << 4) | (decodingTable[i2] >> 2);
		}
		if (outputPoint < outputLength) {
			output[outputPoint++] = ((decodingTable[i2] & 0x3) << 6) | decodingTable[i3];
		}
	}
	
	return data;
}



- (NSData*) decode:(NSString*) string {
    NSLog(string);
	return [self decode:[string cStringUsingEncoding:NSASCIIStringEncoding] length:string.length];
}
@end
