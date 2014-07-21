//
//  WLJMessageModel.h
//  MoveDeleteUI
//
//  Created by Likingwang on 14-7-11.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WLJMessageModel : NSObject

@property (strong, nonatomic) NSString *logo;
@property (strong, nonatomic) NSString *title;
@property (strong, nonatomic) NSString *summary;
@property (strong, nonatomic) NSString *time;
@property (strong, nonatomic) NSString *count;
+ (NSArray *)getMessageData;

@end
