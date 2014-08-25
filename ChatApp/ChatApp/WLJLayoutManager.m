//
//  WLJLayoutManager.m
//  ChatApp
//
//  Created by Likingwang on 14-8-4.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import "WLJLayoutManager.h"
#import "WLJProtocol.h"
#import "objc/runtime.h"

@implementation WLJLayoutManager

//获取聊天列表中每一行的高度，由于信息内容不一样，所以高度不一样
+ (CGFloat)currentHeightOfInstantMessageModel:(WLJMessageModel *)model
{
    return [[self layoutWithInstantMessageModel:model] currentY];
}
//布局所有消息内容，绘制，并返回布局大小
+ (WLJLayoutInfo *)layoutWithInstantMessageModel:(WLJMessageModel *)model
{
    //对对象关联值
    WLJLayoutInfo *layout = (WLJLayoutInfo *)objc_getAssociatedObject((NSObject *)model,(const void*)LAYOUT_KEY_IN_PUSH_MESSAGE_LIST);
    
    // 缓存，如果有，就不用在计算一次
    if (layout) {
        return layout;
    }
    
    layout = [[WLJLayoutInfo alloc] init];
    
    switch (model.type) {
        case 0:
        {
            WLJDrawItemLocalImage *image = [[WLJDrawItemLocalImage alloc] initWithImage:[UIImage imageNamed:@"smile.jpg"] frame:CGRectMake(0, 0,  100, 100)];
            [layout insertItem:image];
            break;
        }
        default:
        {
            WLJDrawItemText *text = [[WLJDrawItemText alloc] initWithStr:@"xxxx" rect:CGRectMake(220, 0, 30, 30)  font:[UIFont systemFontOfSize:16] color:[UIColor colorWithRed:0 green:255 blue:0 alpha:255]];
            [layout insertItem:text];
            break;
        }
    }
    objc_setAssociatedObject(model,(const void*)LAYOUT_KEY_IN_PUSH_MESSAGE_LIST , layout, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    return layout;
}
@end
