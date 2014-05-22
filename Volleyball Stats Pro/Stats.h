//
//  Stats.h
//  Volleyball Stats Pro
//
//  Created by Nikolai Chen on 5/20/14.
//  Copyright (c) 2014 Nikolai Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Game, Player;

@interface Stats : NSManagedObject

@property (nonatomic, retain) NSNumber * aces;
@property (nonatomic, retain) NSNumber * assists;
@property (nonatomic, retain) NSNumber * blocks;
@property (nonatomic, retain) NSNumber * digs;
@property (nonatomic, retain) NSNumber * kills;
@property (nonatomic, retain) NSNumber * aceErrors;
@property (nonatomic, retain) NSNumber * assistErrors;
@property (nonatomic, retain) NSNumber * blockErrors;
@property (nonatomic, retain) NSNumber * killErrors;
@property (nonatomic, retain) NSNumber * digErrors;
@property (nonatomic, retain) Game *game;
@property (nonatomic, retain) Player *player;

@end
