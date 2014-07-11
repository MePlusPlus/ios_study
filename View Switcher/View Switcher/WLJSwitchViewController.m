//
//  WLJSwitchViewController.m
//  View Switcher
//
//  Created by Likingwang on 14-7-1.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import "WLJSwitchViewController.h"
#import "WLJYellowViewController.h"
#import "WLJBlueViewController.h"

@interface WLJSwitchViewController ()

@end

@implementation WLJSwitchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
       
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    /*
    //加载完视图后，执行其它的操作，加载第一个页面
    self.blueViewController = [[WLJBlueViewController alloc]initWithNibName:@"BlueView" bundle:nil];
    [self.view insertSubview:self.blueViewController.view atIndex:0];*/
}

- (IBAction)switchViews:(id)sender
{
    //动画
    [UIView beginAnimations:@"View Flip" context:NULL];
    [UIView setAnimationDuration:1.25];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    
    //如果该视图没有父视图，则释放它
    if (self.yellowViewController.view.superview == nil) {
        if (self.yellowViewController == nil) {
            self.yellowViewController = [[WLJYellowViewController alloc] initWithNibName:@"YellowView" bundle:nil];
        }
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view cache:YES];
        
        [self.blueViewController.view removeFromSuperview];
        [self.view insertSubview:self.yellowViewController.view atIndex:0];
    }else
    {
        if (self.blueViewController == nil) {
            self.blueViewController = [[WLJBlueViewController alloc] initWithNibName:@"BlueView" bundle:nil];
        }
        [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromLeft forView:self.view cache:YES];        [self.yellowViewController.view removeFromSuperview];
        [self.view insertSubview:self.blueViewController.view atIndex:0];
    }
    
    [UIView commitAnimations];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // 释放没有用到的数据
    if (self.blueViewController.view.superview == nil) {
        self.blueViewController = nil;
    }else
    {
        self.yellowViewController = nil;
    }
}


@end
