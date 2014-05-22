//
//  VBTeamTVC.h
//  Volleyball Stats Pro
//
//  Created by Nikolai Chen on 4/30/14.
//  Copyright (c) 2014 Nikolai Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"

@interface VBTeamTVC : UITableViewController

@property (strong, nonatomic) NSManagedObjectContext *context;
@property (strong, nonatomic) Game *game;

@end
