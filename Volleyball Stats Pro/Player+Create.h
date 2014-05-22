//
//  Player+Create.h
//  Volleyball Stats Pro
//
//  Created by Nikolai Chen on 4/21/14.
//  Copyright (c) 2014 Nikolai Chen. All rights reserved.
//

#import "Player.h"
#import "Game.h"

@interface Player (Create)

+ (Player *)createPlayerWithName:(NSString *)lastName firstName:(NSString *)firstName jerseyNumber:(NSNumber*)jerseyNumber position:(NSString *)position heightFeet:(NSNumber *)heightFeet heightInches:(NSNumber *)heightInches managedObjectContext:(NSManagedObjectContext *)managedObjectContext;
+ (NSArray *)allPlayersInManagedObjectContext:(NSManagedObjectContext *)context;
- (NSString *)humanHeight;
- (NSString *)fullName;
- (Stats *) statsWithGame:(Game *) game;
- (NSDictionary *) allStats;
+ (NSDictionary *)totalsForStatsArray:(NSArray *)statsArray;

@end
