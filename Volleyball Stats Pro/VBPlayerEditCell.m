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
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@end

@implementation VBPlayerEditCell


#pragma mark - Load Players

- (void)setPlayer:(Player *)player
{
    if (_player != player) {
        _player = player;
        self.lastNameTextField.text = player.last_name;
        self.firstNameTextField.text = player.first_name;
        self.jerseyNumTextField.text = [player.jersey_number stringValue];
    }
    [self updateButtons];
}

- (void)awakeFromNib
{
    // Initialization code
    [self updateButtons];
}


#pragma mark - Detect / Display Changes

- (BOOL)isExistingPlayer
{
    return (BOOL)self.player;
}

- (BOOL)textFieldsChanged
{
    BOOL isChanged = NO;
    if ([self isExistingPlayer]) {
        isChanged = ![self.lastNameTextField.text isEqualToString:self.player.last_name] ||
        ![self.firstNameTextField.text isEqualToString:self.player.first_name] ||
        ![self.jerseyNumTextField.text isEqualToString:[self.player.jersey_number stringValue]];
    
    } else {
        isChanged = (self.lastNameTextField.text && ![self.lastNameTextField.text isEqualToString:@""]) ||
        (self.firstNameTextField.text && ![self.firstNameTextField.text isEqualToString:@""]) ||
        (self.jerseyNumTextField.text && ![self.jerseyNumTextField.text isEqualToString:@""]);
    }
    return isChanged;
}

- (void)updateButtons
{
    self.saveButton.enabled = NO;
    if ([self textFieldsChanged]) {
        self.saveButton.enabled = YES;
    }
}

- (IBAction)textFieldEditingChanged:(UITextField *)sender
{
    [self updateButtons];
}


#pragma mark - Save Changes

- (void)createPlayer
{
    
}

- (void)updateExistingPlayer
{
    self.player.last_name = self.lastNameTextField.text;
    self.player.first_name = self.firstNameTextField.text;
    self.player.jersey_number = @([self.jerseyNumTextField.text integerValue]);
}

- (IBAction)savePressed:(UIButton *)sender
{
    if ([self textFieldsChanged]) {
        if ([self isExistingPlayer]) {
            [self updateExistingPlayer];
        } else {
            [self createPlayer];
        }
    }
    
    [self.lastNameTextField resignFirstResponder];
    [self.firstNameTextField resignFirstResponder];
    [self.jerseyNumTextField resignFirstResponder];
    [self updateButtons];
}

//- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
//{
//    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
//    if (self) {
//        // Initialization code
//    }
//    return self;
//}

//- (void)setSelected:(BOOL)selected animated:(BOOL)animated
//{
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
//}

@end
