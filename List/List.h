//
//  List.h
//  List
//
//  Created by Roshan Lamichhane on 2/19/15.
//  Copyright (c) 2015 Roshan Lamichhane. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface List : NSManagedObject

@property (nonatomic, retain) NSString * title;
@property (nonatomic, retain) NSString * information;
@end
