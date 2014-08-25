//
//  WLJCoverTableViewController.h
//  IOSDemos
//
//  Created by Likingwang on 14-8-18.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLJCoverView.h"

@interface WLJCoverTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UITableView *tableView;

// cover
@property (strong, nonatomic) UIView *tableTopVisibleView; //cover 可见的view
@property (strong, nonatomic) WLJCoverView *coverView; //整个conver，包含非可见的部分


@end
