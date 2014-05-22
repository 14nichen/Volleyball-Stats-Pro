//
//  Game.h
//  Volleyball Stats Pro
//
//  Created by Nikolai Chen on 5/5/14.
//  Copyright (c) 2014 Nikolai Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "Stats.h"

@interface Game : NSManagedObject

@property (nonatomic, retain) NSDate * date;
@property (nonatomic, retain) NSSet *stats;
@end

@interface Game (CoreDataGeneratedAccessors)

- (void)addStatsObject:(NSManagedObject *)value;
- (void)removeStatsObject:(NSManagedObject *)value;
- (void)addStats:(NSSet *)values;
- (void)removeStats:(NSSet *)values;

@end
