//
//  VBPlayerEditCell.m
//  Volleyball Stats Pro
//
//  Created by Kyle Oba on 5/27/14.
//  Copyright (c) 2014 Nikolai Chen. All rights reserved.
//

#import "VBPlayerEditCell.h"
#import "Player.h"

@interface VBPlayerEditCell ()
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *jerseyNumTextField;
@end

@implementation VBPlayerEditCell

- (void)setPlayer:(Player *)player
{
    if (_player != player) {
        _player = player;
        self.lastNameTextField.text = player.last_name;
        self.firstNameTextField.text = player.first_name;
        self.jerseyNumTextField.text = [player.jersey_number stringValue];
    }
}

//- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
//{
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if (self) {
//        // Initialization code
//    }
//    return self;
//}
//
//- (void)awakeFromNib
//{
//    // Initialization code
//}
//
//- (void)setSelected:(BOOL)selected animated:(BOOL)animated
//{
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

@end
