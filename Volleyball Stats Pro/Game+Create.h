//
//  Game+Create.h
//  Volleyball Stats Pro
//
//  Created by Nikolai Chen on 5/5/14.
//  Copyright (c) 2014 Nikolai Chen. All rights reserved.
//

#import "Game.h"

@interface Game (Create)

+ (Game *)createGameWithManagedObjectContext:(NSManagedObjectContext *)managedObjectContext;
+ (NSArray *)allGamesInManagedObjectContext:(NSManagedObjectContext *)context;

@end
