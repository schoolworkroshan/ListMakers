//
//  User.h
//  List
//
//  Created by Roshan Lamichhane on 2/19/15.
//  Copyright (c) 2015 Roshan Lamichhane. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface User : NSManagedObject

@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;

@end
