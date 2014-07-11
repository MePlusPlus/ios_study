//
//  WLJDetailViewController.h
//  ScaryBugs
//
//  Created by Likingwang on 14-6-30.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WLJDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
