//
//  模仿网上 汽车仪表盘 进度效果
//  WLJSFGauageView.h
//  MySFGaugeView
//
//  Created by Likingwang on 14-7-3.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLJSFGauageView : UIView

@property (nonatomic) NSUInteger maxLevel;
@property (nonatomic) UIColor *needleColor;
@property (nonatomic) UIColor *bgColor;
@property (nonatomic) BOOL hideLevel;
@property (nonatomic) NSString *minImage;
@property (nonatomic) NSString *maximage;

- (NSInteger) currentLevel;
@end
