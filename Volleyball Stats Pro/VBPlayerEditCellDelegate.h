//
//  VBPlayerEditCellDelegate.h
//  Volleyball Stats Pro
//
//  Created by Kyle Oba on 5/27/14.
//  Copyright (c) 2014 Nikolai Chen. All rights reserved.
//
@class VBPlayerEditCell;

@protocol VBPlayerEditCellDelegate <NSObject>

- (void)playerEditCell:(VBPlayerEditCell *)cell createPlayerWithLastName:(NSString *)lastName firstName:(NSString *)firstName jerseyNumber:(NSNumber *)jerseyNumber;

@end
