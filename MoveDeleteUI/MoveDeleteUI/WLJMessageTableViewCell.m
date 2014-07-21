//
//  WLJMessageTableViewCell.m
//  MoveDeleteUI
//
//  Created by Likingwang on 14-7-11.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import "WLJMessageTableViewCell.h"

@interface WLJMessageTableViewCell ()

@property (nonatomic)CGPoint startPoint;
@property (nonatomic)CGRect startFrame;
@end

@implementation WLJMessageTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
    self.delete.hidden = YES;
    self.top.hidden = YES;
    [self configGestureRecognizers];
}

- (void)configGestureRecognizers
{
   // UISwipeGestureRecognizer *left = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeHandle:)];
    UIPanGestureRecognizer *left = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(swipeHandle:)];
    [self addGestureRecognizer:left];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)swipeHandle:(UISwipeGestureRecognizer *)recognizer
{
        
        CGPoint point = [recognizer locationInView:self.contentView];
        CGFloat offsetX = point.x - self.startPoint.x;
        
        UIGestureRecognizerState state = recognizer.state;
        if (state == UIGestureRecognizerStateBegan) {
            self.delete.hidden = self.top.hidden = NO;
            self.startPoint = [recognizer locationInView:self.contentView];
            self.startFrame = self.cellview.frame;
        }else if (state == UIGestureRecognizerStateChanged)
        {
            self.cellview.frame = CGRectOffset(self.startFrame, offsetX, 0);
            //如果想右边滑动，则不改变，位置和contentView一致，contentView是默认所有cell内容的父容器
            if (self.cellview.frame.origin.x > 0)
            {
                self.cellview.frame = self.contentView.bounds;
            }
        }else if (state == UIGestureRecognizerStateEnded || state == UIGestureRecognizerStateCancelled || state == UIGestureRecognizerStateFailed)
        {
            //cellview 向左偏移 按钮宽度的一半则显示隐藏的按钮
            if (self.cellview.frame.origin.x < -self.delete.bounds.size.width/2) {
                [self setEditState:1];
            }else
            {
                [self setEditState:0];
            }
        }
    
    
}

- (void)setEditState:(NSInteger)state
{
    [UIView animateWithDuration:0.2 animations:^{
        if (state) {
            self.cellview.frame = CGRectOffset(self.contentView.bounds, -self.top.bounds.size.width*2, 0);
        }else
        {
            self.cellview.frame = self.contentView.bounds;
        }
    } completion:^(BOOL finished){
        if (state) {
            self.delete.hidden = self.top.hidden = NO;
        }else
        {
            self.delete.hidden = self.top.hidden = YES;
        }
    }];
}

@end
