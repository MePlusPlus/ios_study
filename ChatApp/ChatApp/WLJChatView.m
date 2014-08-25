//
//  WLJChatView.m
//  ChatApp
//
//  Created by Likingwang on 14-8-4.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import "WLJChatView.h"

@implementation WLJChatView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)dealloc
{
    self.postTableView.delegate = nil;
    self.postTableView.dataSource = nil;
}

- (void)setGroupInfo:(NSString *)groupId
{
    self.groupid = groupId;
    if (self.postTableView == nil) {
        self.postTableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStylePlain];
        self.postTableView.dataSource = self;
        self.postTableView.delegate = self;
        self.postTableView.allowsMultipleSelection = NO;
        self.postTableView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        self.postTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        self.postTableView.backgroundColor = [UIColor grayColor];
        //距离下边留下45的间隔 margin
        self.postTableView.contentInset = UIEdgeInsetsMake(0, 0, 45, 0);
        [self addSubview:self.postTableView];
    }
 
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

#pragma mark - tableview delegate datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return [[WLJMessageManager shareInstance] getCountOf:self.groupid];
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WLJTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WLJTableCell"];
    if (cell == nil) {
        /*
        cell = [[WLJTableViewCell alloc] init];*/
        cell = [[WLJTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"WLJTableCell"];
    }
    WLJMessageModel *model = [[WLJMessageManager shareInstance] getInstantMessage:self.groupid atIndex:indexPath.row];
    WLJLayoutInfo *layoutInfo = [WLJLayoutManager layoutWithInstantMessageModel:model];
    [cell setContent:layoutInfo withDelegate:nil];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
     WLJMessageModel *model = [[WLJMessageManager shareInstance] getInstantMessage:self.groupid atIndex:indexPath.row];
     //这里不会重复布局，因为布局信息已经缓存处理
     CGFloat height = [WLJLayoutManager currentHeightOfInstantMessageModel:model];
    return height;
}
@end
