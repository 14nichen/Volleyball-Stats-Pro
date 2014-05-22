//
//  VBPLayerCVC.m
//  Volleyball Stats Pro
//
//  Created by Nikolai Chen on 5/8/14.
//  Copyright (c) 2014 Nikolai Chen. All rights reserved.
//

#import "VBPLayerCVC.h"
#import "Game+Create.h"
#import "VBAppDelegate.h"
#import "Player+Create.h"
#import "VBStatCVCell.h"
#import "VBAppDelegate.h"
#import "VBTeamTVC.h"

@interface VBPlayerCVC ()

@property (strong, nonatomic) Game *game;
@property (strong, nonatomic) NSArray *players;


@end

@implementation VBPlayerCVC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setTimeStyle:NSDateFormatterNoStyle];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    self.title = [dateFormatter stringFromDate:self.game.date];
    [self.collectionView registerNib:[UINib nibWithNibName:@"VBStatCVCell" bundle:[NSBundle mainBundle]]
        forCellWithReuseIdentifier:@"Player Cell"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(Game *) game
{
    if(!_game)
    {
        VBAppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
        if (!appDelegate.currentGame) {
            appDelegate.currentGame = [Game createGameWithManagedObjectContext:self.context];
            NSLog(@"creating game");
        } else {
            NSLog(@"resuming new game");
        }
        _game = appDelegate.currentGame;
    }
    return _game;
}

-(NSManagedObjectContext *) context
{
    if(!_context)
    {
        VBAppDelegate *appDelegate = (VBAppDelegate *)[UIApplication sharedApplication].delegate;
        _context = appDelegate.managedObjectContext;
    }
    return _context;
}

-(NSArray *) players
{
    if(!_players)
    {
        _players = [Player allPlayersInManagedObjectContext:self.context];
    }
    return _players;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 6;
    
    //    return [self.players count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    VBStatCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Player Cell" forIndexPath:indexPath];
    [cell setPlayer:self.players[indexPath.row] andGame:self.game];
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"End Game"]) {
        VBTeamTVC *vc = (VBTeamTVC *)segue.destinationViewController;
        vc.game = self.game;
        VBAppDelegate *appDelegate = (VBAppDelegate *)[UIApplication sharedApplication].delegate;
        appDelegate.currentGame = nil;
        NSLog(@"Ending Game");
    }
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
