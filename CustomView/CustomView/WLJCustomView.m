//
//  WLJCustomView.m
//  CustomView
//
//  Created by Likingwang on 14-6-30.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import "WLJCustomView.h"

@implementation WLJCustomView

//触碰点坐标
int curX, curY;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    //获得绘图上下文
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //填充背景色
    CGContextSetFillColorWithColor(ctx, [[UIColor redColor] CGColor]);
    //以触碰点为圆心，绘制一个圆形
    CGContextFillEllipseInRect(ctx, CGRectMake(curX-10, curY-10, 20, 20));
    
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint lastTouch = [touch locationInView:self];
    curX = lastTouch.x;
    curY = lastTouch.y;
    
    [self setNeedsDisplay];
}

@end
