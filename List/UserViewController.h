//
//  UserViewController.h
//  List
//
//  Created by Roshan Lamichhane on 2/19/15.
//  Copyright (c) 2015 Roshan Lamichhane. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserViewController : UIViewController <UITextViewDelegate , UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *firstName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UIButton *signup;
- (IBAction)signUp:(id)sender;
@property (strong, nonatomic) IBOutlet UIView *added;

@end
