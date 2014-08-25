//
//  WLJTableViewCell.m
//  ChatApp
//
//  Created by Likingwang on 14-8-4.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import "WLJTableViewCell.h"

@interface WLJLayoutableView : UIView
@property (nonatomic, strong) WLJLayoutInfo* info;
@end

@implementation WLJLayoutableView
- (id) initWithFrame:(CGRect)frame
{
    id view = [super initWithFrame:frame];
    if (view) {
        self.backgroundColor = [UIColor clearColor];
        self.userInteractionEnabled = NO;
    }
    return view;
}

- (void) setcontent:(WLJLayoutInfo *)info
{
    if (self.info != info) {
        CGRect frame = CGRectMake(0, 0, 320, (info.rect.size.height));
        self.frame = frame;
        self.info = info;
        [self setNeedsDisplay];
        
    }
}

- (void) drawRect:(CGRect)rect
{
    [super drawRect: rect];
    for (WLJDrawItem* item in self.info.drawItems) {
        [item draw];
    }
}


@end


// 一个巨坑，必须加上方括号，之前忘记写了变成全局变量，导致只会显示一个cell的视图
@interface WLJTableViewCell()
{
    
        WLJLayoutableView *postView;
    
}

@end

@implementation WLJTableViewCell
// 一个巨坑，必须加上方括号，之前忘记写了变成全局变量，导致只会显示一个cell的视图
// 更好的写法，是放到匿名类别中
//{ WLJLayoutableView *postView;}

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
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

// 整个cell也是基于UIView视图体系进行绘制
- (void)setContent:(WLJLayoutInfo *)info withDelegate:(id)delegate
{
    if (postView == nil) {
        postView = [[WLJLayoutableView alloc] initWithFrame:info.rect];
        [self.contentView addSubview:postView];
    }
    
    [postView setcontent:info];
    
    //清空contentView中之前的
    for (UIView* view in self.contentView.subviews) {
        if (view != postView) {
            [view removeFromSuperview];
        }
    }
}

@end
