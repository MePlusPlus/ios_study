//
//  WLJMessageTableViewCell.h
//  MoveDeleteUI
//
//  Created by Likingwang on 14-7-11.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLJMessageTableViewCell : UITableViewCell

// 移除置顶按钮
@property (weak, nonatomic) IBOutlet UIButton *delete;
@property (weak, nonatomic) IBOutlet UIButton *top;
@property (weak, nonatomic) IBOutlet UIView *cellview;

@property (weak, nonatomic) IBOutlet UIImageView *logo;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *summary;
@property (weak, nonatomic) IBOutlet UILabel *time;
//消息条数或者类似于小气泡
@property (weak, nonatomic) IBOutlet UILabel *count;

@end
