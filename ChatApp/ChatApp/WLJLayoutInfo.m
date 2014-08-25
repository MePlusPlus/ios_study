//
//  WLJLayoutInfo.m
//  ChatApp
//
//  Created by Likingwang on 14-8-4.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import "WLJLayoutInfo.h"

@implementation WLJLayoutInfo

- (id)init
{
    if (self = [super init]) {
        self.drawItems = [[NSMutableArray alloc] initWithCapacity:3];
    }
    return self;
}

- (void)increaseHeight:(CGFloat)delta
{
    _rect.size.height +=  delta;
}

- (void)decreaseHeight:(CGFloat)delta
{
    _rect.size.height -= delta;
}

- (CGFloat)currentY
{
    return _rect.size.height;
}

- (void)addItem:(WLJDrawItem *)item
{
    [_drawItems addObject:item];
}

- (void)insertItem:(WLJDrawItem *)item
{
    [_drawItems insertObject:item atIndex:0];
    _rect.size.height += item.rect.size.height;
}

@end
