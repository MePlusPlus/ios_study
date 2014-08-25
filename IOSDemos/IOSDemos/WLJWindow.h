//
//  WLJWindow.h
//  IOSDemos
//
//  Created by Likingwang on 14-8-22.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLJWindow : NSObject

+ (UIWindow *)windowForShow;
+ (void)show:(NSString *)message duration:(NSTimeInterval)duration;

@end
