//
//  WLJScraryBugData.h
//  ScaryBugs
//
//  Created by Likingwang on 14-6-30.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import <Foundation/Foundation.h>

// 昆虫的评分和名称 数据模型类
@interface WLJScraryBugData : NSObject

//strong表示运行时保留对象的引用，直到不被引用
@property (strong) NSString *title;

//直接副职，不进行任何的内存的管理，一般是非对象类的数据
@property (assign) float rating;

- (id)initWithTitle:(NSString *)title rating:(float)rating;
@end
