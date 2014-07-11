//
//  PlayerDetailsViewController.h
//  StoryBoard
//
//  Created by Likingwang on 14-6-26.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GamePickerTableViewController.h";

@class WLJPlayer;

@class PlayerDetailsViewController;

@protocol PlayerDetailViewControllerDelegate <NSObject>

- (void)playerDetailsViewControllerDidCancel:(PlayerDetailsViewController *)controller;
- (void)playerDetailsViewControllerDidSave:(PlayerDetailsViewController *)controller;
- (void)playerDetailsViewController:(PlayerDetailsViewController *)controller didAddPlayer:(WLJPlayer *)player;
@end


@interface PlayerDetailsViewController : UITableViewController <GamePickerViewControllerDelegate>

@property (nonatomic, weak) id <PlayerDetailViewControllerDelegate> delegate;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;

-(IBAction)cancel:(id)sender;
-(IBAction)done:(id)sender;

@end
