//
//  WLJCoverView.m
//  IOSDemos
//
//  Created by Likingwang on 14-8-18.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import "WLJCoverView.h"

@implementation WLJCoverView



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES; //如果图片过大则剪切
        
        // 创建个视图容器
        if (self.container == nil) {
            self.container = [[UIView alloc] initWithFrame:self.bounds];
            [self addSubview:self.container];
        }
    }
    return self;
}

- (void)setCover:(NSString *)cover coverStyle:(WLJCoverStyle)style
{
    if (self.settingCoverImageView == nil) {
        self.settingCoverImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 320, 320)];
    }
    [self.container addSubview:self.settingCoverImageView];
    self.settingCoverImageView.hidden = NO;
    self.settingCoverImageView.transform = CGAffineTransformIdentity;
    self.settingCoverImageView.image = [UIImage imageNamed:cover];
    self.coverStyle = style;
    
    [self applyCoverStyleForCoverView:self.settingCoverImageView];
}

// 如何裁剪比较的大的图片
- (void)applyCoverStyleForCoverView:(UIView *)coverView
{
    switch (self.coverStyle) {
        case WLJCoverStyle_VerticalTop:  //保留图像顶部
            coverView.frame = CGRectMake(0, 320-220, 320, 320);
            break;
            
        case WLJCoverStyle_VerticalBottom: //保留底部
            coverView.frame = CGRectMake(0, 0, 320, 320);
            break;
        case WLJCoverStyle_VerticalCenter: // 保留中间
        default:
            coverView.frame = CGRectMake(0, (320 - 220)+(220 - coverView.frame.size.height)/2, 320, coverView.frame.size.height);
            break;
    }
}

- (void)applyTransformForCoverView:(UIView *)coverView offset:(CGPoint)offset
{
    switch (self.coverStyle) {
        case WLJCoverStyle_VerticalTop:
        {
            if (offset.y <= 0) {
                if ((320-220) + offset.y > 0) {
                    CGAffineTransform transform = CGAffineTransformMakeTranslation(0, offset.y);
                    coverView.transform = transform;
                }
                {
                    CGAffineTransform transform = CGAffineTransformMakeTranslation(0, -(320 - 220));
                    coverView.transform = transform;
                    
                }
            }
        }
            break;
        case WLJCoverStyle_VerticalBottom:
        {
            
        };
            break;
        case WLJCoverStyle_VerticalCenter:
        default:
        {
            // 一开始表格的偏移都是 -64 ,下拉偏移量绝对值加大
            if (offset.y <= 0)
            {
                //如果图片没有完全显示，则需要调整偏移量，上下各一半
                if ((320 - 220)+(220 - 320)/2 + offset.y * 0.5 > 0) {
                    
                    // 这个移动，是指在原来的起点基础上移动变化多少，不是终点
                    // (0, -32)表示想y轴负方向移动32；(0,50)-(0,-32)变成(0,18)
                    CGAffineTransform transfor = CGAffineTransformMakeTranslation(0, offset.y * 0.5);
                  
                    coverView.transform = transfor;
                      NSLog(@"x=%f,y=%f", coverView.frame.origin.x, coverView.frame.origin.y);
                }
            }else  //如果是上拉表格
            {
                CGAffineTransform transfor = CGAffineTransformMakeTranslation(0, -((320 - 220)+(220 - 320)/2 + offset.y * 0.5));
                coverView.transform = transfor;
            }
        }
            break;
    }
}

- (void)disScroll:(CGPoint)offset
{
    CGPoint newOffset = CGPointMake(offset.x, offset.y);
    [self applyTransformForCoverView:self.settingCoverImageView offset:newOffset];
    
    if (newOffset.y > 220) {
       
    }
    
}
- (void)willBeginDraggind
{
    
}
- (void)didEndDragging
{
    
}

@end
