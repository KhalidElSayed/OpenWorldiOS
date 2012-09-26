//
//  OWCustomMapViewController.m
//  OWiOSClient
//
//  Created by Edward Williams on 9/26/12.
//  Copyright (c) 2012 Edward Williams. All rights reserved.
//

#import "OWCustomMapViewController.h"

@interface OWCustomMapViewController ()

@end

@implementation OWCustomMapViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>)annotation{
    
    
	if( annotation == [mapView userLocation] ) {
		
		return nil;
		
	}else {
		
		static NSString *annotationViewID = @"AnnotationViewID";
		
        //	NSLog(@"getting view for annotation: %@",[annotation title]);
		
		MKPinAnnotationView *mkav = (MKPinAnnotationView *) [mapView dequeueReusableAnnotationViewWithIdentifier:annotationViewID];
		
		if (mkav == nil) {
			MKPinAnnotationView *m   = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:annotationViewID];
            //	MyPinAnnotationView  *m = [ [[MyPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:annotationViewID] autorelease];
			
			//[m setPinColor:MKPinAnnotationColorPurple];
			
            //	[m setAnimatesDrop:YES];
			
			mkav = m;
			
		}
		
		
		
		OWAnnotation *myannotation = (OWAnnotation *) annotation;
		

        [mkav setPinColor:MKPinAnnotationColorGreen];
		
        //	[mkav setDescription:[myannotation description]];
		
		[mkav setRightCalloutAccessoryView:[UIButton buttonWithType:UIButtonTypeDetailDisclosure]];
		//mkav.rightCalloutAccessoryView = [ UIButtonbuttonWithType: UIButtonTypeDetailDisclosure];
		[mkav setCanShowCallout:YES];
		
		
		
		return mkav;
		
	}
    
}

@end
