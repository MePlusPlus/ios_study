//
//  PlayerDetailsViewController.m
//  StoryBoard
//
//  Created by Likingwang on 14-6-26.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import "PlayerDetailsViewController.h"
#import "WLJPlayer.h"

@interface PlayerDetailsViewController ()

@end

@implementation PlayerDetailsViewController
{
    NSString *_game;
}

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
    self.detailLabel.text = _game;
    // Do any additional setup after loading the view.
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if ((self = [super initWithCoder:aDecoder])) {
        NSLog(@"init PlayerDetailsViewController");
        _game = @"Chess";
    }
    return self;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"pickGame"]) {
        GamePickerTableViewController *gamePickerViewController = segue.destinationViewController;
        gamePickerViewController.delegate = self;
        gamePickerViewController.game = _game;
    }
}

- (void)gamePickerViewController:(GamePickerTableViewController *)controller didSelectGame:(NSString *)game
{
    _game = game;
    self.detailLabel.text = _game;
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)cancel:(id)sender
{
    [self.delegate playerDetailsViewControllerDidCancel:self];
}

-(IBAction)done:(id)sender
{
    WLJPlayer *player = [[WLJPlayer alloc] init];
    player.name = self.nameTextField.text;
    player.game = _game;
    player.rating = 1;
    [self.delegate playerDetailsViewController:self didAddPlayer:player];
}

- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        [self.nameTextField becomeFirstResponder];
    }
}


- (void)dealloc
{
    NSLog(@"dealloc PlayerDetailViewController");
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
