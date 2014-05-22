//
//  VBStatCVCell.m
//  Volleyball Stats Pro
//
//  Created by Nikolai Chen on 5/9/14.
//  Copyright (c) 2014 Nikolai Chen. All rights reserved.
//

#import "VBStatCVCell.h"
#import "Stats+Create.h"

@interface VBStatCVCell ()

@property (strong, nonatomic) Stats *stats;

@end

@implementation VBStatCVCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void) setPlayer:(Player *)player
{
    if(_player!=player)
    {
        _player=player;
        self.nameLabel.text = [player fullName];
        self.numberLabel.text = [NSString stringWithFormat:@"%i", [player.jersey_number intValue]];
    }
}


- (void) setPlayer:(Player *)player andGame:(Game *)game
{
  
    self.player = player;
    self.stats = [Stats createStatsForPlayer:player game:game managedObjectContext:player.managedObjectContext];
    
}

- (void) setStats:(Stats *)stats
{
    if(_stats!=stats)
    {
        _stats=stats;
        self.killsStepper.value = [stats.kills doubleValue];
        self.blocksStepper.value = [stats.blocks doubleValue];
        self.digsStepper.value = [stats.digs doubleValue];
        self.acesStepper.value = [stats.aces doubleValue];
        self.assistsStepper.value = [stats.assists doubleValue];
        [self updateStatsLabels];
    }
}

- (IBAction)stepperValueChange:(UIStepper *)sender
{
    if (sender==self.killsStepper) {
        self.stats.kills = @(sender.value);
    }else if (sender==self.blocksStepper)
    {
        self.stats.blocks = @(sender.value);
    }else if (sender==self.digsStepper)
    {
        self.stats.digs = @(sender.value);
    }else if (sender==self.acesStepper)
    {
        self.stats.aces = @(sender.value);
    }else if (sender==self.assistsStepper)
    {
        self.stats.assists = @(sender.value);
    }
    [self updateStatsLabels];


    
}

- (void) updateStatsLabels
{
    self.killCountLabel.text = [NSString stringWithFormat:@"Kills: %i", [self.stats.kills intValue]];
    self.blockCountLabel.text = [NSString stringWithFormat:@"Blocks: %i", [self.stats.blocks intValue]];
    self.digCountLabel.text = [NSString stringWithFormat:@"Digs: %i", [self.stats.digs intValue]];
    self.aceCountLabel.text = [NSString stringWithFormat:@"Aces: %i", [self.stats.aces intValue]];
    self.assistCountLabel.text = [NSString stringWithFormat:@"Assists: %i", [self.stats.assists intValue]];
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
