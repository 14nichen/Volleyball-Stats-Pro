//
//  Player+Create.m
//  Volleyball Stats Pro
//
//  Created by Nikolai Chen on 4/21/14.
//  Copyright (c) 2014 Nikolai Chen. All rights reserved.
//

#import "Player+Create.h"

@implementation Player (Create)

+ (Player *)createPlayerWithName:(NSString *)lastName firstName:(NSString *)firstName jerseyNumber:(NSNumber*)jerseyNumber position:(NSString *)position managedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    Player *player = nil;
    if ([lastName length]) {

        //        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Player"];
        //        request.predicate = [NSPredicate predicateWithFormat:@"name = %@", lastName];

        NSFetchRequest *fetchRequest = [NSFetchRequest new];
        NSEntityDescription *entity = [NSEntityDescription entityForName:@"Player" inManagedObjectContext:managedObjectContext];
        [fetchRequest setEntity:entity];
        
        NSError *error;
        NSArray *matches = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
        
        if (!matches || ([matches count] > 1)) {
            // handle error
            NSAssert(NO, @"wrong number of player matches returned.");
            
        } else if ([matches count] == 0) {
            NSLog(@"Creating new Player: %@", lastName);
            player = [NSEntityDescription insertNewObjectForEntityForName:@"Player"
                                                  inManagedObjectContext:managedObjectContext];
            player.last_name = lastName;
            player.first_name = firstName;
            player.jersey_number = jerseyNumber;
            player.position = position;
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
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name" ascending:YES]];
    
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

@end
