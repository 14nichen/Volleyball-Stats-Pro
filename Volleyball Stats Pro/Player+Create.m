//
//  Player+Create.m
//  Volleyball Stats Pro
//
//  Created by Nikolai Chen on 4/21/14.
//  Copyright (c) 2014 Nikolai Chen. All rights reserved.
//

#import "Player+Create.h"
#import "Game+Create.h"

@implementation Player (Create)

+ (Player *)createPlayerWithName:(NSString *)lastName firstName:(NSString *)firstName jerseyNumber:(NSNumber*)jerseyNumber position:(NSString *)position heightFeet:(NSNumber *)heightFeet heightInches:(NSNumber *)heightInches managedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    Player *player = nil;
    if ([lastName length]) {

        //        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Player"];

        NSFetchRequest *fetchRequest = [NSFetchRequest new];
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Player" inManagedObjectContext:managedObjectContext];
        [fetchRequest setEntity:entity];
        
        
        NSPredicate *last = [NSPredicate predicateWithFormat:@"last_name = %@", lastName];
        NSPredicate *first = [NSPredicate predicateWithFormat:@"first_name = %@", firstName];
        
//        NSCompoundPredicate *predicate = [NSCompoundPredicate andPredicateWithSubpredicates:@[last, first]];
        fetchRequest.predicate=[NSCompoundPredicate andPredicateWithSubpredicates:@[last, first]];
        
        NSError *error;
        NSArray *matches = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
        
        if (!matches || ([matches count] > 1)) {
            // handle error
            NSAssert(NO, @"wrong number of player matches returned.");
            
        } else if ([matches count] == 0) {
            NSLog(@"Creating new Player: %@, %@", lastName, firstName);
            player = [NSEntityDescription insertNewObjectForEntityForName:@"Player"
                                                  inManagedObjectContext:managedObjectContext];
            player.last_name = lastName;
            player.first_name = firstName;
            player.jersey_number = jerseyNumber;
            player.position = position;
            player.height_feet = heightFeet;
            player.height_inches = heightInches;
        } else {
            player = [matches lastObject];
        }
    }
    return player;
}

+ (NSArray *)allPlayersInManagedObjectContext:(NSManagedObjectContext *)context
{
    NSArray *players = nil;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Player"];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"last_name" ascending:YES]];
    
    NSError *error;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    if (!matches || ([matches count] < 1)) {
        // handle error
        NSAssert(NO, @"wrong number of school day matches returned.");
        
    } else {
        NSLog(@"states loaded: %lu", (unsigned long)[matches count]);
        players = matches;
    }
    
    return players;
}

- (NSString *)humanHeight
{
    NSString *height = [NSString stringWithFormat:@"%i'%i", [self.height_feet intValue], [self.height_inches intValue]];
    return height;
}

- (NSString *)fullName
{
    return [NSString stringWithFormat:@"%@ %@", self.first_name, self.last_name];
}

- (Stats *) statsWithGame:(Game *) game
{
    Stats *stats = nil;
    NSFetchRequest *fetchRequest = [NSFetchRequest new];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Stats" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSPredicate *gamePredicate = [NSPredicate predicateWithFormat:@"game = %@", game];
    NSPredicate *playerPredicate = [NSPredicate predicateWithFormat:@"player = %@", self];
    
    //        NSCompoundPredicate *predicate = [NSCompoundPredicate andPredicateWithSubpredicates:@[last, first]];
    fetchRequest.predicate=[NSCompoundPredicate andPredicateWithSubpredicates:@[gamePredicate, playerPredicate]];
    
    NSError *error;
    NSArray *matches = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (matches && ([matches count] > 0)) {
        // handle error
        stats = [matches lastObject];
        
    }    return stats;
}

+ (NSDictionary *)totalsForStatsArray:(NSArray *)statsArray
{
    NSMutableDictionary *totals = [@{@"kills":@(0),
                                     @"blocks":@(0),
                                     @"digs":@(0),
                                     @"aces":@(0),
                                     @"assists":@(0)} mutableCopy];
    if (!([statsArray count] == 0)) {
        for (Stats* stat in statsArray) {
            totals[@"kills"] = @([totals[@"kills"] intValue] + [stat.kills intValue]);
            totals[@"blocks"] = @([totals[@"blocks"] intValue] + [stat.blocks intValue]);
            totals[@"digs"] = @([totals[@"digs"] intValue] + [stat.digs intValue]);
            totals[@"aces"] = @([totals[@"aces"] intValue] + [stat.aces intValue]);
            totals[@"assists"] = @([totals[@"assists"] intValue] + [stat.assists intValue]);
        }
    }
        return [NSDictionary dictionaryWithDictionary:totals];
}

- (NSDictionary *) allStats
{
    return [Player totalsForStatsArray:[self.stats allObjects]];
}
@end
