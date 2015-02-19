//
//  UserViewController.m
//  List
//
//  Created by Roshan Lamichhane on 2/19/15.
//  Copyright (c) 2015 Roshan Lamichhane. All rights reserved.
//

#import "UserViewController.h"
#import "AppDelegate.h"

@interface UserViewController ()

@end

@implementation UserViewController
@synthesize firstName,lastName,signup,added;

- (void)viewDidLoad {
    [super viewDidLoad];
    //firstName.delegate=self;
    //lastName.delegate=self;
    
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)signUp:(id)sender {
    signup.enabled=NO;
    AppDelegate *appDelegate = [[UIApplication sharedApplication]delegate];
    NSManagedObjectContext *context = [appDelegate managedObjectContext];
    NSManagedObject *newUser = [NSEntityDescription insertNewObjectForEntityForName:@"User" inManagedObjectContext:context];
    [newUser setValue:firstName.text forKey:@"firstName"];
    [newUser setValue:lastName.text forKey:@"lastName"];
    NSError *error;
    signup.enabled=YES;
    //Saving the contect in the NSManagedContext of the Core Data
    [context save:&error];
    NSLog(@"User %@ %@ was added",firstName.text,lastName.text);
    [self performSegueWithIdentifier:@"signup" sender:self];
    

}
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [firstName resignFirstResponder];
    [lastName resignFirstResponder];
    
    return YES;
}

@end
