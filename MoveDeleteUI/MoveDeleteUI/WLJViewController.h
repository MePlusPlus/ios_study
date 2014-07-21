//
//  WLJViewController.h
//  MoveDeleteUI
//
//  Created by Likingwang on 14-7-11.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLJViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

- (void)handleSwipeFrom:(UISwipeGestureRecognizer *)recoginer;

@end
