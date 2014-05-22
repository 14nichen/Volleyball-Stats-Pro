//
//  Game+Create.m
//  Volleyball Stats Pro
//
//  Created by Nikolai Chen on 5/5/14.
//  Copyright (c) 2014 Nikolai Chen. All rights reserved.
//

#import "Game+Create.h"

@implementation Game (Create)

+ (Game *)createGameWithManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    Game *game = nil;
    game = [NSEntityDescription insertNewObjectForEntityForName:@"Game"
                                         inManagedObjectContext:managedObjectContext];
    NSDate *date = [NSDate date];
    NSLog(@"Creating new Game: %@", date);
    game.date = date;
    return game;
}

+ (NSArray *)allGamesInManagedObjectContext:(NSManagedObjectContext *)context
{
    NSArray *games = nil;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Game"];
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"date" ascending:NO]];
    
    NSError *error;
    NSArray *matches = [context executeFetchRequest:request error:&error];
    
    if (!matches || ([matches count] < 1)) {
        // handle error
        NSAssert(NO, @"wrong number of school day matches returned.");
        
    } else {
        NSLog(@"states loaded: %lu", (unsigned long)[matches count]);
        games = matches;
    }
    
    return games;
}


@end
