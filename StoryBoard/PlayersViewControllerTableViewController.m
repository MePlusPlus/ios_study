//
//  PlayersViewControllerTableViewController.m
//  StoryBoard
//
//  Created by Likingwang on 14-6-26.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import "PlayersViewControllerTableViewController.h"
#import "WLJPlayer.h"
#import "WLJPlayerCellTableViewCell.h"

@interface PlayersViewControllerTableViewController ()

@end

@implementation PlayersViewControllerTableViewController

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
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return [self.players count];
}

#pragma mark - PlayerDetailsViewControllerDelegate

-(void)playerDetailsViewControllerDidCancel:(PlayerDetailsViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)playerDetailsViewControllerDidSave:(PlayerDetailsViewController *)controller
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"addPlayer"]) {
        UINavigationController *navigationController = segue.destinationViewController;
        PlayerDetailsViewController *playerDetailsViewController = [navigationController viewControllers][0];
        playerDetailsViewController.delegate = self;
    }
}

-(void)playerDetailsViewController:(PlayerDetailsViewController *)controller didAddPlayer:(WLJPlayer *)player
{
    [self.players addObject:player];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:([self.players count]-1) inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"playerCell" forIndexPath:indexPath];
    
    WLJPlayerCellTableViewCell *cell = (WLJPlayerCellTableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"playerCell"];
    WLJPlayer *player = (self.players)[indexPath.row];
    
    //tag方式绑定，获取
    
    /*
    UILabel *nameLabel = (UILabel *)[cell viewWithTag:100];
    nameLabel.text = player.name;
    
    UILabel *gameLabel = (UILabel *)[cell viewWithTag:101];
    gameLabel.text = player.game;
    
    UIImageView *ratingImageView = (UIImageView *)[cell viewWithTag:102];
    ratingImageView.image = [self imageForRating:player.rating];
     */
    
    //通过IBOutlet获取
    cell.nameLabel.text = player.name;
    cell.gameLabel.text = player.game;
    cell.ratingImageView.image = [self imageForRating:player.rating];
    
    
    // Configure the cell...
    
    return cell;
}

-(UIImage *) imageForRating:(int)rating
{
    switch (rating) {
        case 1:
            return [UIImage imageNamed:@"icon.jpg"];
            break;
            
        default:
            return [UIImage imageNamed:@"icon.jpg"];
            break;
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
