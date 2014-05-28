//
//  VBPlayerEditTVC.m
//  Volleyball Stats Pro
//
//  Created by Kyle Oba on 5/27/14.
//  Copyright (c) 2014 Nikolai Chen. All rights reserved.
//

#import "VBPlayerEditTVC.h"
#import "VBPlayerEditCell.h"

static const NSInteger kMaxNumPlayersShown = 20;
static NSString *kPlayerEditCellId = @"Player Edit Cell";

@interface VBPlayerEditTVC ()
@property (nonatomic, strong) NSMutableArray *players;
@end

@implementation VBPlayerEditTVC

+ (NSDictionary *)dummyPlayerWithFName:(NSString *)fName lName:(NSString *)lName jerseyNum:(NSInteger)jerseyNum
{
    return @{@"first_name": fName,
             @"last_name": lName,
             @"jersey_number": @(jerseyNum)};
}

- (NSMutableArray *)players
{
    if (!_players) {
        _players = [NSMutableArray array];
        
        for (int i=0; i<6; i++) {
            NSString *fName = [NSString stringWithFormat:@"First %i", i];
            NSString *lName = [NSString stringWithFormat:@"Last %i", i];
            NSInteger jerseyNum = i;
            [_players addObject:[VBPlayerEditTVC dummyPlayerWithFName:fName
                                                                lName:lName
                                                            jerseyNum:jerseyNum]];
        }
    }
    return _players;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    [self players];
    [self.tableView registerNib:[UINib nibWithNibName:@"VBPlayerEditCell" bundle:nil]
         forCellReuseIdentifier:kPlayerEditCellId];
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
    return kMaxNumPlayersShown;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    VBPlayerEditCell *cell = [tableView dequeueReusableCellWithIdentifier:kPlayerEditCellId
                                                             forIndexPath:indexPath];
    // Configure the cell...
    if (indexPath.row < [self.players count]) {
        cell.player = self.players[indexPath.row];
    }
    
    return cell;
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
