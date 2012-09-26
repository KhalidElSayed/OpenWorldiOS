//
//  OWDataTypeSelectViewController.m
//  OpenWorldiOS
//
//  Created by Edward Williams on 9/14/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "OWDataTypeSelectViewController.h"
#import "OWManager.h"
#import "OWMapViewController.h"
@interface OWDataTypeSelectViewController ()

@end

@implementation OWDataTypeSelectViewController

@synthesize delegate,selectedDataType,availableDataTypes,dataTypeConnection;

- (void) finishedUpdatingPoints :(NSObject *) arrayOrDictionary{
    
    //clear current list  + init list if first one
    [self setAvailableDataTypes:[[NSMutableArray alloc] init]];
    NSArray *array = (NSArray *) arrayOrDictionary;
    for (int i = 0; i < [array count]; i++){
        NSDictionary *dataTypeDictionary = [array objectAtIndex:i];
        if(dataTypeDictionary){
            NSString *dataTypeName = [dataTypeDictionary valueForKey:@"dataName"];
            NSString *dataTypeKey = [dataTypeDictionary valueForKey:@"key"];
            NSString *dataTypeExternalServer = [dataTypeDictionary valueForKey:@"externalServer"];
            OWDataType *newDataType = [[OWDataType alloc] init];
            [newDataType setKey:dataTypeKey];
            [newDataType setName:dataTypeName];
            [newDataType setExternalServer:dataTypeExternalServer];
            [availableDataTypes addObject:newDataType];
            
        }
    }

    [[self tableView] reloadData];
    
}

- (void) connectionFailed: (NSError *) error{
    
}
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setDataTypeConnection:[[OWDataTypeConnection alloc] init:@"http://openworldserver.appspot.com/getDataTypes"]];
    [dataTypeConnection setDelegate:self];
    [dataTypeConnection startConnection];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}
- (IBAction)dismiss{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) updateDataTypes{
    [dataTypeConnection startConnection];
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

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
     // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
     // Return the number of rows in the section.
    
    if (availableDataTypes == nil) {
        return  0;
    }
    else{
        return [availableDataTypes count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    // Configure the cell...
    
    OWDataType *dataType = [availableDataTypes objectAtIndex:indexPath.row];
    
    
    [cell.textLabel setText:dataType.name];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self dismissViewControllerAnimated:YES completion:nil];
    [delegate dataTypeSelected:[availableDataTypes objectAtIndex:indexPath.row]];


}

@end
