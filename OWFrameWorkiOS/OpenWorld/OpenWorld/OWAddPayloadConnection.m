//
//  OWAddPayloadProvider.m
//  OpenWorldiOS
//
//  Created by Edward Williams on 9/17/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OWAddPayloadConnection.h"

@implementation OWAddPayloadConnection
@synthesize mPointKey,mCreatorKey,mImagePayload,mTextPayload,mPayloadType;
static char encodingTable[] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789)/";

- (NSData *) connectionInputData{
    
    if (mPayloadType == OWPayloadTypeImage) {
        return [[NSString stringWithFormat:@"pointKey=%@&payloadType=%i&data=%@&creatorKey=%@",mPointKey,mPayloadType,[self encode:UIImagePNGRepresentation(mImagePayload)] ,mCreatorKey] dataUsingEncoding:NSUTF8StringEncoding]; 
    }
    else if (mPayloadType == OWPayloadTypeText){
        return [[NSString stringWithFormat:@"pointKey=%@&payloadType=%i&data=%@&creatorKey=%@",mPointKey,mPayloadType,mTextPayload,mCreatorKey] dataUsingEncoding:NSUTF8StringEncoding];
    }
    
    return nil;
}

- (BOOL) startConnection: (NSString *) pointKey: (NSString *) creatorKey: (UIImage *) imagePayload: (NSString *) textPayload: (int) payloadType{
    
    mPointKey = pointKey;
    mCreatorKey = creatorKey;
    mImagePayload =imagePayload;
    mTextPayload = textPayload;
    mPayloadType = payloadType;
    
    return [self startConnection];
    
    
}
- (NSString*) encode:(const uint8_t*) input length:(NSInteger) length {
    NSMutableData* data = [NSMutableData dataWithLength:((length + 2) / 3) * 4];
    uint8_t* output = (uint8_t*)data.mutableBytes;
	
    for (NSInteger i = 0; i < length; i += 3) {
        NSInteger value = 0;
        for (NSInteger j = i; j < (i + 3); j++) {
            value <<= 8;
			
            if (j < length) {
                value |= (0xFF & input[j]);
            }
        }
		
        NSInteger index = (i / 3) * 4;
        output[index + 0] =                    encodingTable[(value >> 18) & 0x3F];
        output[index + 1] =                    encodingTable[(value >> 12) & 0x3F];
        output[index + 2] = (i + 1) < length ? encodingTable[(value >> 6)  & 0x3F] : '=';
        output[index + 3] = (i + 2) < length ? encodingTable[(value >> 0)  & 0x3F] : '=';
    }
	
    return [[NSString alloc] initWithData:data
                                  encoding:NSASCIIStringEncoding];
}


- (NSString*) encode:(NSData*) rawBytes {
    return [self encode:(const uint8_t*) rawBytes.bytes length:rawBytes.length];
}
@end
