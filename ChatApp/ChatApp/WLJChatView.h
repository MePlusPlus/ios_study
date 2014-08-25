//
//  WLJChatView.h
//  ChatApp
//
//  Created by Likingwang on 14-8-4.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLJMessageManager.h"
#import "WLJLayoutInfo.h"
#import "WLJMessageModel.h"
#import "WLJTableViewCell.h"
#import "WLJLayoutManager.h"

@interface WLJChatView : UIView <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *postTableView;
@property (nonatomic, strong) NSString* groupid;

//设置group信息，展示相应的消息列表
- (void)setGroupInfo:(NSString *)groupId;
@end
