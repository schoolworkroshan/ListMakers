//
//  UserTableViewController.m
//  List
//
//  Created by Roshan Lamichhane on 2/19/15.
//  Copyright (c) 2015 Roshan Lamichhane. All rights reserved.
//

#import "UserTableViewController.h"
#import "UserViewController.h"
#import "User.h"
#import "List.h"
#import "AppDelegate.h"
@interface UserTableViewController ()

@end

@implementation UserTableViewController
@synthesize users;
- (void)viewDidLoad {
    
    
    [super viewDidLoad];
  
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) viewDidAppear:(BOOL)animated    {
    // UserTableViewController
    //  Create Fetch Request in viewDidLoad
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    //Create NSManagedObjectContext instance
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    NSFetchRequest *request = [[NSFetchRequest alloc]initWithEntityName:@"User"];
    // [self presentViewController:UserTableViewController animated:YES completion:nil];
    users=[[context executeFetchRequest:request error:nil]mutableCopy];
    [self.tableView reloadData ];

    
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [users count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    // Configure the cell..
    //Most important part
   // cell.textLabel.text=[array firstName];
    //Get the information from the User Class to insert the data into users array
    
    NSManagedObject *user= [users objectAtIndex:indexPath.row];
    [cell.textLabel setText:[NSString stringWithFormat:@"%@",[user valueForKey:@"firstName"]]];
    return cell;
}


// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}


// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    //Create NSManagedObjectContext instance
    
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //Delete object from the table
        [context deleteObject:[users objectAtIndex:indexPath.row]];
        //Invoke save method to save the changes
        // Delete the row from the data source
        NSError *error;
        //Saving the contect in the NSManagedContext of the Core Data
        [context save:&error];
        
    }
    [users removeObjectAtIndex:indexPath.row];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    
    //Delete from the table
    
}



/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


@end
