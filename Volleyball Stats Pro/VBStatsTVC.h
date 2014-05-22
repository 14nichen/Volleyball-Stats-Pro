//
//  VBStatsTVC.h
//  Volleyball Stats Pro
//
//  Created by Nikolai Chen on 5/15/14.
//  Copyright (c) 2014 Nikolai Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player+Create.h"
#import "Stats.h"
#import "Game.h"

@interface VBStatsTVC : UITableViewController

@property (strong, nonatomic) NSManagedObjectContext *context;
@property (strong, nonatomic) Player *player;
@property (strong, nonatomic) Stats *stats;
@property (strong, nonatomic) Game *game;

@end
