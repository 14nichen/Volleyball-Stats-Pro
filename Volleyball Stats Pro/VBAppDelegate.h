//
//  VBAppDelegate.h
//  Volleyball Stats Pro
//
//  Created by Nikolai Chen on 4/3/14.
//  Copyright (c) 2014 Nikolai Chen. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Game.h"

@interface VBAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UIManagedDocument *document;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (strong, nonatomic) Game *currentGame;


@end
