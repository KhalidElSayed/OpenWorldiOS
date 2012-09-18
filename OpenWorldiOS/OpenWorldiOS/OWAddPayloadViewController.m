//
//  OWAddPayloadViewController.m
//  OpenWorldiOS
//
//  Created by Edward Williams on 9/16/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OWAddPayloadViewController.h"

@interface OWAddPayloadViewController ()

@end

@implementation OWAddPayloadViewController
@synthesize cameraButton,titleLabel,subtitleLabel,payloadTypeControl,textViewPayload,imageViewPayload,dismissKeyboardButton;
@synthesize addPayloadConnection,creatorKey,pointKey,payloadType;
- (BOOL) textFieldShouldReturn:(UITextField*)textField {
    [textField resignFirstResponder];
    return YES;
}
- (IBAction) dismissKeyboardAction{
    [textViewPayload resignFirstResponder];
}
- (void) finishedUpdatingPoints :(NSObject *) arrayOrDictionary{
    NSDictionary *doneDictionary = (NSDictionary *) arrayOrDictionary;
    NSString *pointKey = [doneDictionary objectForKey:@"payloadkey"];
    [self dismissModalViewControllerAnimated:YES];
    //TODO: add to Users's created points list
    
}
- (void) connectionFailed: (NSError *) error{
    
}


- (IBAction) swichPayloadType{

    if ([payloadTypeControl selectedSegmentIndex] == 0) {
        [cameraButton setHidden:YES];
        [imageViewPayload setHidden:YES];
        [textViewPayload setHidden:NO];
        [dismissKeyboardButton setHidden:NO];
    }
    else{
        [cameraButton setHidden:NO];
        [imageViewPayload setHidden:NO];
        [textViewPayload setHidden:YES];  
        [dismissKeyboardButton setHidden:YES];

    }
}
- (IBAction) cancelAction{
    [self dismissModalViewControllerAnimated:YES];
}
- (IBAction) addAction{

    switch ([payloadTypeControl selectedSegmentIndex]) {
        case OWPayloadTypeText:
            [addPayloadConnection startConnection:pointKey :creatorKey :nil :[textViewPayload text] :OWPayloadTypeText];
            break;
        case OWPayloadTypeImage:
            [addPayloadConnection startConnection:pointKey :creatorKey :[imageViewPayload image] :nil :OWPayloadTypeImage];
            break;
            
        default:
            break;
    }

}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self setAddPayloadConnection:[[OWAddPayloadConnection alloc] init:@"http://openworldserver.appspot.com/addPayload"]];
        [addPayloadConnection setDelegate:self];
        
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self swichPayloadType];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}



- (IBAction) cameraAction{
	
	
	UIImagePickerController *tmpIPC = [[UIImagePickerController alloc] init];
	//[tmpIPC setEditing:YES];
	tmpIPC.delegate = self;
	
	if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera])
		tmpIPC.sourceType =  UIImagePickerControllerSourceTypeCamera; //UIImagePickerControllerSourceTypePhotoLibrary;
	else if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
		tmpIPC.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
	

    [self presentModalViewController:tmpIPC animated:YES];
	
	
	
	//[tmpIPC release];	
    
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
	
	//[[viewController addPVC] setPostImage:nil];

    [imageViewPayload setImage:nil];
    [picker dismissModalViewControllerAnimated:YES];

}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info{
	
	UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
	CGSize size;
	size.width = 320;
	size.height = 460;
	//	[picker dismissModalViewControllerAnimated:YES];
	[[ picker view] setHidden:YES];
	//	CGRect rect = [[editingInfo objectForKey:UIImagePickerControllerCropRect] CGRectValue];
	
	
	const CGFloat kThumbnailWidth = 320;
	const CGFloat kThumbnailHeight = 480;
	CGRect rect = CGRectMake(0.0, 0.0, kThumbnailWidth, kThumbnailHeight);
	UIGraphicsBeginImageContext(rect.size);
	[image drawInRect:rect];  // scales image to rect
	UIImage *thumbnail = UIGraphicsGetImageFromCurrentImageContext();
	UIGraphicsEndImageContext();
	
	//[[[viewController addPVC]  postImageView] setImage:thumbnail];
	
    [imageViewPayload setImage:thumbnail];

    [picker dismissModalViewControllerAnimated:YES];
    
}



@end
