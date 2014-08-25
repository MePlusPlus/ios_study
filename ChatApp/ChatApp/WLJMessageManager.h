//
//  WLJMessageManager.h
//  ChatApp
//
//  Created by Likingwang on 14-8-4.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WLJMessageModel.h"
#import "WLJProtocol.h"

@interface WLJMessageManager : NSObject

//模拟两个Group的数据，a，和 b
@property (nonatomic, strong) NSMutableArray *aGroupData;
@property (nonatomic, strong) NSMutableArray *bGroupData;
//获取消息管理器单例
+ (WLJMessageManager *)shareInstance;

//获取已经加载的消息数量
- (NSInteger)getCountOf:(NSString *)groupId;

//获取某一条消息,已经加载的列表中的消息
- (WLJMessageModel *)getInstantMessage:(NSString *)groupId atIndex:(NSInteger)index;

//主动刷新时拉取历史消息
- (void)requestHistory:(NSString *)groupId;

@end
