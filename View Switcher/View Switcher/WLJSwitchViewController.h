//
//  WLJSwitchViewController.h
//  View Switcher
//
//  Created by Likingwang on 14-7-1.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import <UIKit/UIKit.h>
@class WLJBlueViewController;
@class WLJYellowViewController;

@interface WLJSwitchViewController : UIViewController

@property (strong, nonatomic) WLJBlueViewController *blueViewController;
@property (strong, nonatomic) WLJYellowViewController *yellowViewController;

- (IBAction)switchViews:(id)sender;

@end
