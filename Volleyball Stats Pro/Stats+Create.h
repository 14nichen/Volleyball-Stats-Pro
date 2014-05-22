//
//  Stats+Create.h
//  Volleyball Stats Pro
//
//  Created by Nikolai Chen on 5/6/14.
//  Copyright (c) 2014 Nikolai Chen. All rights reserved.
//

#import "Stats.h"

@interface Stats (Create)

+ (Stats *)createStatsForPlayer:(Player *)player game:(Game *)game managedObjectContext:(NSManagedObjectContext *)managedObjectContext;

@end
