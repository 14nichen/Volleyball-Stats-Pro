//
//  VBStatsHistoryTVC.h
//  Volleyball Stats Pro
//
//  Created by Nikolai Chen on 5/16/14.
//  Copyright (c) 2014 Nikolai Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player.h"
#import "Game.h"

@interface VBStatsHistoryTVC : UITableViewController

@property (strong, nonatomic) Player *player;
@property (strong, nonatomic) Game *game;

@end
