//
//  WLJLayoutInfo.h
//  ChatApp
//
//  Created by Likingwang on 14-8-4.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WLJDrawItem.h"

//列表保存所有布局组件信息，这些组件可以被绘制
@interface WLJLayoutInfo : NSObject
@property (nonatomic, assign) CGRect rect; //保存整个布局的大小
@property (nonatomic, strong) NSMutableArray *drawItems; //保存所有组件

- (void)increaseHeight:(CGFloat)delta;
- (void)decreaseHeight:(CGFloat)delta;
- (CGFloat)currentY;

- (void)addItem:(WLJDrawItem *)item;
- (void)insertItem:(WLJDrawItem *)item;
@end
