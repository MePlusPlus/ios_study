//
//  WLJTableViewCell.h
//  ChatApp
//
//  Created by Likingwang on 14-8-4.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLJLayoutInfo.h"
@interface WLJTableViewCell : UITableViewCell
- (void)setContent:(WLJLayoutInfo *)info withDelegate:(id)delegate;
@end
