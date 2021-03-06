//
//  OWMapViewController.m
//  OpenWorldiOS
//
//  Created by Edward Williams on 8/31/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OWMapViewController.h"
#import "OWAnnotation.h"
#import "OWAppDelegate.h"
#import "OWDataType.h"
@interface OWMapViewController ()

@end

@implementation OWMapViewController
@synthesize addPointViewController,mapView,detailViewController;

 
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (IBAction) addPointAction {

    if (addPointViewController == nil) {
        [self setAddPointViewController:[[OWAddPointViewController alloc] initWithNibName:@"OWAddPointViewController" bundle:nil]];
    }
    [addPointViewController setUserLocation:[[mapView userLocation] location]];
    OWAppDelegate *mainDelegate = (OWAppDelegate *) [[UIApplication sharedApplication] delegate];
    [addPointViewController setDataKeyString:[[ [mainDelegate pointsConnection] dataType] key]];
    [addPointViewController setCreatorString:[[mainDelegate currentUser] userKey]];
    [self presentModalViewController:addPointViewController animated:YES];
}
- (IBAction) payloadTypeButton{
    //[detailViewController switchPayload]; 

    OWAppDelegate *mainDelegate = (OWAppDelegate *) [[UIApplication sharedApplication] delegate];

    [self presentModalViewController:[mainDelegate dataTypeSelectViewController] animated:YES];
    [[mainDelegate dataTypeSelectViewController] updateDataTypes];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setDetailViewController:[[OWPointDetailViewController alloc] initWithNibName:@"DataDetailView" bundle:nil]];
    [mapView setShowsUserLocation:YES];
	// Do any additional setup after loading the view.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
- (void)mapView:(MKMapView *)mapView regionDidChangeAnimated:(BOOL)animated{
    OWAppDelegate *mainDelegate  = (OWAppDelegate *) [[UIApplication sharedApplication] delegate];
    [[mainDelegate pointsConnection] startConnection:[mapView region]]; 
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control{
    
    
    OWAnnotation *annotation = (OWAnnotation *) [view annotation];
    [self presentModalViewController:detailViewController animated:YES];
    [detailViewController setCurrentAnnotation:annotation];
    [detailViewController getPayload:[annotation key]: [annotation dataTypeKey] :0];
	
	/*
	
	MyAnnotation *ma = (MyAnnotation *) [view annotation];
	
    
	
	
	[self presentModalViewController:crimeViewController animated:YES];
	
    
	[[self crimeViewController] setup:ma];
    */
    
	
}

- (void)mapViewDidFailLoadingMap:(MKMapView *)mapView withError:(NSError *)error{
	if(error != nil){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Connection Failed" message:@"Could not update map tile information. Please check your internet connectivity and try again." delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
        [alert show];
 	}
	
	
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
		
		
		switch (myannotation.category) {
			case 0:
				[mkav setPinColor:MKPinAnnotationColorRed];
				break;
			case 1:
				[mkav setPinColor:MKPinAnnotationColorPurple];
				break;
			case 2:
				[mkav setPinColor:MKPinAnnotationColorGreen];
				break;
			default:
				[mkav setPinColor:MKPinAnnotationColorRed];
				break;
		}
		
		
	//	[mkav setDescription:[myannotation description]];
		
		[mkav setRightCalloutAccessoryView:[UIButton buttonWithType:UIButtonTypeDetailDisclosure]];
		//mkav.rightCalloutAccessoryView = [ UIButtonbuttonWithType: UIButtonTypeDetailDisclosure];
		[mkav setCanShowCallout:YES];
		
		
		
		return mkav;
		
	}

}

- (void) updateMapView: (NSArray *) array{
    NSMutableArray *oldAnnotations = [NSMutableArray  arrayWithArray:mapView.annotations];
	[oldAnnotations removeObject:[mapView userLocation]];
    [mapView removeAnnotations:oldAnnotations];

    for (int i = 0; i < [array count]; i++){
        NSDictionary *pointDictionary = [array objectAtIndex:i];
        if(pointDictionary){
            CLLocationCoordinate2D tmpPoint;
            NSString *latString = [pointDictionary valueForKey:@"lat"];
            NSString *longString = [pointDictionary valueForKey:@"lon"];
            NSString *title = [pointDictionary valueForKey:@"title"];
            NSString *description = [pointDictionary valueForKey:@"description"];
            NSString *created = [pointDictionary valueForKey:@"created"];
            NSString *datatypestring = [pointDictionary valueForKey:@"datatypekey"];
            NSString *keystring = [pointDictionary valueForKey:@"key"];
            NSDateFormatter *df = [[NSDateFormatter alloc] init];
            [df setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
            [df setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
            tmpPoint.latitude =  [latString doubleValue];
            tmpPoint.longitude =  [longString doubleValue];
            NSDate *date = [df dateFromString:created];

            OWAnnotation    *annotation  = [[OWAnnotation alloc] initWithCoordinate:tmpPoint :title :description : created:date];
            [annotation setDataTypeKey:datatypestring];
            [annotation setKey:keystring];
            [[self mapView] addAnnotation:annotation];

            
        }
        else{
            NSLog(@"json parsing failed second level");
        }

    }
    
}
 
@end
