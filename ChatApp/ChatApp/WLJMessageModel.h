//
//  WLJMessageModel.h
//  ChatApp
//
//  Created by Likingwang on 14-8-4.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLJMessageModel : NSObject
@property (nonatomic, assign) int type; //消息类型 暂时用0-4 五种表示
@property (nonatomic, strong) NSString *data;
@end
