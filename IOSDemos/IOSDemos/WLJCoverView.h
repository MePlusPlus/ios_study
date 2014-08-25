//
//  WLJCoverView.h
//  IOSDemos
//
//  Created by Likingwang on 14-8-18.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum _WLJCoverStyle {
    WLJCoverStyle_VerticalCenter = 0,
    WLJCoverStyle_VerticalTop,
    WLJCoverStyle_VerticalBottom,
} WLJCoverStyle;

@interface WLJCoverView : UIView

@property (strong, nonatomic)UIView *container;
@property (strong, nonatomic)UIImageView *settingCoverImageView;
@property (assign, nonatomic)WLJCoverStyle coverStyle;

// 设置本地图片名称，传数据给cover
- (void)setCover:(NSString *)cover coverStyle:(WLJCoverStyle)style;
- (void)showDefaultCover;

- (void)disScroll:(CGPoint)offset;
- (void)willBeginDraggind;
- (void)didEndDragging;

@end
