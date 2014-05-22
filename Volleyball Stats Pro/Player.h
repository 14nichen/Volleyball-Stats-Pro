//
//  Player.h
//  Volleyball Stats Pro
//
//  Created by Nikolai Chen on 5/20/14.
//  Copyright (c) 2014 Nikolai Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Stats;

@interface Player : NSManagedObject

@property (nonatomic, retain) NSString * first_name;
@property (nonatomic, retain) NSNumber * height_feet;
@property (nonatomic, retain) NSNumber * height_inches;
@property (nonatomic, retain) NSNumber * jersey_number;
@property (nonatomic, retain) NSString * last_name;
@property (nonatomic, retain) NSString * position;
@property (nonatomic, retain) NSSet *stats;
@property (nonatomic, retain) NSManagedObject *team;
@end

@interface Player (CoreDataGeneratedAccessors)

- (void)addStatsObject:(Stats *)value;
- (void)removeStatsObject:(Stats *)value;
- (void)addStats:(NSSet *)values;
- (void)removeStats:(NSSet *)values;

@end
