//
//  Team+Create.m
//  Volleyball Stats Pro
//
//  Created by Nikolai Chen on 5/20/14.
//  Copyright (c) 2014 Nikolai Chen. All rights reserved.
//

#import "Team+Create.h"

@implementation Team (Create)

+ (Team *)createTeam:(NSString *)name withManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    Team *team = nil;
    team = [NSEntityDescription insertNewObjectForEntityForName:@"Team"
                                         inManagedObjectContext:managedObjectContext];
    team.name = name;
    return team;
}

@end
