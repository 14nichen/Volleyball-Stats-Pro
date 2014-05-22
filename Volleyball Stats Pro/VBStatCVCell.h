//
//  VBStatCVCell.h
//  Volleyball Stats Pro
//
//  Created by Nikolai Chen on 5/9/14.
//  Copyright (c) 2014 Nikolai Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Player+Create.h"
#import "Game.h"

@interface VBStatCVCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;
@property (weak, nonatomic) IBOutlet UILabel *killCountLabel;
@property (weak, nonatomic) IBOutlet UIStepper *killsStepper;
@property (weak, nonatomic) IBOutlet UILabel *blockCountLabel;
@property (weak, nonatomic) IBOutlet UIStepper *blocksStepper;
@property (weak, nonatomic) IBOutlet UILabel *digCountLabel;
@property (weak, nonatomic) IBOutlet UIStepper *digsStepper;
@property (weak, nonatomic) IBOutlet UILabel *aceCountLabel;
@property (weak, nonatomic) IBOutlet UIStepper *acesStepper;
@property (weak, nonatomic) IBOutlet UILabel *assistCountLabel;
@property (weak, nonatomic) IBOutlet UIStepper *assistsStepper;
@property (strong, nonatomic) Player *player;

- (void) setPlayer:(Player *)player andGame:(Game *)game;

@end
