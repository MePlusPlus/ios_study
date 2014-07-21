//
//  WLJMessageModel.m
//  MoveDeleteUI
//
//  Created by Likingwang on 14-7-11.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import "WLJMessageModel.h"

@implementation WLJMessageModel

+ (NSArray *)getMessageData
{
    NSMutableArray *messages = [NSMutableArray array];
    WLJMessageModel *model = [[WLJMessageModel alloc]init];
    model.title = @"ios开发文章";
    model.summary = @"swift新语言发布...";
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc]init];
    dateFormatter.dateFormat = @"MM/dd/yyyy";
    model.time = [dateFormatter stringFromDate:[NSDate date]];
    
    model.count = @"10";
    model.logo = @"qipao";
    
    [messages addObject:model];
    
    return messages;
}
@end
