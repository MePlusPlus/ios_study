//
//  PlayersViewControllerTableViewController.h
//  StoryBoard
//
//  Created by Likingwang on 14-6-26.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PlayerDetailsViewController.h"


@interface PlayersViewControllerTableViewController : UITableViewController <PlayerDetailViewControllerDelegate>

@property (nonatomic, strong) NSMutableArray *players;
@end
