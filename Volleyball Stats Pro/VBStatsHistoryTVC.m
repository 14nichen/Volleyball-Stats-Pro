//
//  VBStatsHistoryTVC.m
//  Volleyball Stats Pro
//
//  Created by Nikolai Chen on 5/16/14.
//  Copyright (c) 2014 Nikolai Chen. All rights reserved.
//

#import "VBStatsHistoryTVC.h"
#import "Player+Create.h"

@interface VBStatsHistoryTVC ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *killsLabel;
@property (weak, nonatomic) IBOutlet UILabel *digsLabel;
@property (weak, nonatomic) IBOutlet UILabel *assistsLabel;
@property (weak, nonatomic) IBOutlet UILabel *blocksLabel;
@property (weak, nonatomic) IBOutlet UILabel *acesLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end

@implementation VBStatsHistoryTVC

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
    NSDictionary *allStats = nil;
    if (!self.game) {
        allStats = [self.player allStats];
        NSLog(@"All stats loaded %@", allStats);
    } else {
        Stats *stats = [self.player statsWithGame:self.game];
        if (!stats) {
            allStats = [Player totalsForStatsArray:@[]];
        } else {
            allStats = [Player totalsForStatsArray:@[stats]];
        }
        NSLog(@"One game stats loaded %@", allStats);
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setTimeStyle:NSDateFormatterShortStyle];
        [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
        self.dateLabel.text = [dateFormatter stringFromDate:self.game.date];
    }
    self.nameLabel.text = self.player.fullName;
    self.killsLabel.text = [NSString stringWithFormat:@"Kills: %i", [allStats[@"kills"] intValue]];
    self.digsLabel.text = [NSString stringWithFormat:@"Digs: %i", [allStats[@"digs"] intValue]];
    self.assistsLabel.text = [NSString stringWithFormat:@"Assists: %i", [allStats[@"assists"] intValue]];
    self.blocksLabel.text = [NSString stringWithFormat:@"Blocks: %i", [allStats[@"blocks"] intValue]];
    self.acesLabel.text = [NSString stringWithFormat:@"Aces: %i", [allStats[@"aces"] intValue]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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
