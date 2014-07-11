//
//  WLJViewController.h
//  SimpleTable2
//
//  Created by Likingwang on 14-7-1.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLJViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (copy, nonatomic) NSArray *computers;

@end
