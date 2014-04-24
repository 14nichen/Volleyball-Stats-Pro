//
//  Player.h
//  Volleyball Stats Pro
//
//  Created by Nikolai Chen on 4/21/14.
//  Copyright (c) 2014 Nikolai Chen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Player : NSManagedObject

@property (nonatomic, retain) NSString * position;
@property (nonatomic, retain) NSNumber * jersey_number;
@property (nonatomic, retain) NSString * first_name;
@property (nonatomic, retain) NSString * last_name;

@end
