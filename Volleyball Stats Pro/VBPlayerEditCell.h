//
//  VBPlayerEditCell.h
//  Volleyball Stats Pro
//
//  Created by Kyle Oba on 5/27/14.
//  Copyright (c) 2014 Nikolai Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VBPlayerEditCellDelegate.h"
@class Player;

@interface VBPlayerEditCell : UITableViewCell
@property (strong, nonatomic) Player *player;
@property (weak, nonatomic) id<VBPlayerEditCellDelegate> delegate;
@end
