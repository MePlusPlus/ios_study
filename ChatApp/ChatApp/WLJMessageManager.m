
//
//  WLJMessageManager.m
//  ChatApp
//
//  Created by Likingwang on 14-8-4.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import "WLJMessageManager.h"

@implementation WLJMessageManager


#pragma mark -
#pragma mark 对象生命周期
- (id)init
{
    self = [super init];
    if (self) {
        self.aGroupData = [[NSMutableArray alloc] init];
        self.bGroupData = [[NSMutableArray alloc] init];
        WLJMessageModel *model = [[WLJMessageModel alloc] init];
        model.type = 0;
        model.data = @"xxx";
        
        WLJMessageModel *model1 = [[WLJMessageModel alloc] init];
        model1.type = 1;
        model1.data = @"xxx";
        
        WLJMessageModel *model2 = [[WLJMessageModel alloc] init];
        model2.type = 2;
        model2.data = @"xxx";
        
        WLJMessageModel *model3 = [[WLJMessageModel alloc] init];
        model3.type = 3;
        model3.data = @"xxxxx";
        
        WLJMessageModel *model4 = [[WLJMessageModel alloc] init];
        model4.type = 4;
        model4.data = @"xxxxxxxxx";
        
        [self.aGroupData addObject:model];
        [self.aGroupData addObject:model1];
        [self.aGroupData addObject:model2];
        [self.aGroupData addObject:model3];
        [self.aGroupData addObject:model4];
        [self.bGroupData addObject:model];
        return self;
    }
    return nil;
}

- (void)dealloc
{
    self.aGroupData = nil;
    self.bGroupData = nil;
}

#pragma mark - 获取消息数据函数
+ (WLJMessageManager *)shareInstance
{
    static WLJMessageManager *manager = nil;
    if (manager == nil) {
        manager = [[WLJMessageManager alloc] init];
    }
    return manager;
}

- (NSInteger)getCountOf:(NSString *)groupId
{
    if ([groupId  isEqualToString: @"a"]) {
        return [self.aGroupData count];
    }else if([groupId isEqualToString:@"b"])
    {
        return [self.bGroupData count];
    }
    return 0;
}

- (WLJMessageModel *)getInstantMessage:(NSString *)groupId atIndex:(NSInteger)index
{
    if ([groupId isEqualToString:@"a"]) {
        return self.aGroupData[index];
    }else if([groupId isEqualToString:@"b"])
    {
        return self.bGroupData[index];
    }
    return nil;
}

//主动拉取历史消息，网络通信异步拉取，成功以后通知界面更新
- (void)requestHistory:(NSString *)groupId
{
    int count = 16; //默认拉取16条
    int seq = [self getCountOf:groupId] + 1; //表示消息序列号从这里开始拉取
    
    //typeof用于获取变量类型声明
    __typeof(self) __weak weakSelf = self;
    //发送web请求数据，这里是模拟
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [NSThread sleepForTimeInterval:10];
        dispatch_async(dispatch_get_main_queue(), ^{
            //随机产生数据
            int type = rand()%5;
            WLJMessageModel *model = [[WLJMessageModel alloc] init];
            model.type = type;
            model.data = @"xxx";
            if ([groupId isEqualToString:@"a"]) {
                [weakSelf.aGroupData addObject:model];
            }else if([groupId isEqualToString:@"b"])
            {
                [weakSelf.bGroupData addObject:model];
            }
            //发送通知
            [[NSNotificationCenter defaultCenter] postNotificationName:KEY_NOTIFICATION_PUSH_MESSAGE_REFRESH object:weakSelf];
        });
    });
}
@end
