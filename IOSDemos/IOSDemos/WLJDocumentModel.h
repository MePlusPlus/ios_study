//
//  WLJDocumentModel.h
//  IOSDemos
//
//  Created by Likingwang on 14-7-24.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import <Foundation/Foundation.h>

#define  kLinesKey @"wljlinekeys"
// 实现编解码，以及拷贝操作
@interface WLJDocumentModel : NSObject <NSCopying, NSCoding>
@property (copy, nonatomic) NSArray *lines; // 拷贝方式保存数据
@end
