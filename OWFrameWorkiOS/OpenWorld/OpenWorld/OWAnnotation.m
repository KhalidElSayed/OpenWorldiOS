//
//  OWAnnotation.m
//  OpenWorldiOS
//
//  Created by Edward Williams on 8/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OWAnnotation.h"

@implementation OWAnnotation
@synthesize coordinate,t,created,description,date,key,category,dataTypeKey;
-(id)initWithCoordinate:(CLLocationCoordinate2D)_cord{
	if([self init])
	{
		coordinate = _cord;
        
	}
	return self;
}
-(id)initWithCoordinate:(CLLocationCoordinate2D)_cord:(NSString *) tit:(NSString *)descrip :(NSString *) create: (NSDate *) d;
{
	if([self init])
	{
		coordinate = _cord;
		[self	 setCreated:create];
		[self setT:tit];
		[self setDescription:descrip];
		[self setDate:d];
	}
	return self;
}

- (NSString *)title{
	return  t;
}
- (NSString *)subtitle{
	
	NSDateFormatter *df = [[NSDateFormatter alloc] init];
	[df setLocale:[NSLocale currentLocale]];
	[df setDateStyle:NSDateFormatterMediumStyle];
	[df setTimeStyle:NSDateFormatterMediumStyle];
	
	NSString *ret = [df stringFromDate:[self date]];
 	
	return ret;
    
}


@end