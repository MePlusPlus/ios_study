//
//  WLJSFGauageView.m
//  MySFGaugeView
//
//  Created by Likingwang on 14-7-3.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import "WLJSFGauageView.h"

@interface WLJSFGauageView()

@property(nonatomic) CGFloat needleRadius; //仪表指针半径
@property(nonatomic) CGFloat bgRadius; //背景图片半径
@property(nonatomic) CGFloat currentRadian; //旋转的弧度

@end
@implementation WLJSFGauageView

static const CGFloat CUTOFF = 0.5; //左右被切掉的背景弧度

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
      
    }
    return self;
}

- (void)setup
{
    self.opaque = NO; //不透明，默认是不透明YES，这里设置该View透明
    self.contentMode = UIViewContentModeRedraw; //当view的bounds发生变化，重新绘制
    
    //添加手势处理，当手搬动仪表指针时
    self.currentRadian = 0;
    [self addGestureRecognizer:[[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)]];
    
}

- (void) awakeFromNib
{
    [self setup];
}

- (void)drawRect:(CGRect)rect
{
    [self drawBg];  //绘制仪表盘背景
    [self drawNeedle]; //绘制仪表指针
    [self drawLables]; //绘制仪表盘数字标签
    [self drawImageLables]; //绘制仪表盘表情标签
}

- (void)drawBg
{
    CGFloat starttime = M_PI + CUTOFF;
    CGFloat endtime = 2*M_PI - CUTOFF;
    
    //贝塞尔曲线绘制不规则多边形
    UIBezierPath *bgPath = [UIBezierPath bezierPath];
    [bgPath moveToPoint:[self center]];
    [bgPath addArcWithCenter:[self center] radius:self.bgRadius startAngle:(3*M_PI_2)+self.currentRadian endAngle:endtime clockwise:YES];
    [[self lighterColorForColor:[self bgColor]]];
    [[self bgColor] set];
    [bgPath fill];
    
    UIBezierPath *bgPath2 = [UIBezierPath bezierPath];
    [bgPath2 moveToPoint:[self center]];
    [bgPath2 addArcWithCenter:[self center] radius:self.bgRadius startAngle:(3 * M_PI_2) + self.currentRadian endAngle:endtime clockwise:YES];
    [[self lighterColorForColor:[self bgColor]] set];
    [bgPath2 fill];
    
    UIBezierPath *bgPathInner = [UIBezierPath bezierPath];
    [bgPathInner moveToPoint:[self center]];
    
    CGFloat innerRadius = self.bgRadius - (self.bgRadius * 0.3);
    [bgPathInner addArcWithCenter:[self center] radius:innerRadius startAngle:starttime endAngle:endtime clockwise:YES];
    [bgPathInner addLineToPoint:[self center]];
    
    self.backgroundColor ? [self.backgroundColor set] : [[UIColor whiteColor] set];
    [bgPathInner stroke];
    [bgPathInner fill];
    
    
}

- (UIColor *)lighterColorForColor:(UIColor *)c
{
    CGFloat r, g, b, a;
    if ([c getRed:&r green:&g blue:&b alpha:&a])
        return [UIColor colorWithRed:MIN(r + 0.1, 1.0) green:MIN(g + 0.1, 1.0) blue:MIN(b + 0.1, 1.0) alpha:a];
        
    return nil;
}

- (void) drawNeedle
{
    CGFloat distance = [self bgRadius] + ([self bgRadius] * 0.1);
    CGFloat starttime = 0;
    CGFloat endtime = M_PI;
    
    CGPoint center = [self center];
    CGPoint topPoint = CGPointMake([self center].x, [self center].y - distance);
    CGPoint finishPoint = CGPointMake([self center].x + self.needleRadius, [self center].y);
    
    UIBezierPath *needlePath = [UIBezierPath bezierPath]; //empty path
    [needlePath moveToPoint:center];
    CGPoint next;
    next.x = center.x + self.needleRadius * cos(starttime);
    next.y = center.y + self.needleRadius * sin(starttime);
    [needlePath addLineToPoint:next]; //go one end of arc
    [needlePath addArcWithCenter:center radius:self.needleRadius startAngle:starttime endAngle:endtime clockwise:YES]; //add the arc
    [needlePath addLineToPoint:topPoint]; //back to center
    [needlePath addLineToPoint:finishPoint]; //back to center
    
    CGAffineTransform translate = CGAffineTransformMakeTranslation(-1 * (self.bounds.origin.x + [self center].x), -1 * (self.bounds.origin.y + [self center].y));
    [needlePath applyTransform:translate];
    
    CGAffineTransform rotate = CGAffineTransformMakeRotation(self.currentRadian);
    [needlePath applyTransform:rotate];
    
    translate = CGAffineTransformMakeTranslation((self.bounds.origin.x + [self center].x), (self.bounds.origin.y + [self center].y));
    [needlePath applyTransform:translate];
    
    [[self needleColor] set];
    [needlePath fill];
}

@end
