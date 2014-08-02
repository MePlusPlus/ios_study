//
//  WLJWordTableViewController.h
//  IOSDemos
//
//  Created by Likingwang on 14-7-22.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLJWordTableViewController : UITableViewController <UISearchDisplayDelegate>
@property (strong, nonatomic) NSDictionary *words;
@property (strong, nonatomic) NSArray *keys;

@end
