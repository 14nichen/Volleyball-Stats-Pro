//
//  VBTeamTVC.m
//  Volleyball Stats Pro
//
//  Created by Nikolai Chen on 4/30/14.
//  Copyright (c) 2014 Nikolai Chen. All rights reserved.
//

#import "VBTeamTVC.h"
#import "VBAppDelegate.h"
#import "Player+Create.h"
#import "VBPlayerTVC.h"
#import "VBStatsTVC.h"
#import "VBStatsHistoryTVC.h"

@interface VBTeamTVC ()


@property (strong, nonatomic) NSArray *players;

@end

@implementation VBTeamTVC

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"Hello!");
    VBAppDelegate *delegate=[UIApplication sharedApplication].delegate;
    self.context=delegate.managedObjectContext;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [self.players count];
}

- (void)setContext:(NSManagedObjectContext *)context
{
    _context = context;
    self.players = [Player allPlayersInManagedObjectContext:context];
    [self.tableView reloadData];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Player" forIndexPath:indexPath];
    
    Player *player = self.players[indexPath.row];
    cell.textLabel.text = player.last_name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%i", [player.jersey_number intValue]];
    
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    Player *player = self.players[[self.tableView indexPathForSelectedRow].row];
    if ([segue.identifier isEqualToString:@"Go to Player"]) {
        VBPlayerTVC *vc = (VBPlayerTVC*)segue.destinationViewController;
        vc.context = self.context;
        vc.player = player;
    }else if ([segue.identifier isEqualToString:@"Go to Game Stats"]){
        VBStatsTVC *vc = (VBStatsTVC*)segue.destinationViewController;
        vc.context = self.context;
        vc.player = player;
        vc.game = self.game;
        vc.stats = [player statsWithGame:self.game];
    }else if ([segue.identifier isEqualToString:@"Go to All Stats"]){
        VBStatsHistoryTVC *vc = (VBStatsHistoryTVC*)segue.destinationViewController;
        vc.player = player;
        vc.game = self.game;
    }
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
