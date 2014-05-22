//
//  Stats+Create.m
//  Volleyball Stats Pro
//
//  Created by Nikolai Chen on 5/6/14.
//  Copyright (c) 2014 Nikolai Chen. All rights reserved.
//

#import "Stats+Create.h"
#import "Player+Create.h"

@implementation Stats (Create)

+ (Stats *)createStatsForPlayer:(Player *)player game:(Game *)game managedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    Stats *stats = nil;
    NSFetchRequest *fetchRequest = [NSFetchRequest new];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Stats" inManagedObjectContext:managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSPredicate *gamePredicate = [NSPredicate predicateWithFormat:@"game = %@", game];
    NSPredicate *playerPredicate = [NSPredicate predicateWithFormat:@"player = %@", player];
    
    //        NSCompoundPredicate *predicate = [NSCompoundPredicate andPredicateWithSubpredicates:@[last, first]];
    fetchRequest.predicate=[NSCompoundPredicate andPredicateWithSubpredicates:@[gamePredicate, playerPredicate]];
    
    NSError *error;
    NSArray *matches = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
    
    if (!matches || ([matches count] > 1)) {
        // handle error
        NSAssert(NO, @"wrong number of stats for player matches returned.");
        
    } else if ([matches count] == 0) {
        NSLog(@"Creating new Stats for player: %@", player.last_name);
        stats = [NSEntityDescription insertNewObjectForEntityForName:@"Stats"
                                               inManagedObjectContext:managedObjectContext];
        stats.kills = 0;
        stats.blocks = 0;
        stats.aces = 0;
        stats.digs = 0;
        stats.assists = 0;
        stats.player = player;
        stats.game = game;
    } else {
        stats = [matches lastObject];
    }


    
        return stats;
}

@end
