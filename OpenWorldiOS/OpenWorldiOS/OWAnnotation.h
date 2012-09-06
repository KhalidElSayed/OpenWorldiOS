//
//  OWAnnotation.h
//  OpenWorldiOS
//
//  Created by Edward Williams on 8/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface OWAnnotation : NSObject <MKAnnotation> {
	CLLocationCoordinate2D coordinate;
	NSString *t;
	NSString *description;
	NSString *created;
	NSDate *date;
	NSString *key;
	int category;
}
-(id)initWithCoordinate:(CLLocationCoordinate2D)_cord;
-(id)initWithCoordinate:(CLLocationCoordinate2D)_cord:(NSString *) tit:(NSString *)descrip :(NSString *) create: (NSDate *) d;
- (NSString *)title;
- (NSString *)subtitle;
@property int category;
@property (nonatomic, retain) NSString *created;
@property (nonatomic, retain) NSDate *date;
@property (nonatomic, retain) NSString *t;
@property (nonatomic, retain) NSString *description;
@property (nonatomic, retain) NSString *key;

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;

@end