//
//  WLJScaryBugDoc.h
//  ScaryBugs
//
//  Created by Likingwang on 14-6-30.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WLJScraryBugData;
//昆虫的尺寸的照片，小图片和ScaryBugData的数据模型
@interface WLJScaryBugDoc : NSObject

@property (strong) WLJScraryBugData *data;
@property (strong) UIImage *thumImage;
@property (strong) UIImage *fullImage;

- (id)initWithTitle:(NSString *)title rating:(float)rating thumbImage:(UIImage *)thumbImage fullImage:(UIImage *)fullImage;
@end
