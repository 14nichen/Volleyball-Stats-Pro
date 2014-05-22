//
//  Team.h
//  Volleyball Stats Pro
//
//  Created by Nikolai Chen on 5/20/14.
//  Copyright (c) 2014 Nikolai Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Player;

@interface Team : NSManagedObject

@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSSet *player;
@end

@interface Team (CoreDataGeneratedAccessors)

- (void)addPlayerObject:(Player *)value;
- (void)removePlayerObject:(Player *)value;
- (void)addPlayer:(NSSet *)values;
- (void)removePlayer:(NSSet *)values;

@end
