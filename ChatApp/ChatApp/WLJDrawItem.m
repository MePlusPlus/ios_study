//
//  WLJDrawItem.m
//  ChatApp
//
//  Created by Likingwang on 14-8-4.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import "WLJDrawItem.h"

@interface WLJDrawItem ()
@property (nonatomic, strong) UIView* internalView;
@end


@implementation WLJDrawItem
- (void)setRectSize:(CGSize)size
{
    _rect.size = size;
}

- (void)draw
{
    
}
@end


@implementation WLJDrawItemText

- (WLJDrawItemText *) initWithStr:(NSString *)str rect:(CGRect)rect font:(UIFont *)font color:(UIColor *)color
{
    if (self = [super init]) {
        self.rect = rect;
        self.font = font;
        self.color = color;
        self.str = str;
    }
    return self;
}

- (void) draw
{
    //ios7
    if (floor([[[UIDevice currentDevice] systemVersion] floatValue]) > (NSFoundationVersionNumber_iOS_6_0 + 1.0)) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle defaultParagraphStyle] mutableCopy];
        paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail; //末尾省略号
        paragraphStyle.alignment = NSTextAlignmentLeft;
        
        NSDictionary *dic = @{ NSFontAttributeName:self.font,
                               NSForegroundColorAttributeName:self.color,
                               NSParagraphStyleAttributeName:paragraphStyle
                               };
        [self.str drawInRect:self.rect withAttributes:dic];
    }else
    {
        [self.color set]; //设置描边和背景色
        [self.str drawInRect:self.rect withFont:self.font lineBreakMode:NSLineBreakByTruncatingTail alignment:NSTextAlignmentLeft];
    }
    
}

@end

@implementation WLJDrawItemLocalImage

- (id)initWithImage:(UIImage *)img frame:(CGRect)rect
{
    if (self = [super init]) {
        self.rect = rect;
        self.image = img;
    }
    return self;
}

-(void) draw
{
    [self.image drawInRect:self.rect];
}

@end