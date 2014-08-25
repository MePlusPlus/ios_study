//
//  WLJLayoutManager.h
//  ChatApp
//
//  Created by Likingwang on 14-8-4.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WLJMessageModel.h"
#import "WLJLayoutInfo.h"
#import "WLJDrawItem.h"

@interface WLJLayoutManager : NSObject
#pragma mark - 实时文字图片聊天消息
//获取聊天列表中每一行的高度，由于信息内容不一样，所以高度不一样
+ (CGFloat)currentHeightOfInstantMessageModel:(WLJMessageModel *)model;
//布局所有消息内容，绘制，并返回布局大小
+ (WLJLayoutInfo *)layoutWithInstantMessageModel:(WLJMessageModel *)model;
@end
