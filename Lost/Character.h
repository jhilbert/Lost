//
//  Character.h
//  Lost
//
//  Created by Josef Hilbert on 28.01.14.
//  Copyright (c) 2014 Josef Hilbert. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Character : NSManagedObject

@property (nonatomic, retain) NSString * actor;
@property (nonatomic, retain) NSDate * dateOfDeath;
@property (nonatomic, retain) NSDate * introductionDate;
@property (nonatomic, retain) NSString * passenger;

@end
