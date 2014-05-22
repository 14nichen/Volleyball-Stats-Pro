//
//  Team+Create.h
//  Volleyball Stats Pro
//
//  Created by Nikolai Chen on 5/20/14.
//  Copyright (c) 2014 Nikolai Chen. All rights reserved.
//

#import "Team.h"

@interface Team (Create)

+ (Team *)createTeam:(NSString *)name withManagedObjectContext:(NSManagedObjectContext *)managedObjectContext;

@end
