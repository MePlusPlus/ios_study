//
//  WLJDrawItem.h
//  ChatApp
//
//  Created by Likingwang on 14-8-4.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import <Foundation/Foundation.h>

//绘制元素基础类
@interface WLJDrawItem : NSObject

//基础属性
@property (nonatomic, assign) CGRect rect; //绘制区域
@property (nonatomic, assign) CGPoint focus;
@property (nonatomic, assign) NSInteger tag; //唯一标记该对象

- (void)draw;
- (void)setRectSize:(CGSize)size;
@end


//表情
@interface WLJDrawItemEmotion : WLJDrawItem
@property (nonatomic, strong) NSString* emoID; //表情id
@end

//本地图像
@interface WLJDrawItemLocalImage : WLJDrawItem
@property (nonatomic, strong) UIImage* image;
@property (nonatomic, strong) UIImage* maskIamge; //蒙版
- (id)initWithImage:(UIImage *)img frame:(CGRect)rect;
@end

//文本
@interface WLJDrawItemText : WLJDrawItem
@property (nonatomic, strong) NSString* str;
@property (nonatomic, strong) UIFont* font;
@property (nonatomic, strong) UIColor* color;

-(WLJDrawItemText *) initWithStr:(NSString *)str rect:(CGRect)rect font:(UIFont *)font color:(UIColor *)color;

@end