//
//  WLJAppDelegate.m
//  CodeView2
//
//  Created by Likingwang on 14-6-30.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "WLJAppDelegate.h"

@implementation WLJAppDelegate

UILabel *label;
int count = 0;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    //创建UIWindow，大小为整个屏幕大小
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //设置window的背景色
    self.window.backgroundColor = [UIColor whiteColor];
 
    
    //创建一个UIViewController
    UIViewController *controller = [[UIViewController alloc] init];
    self.window.rootViewController = controller;
    
    UIView *view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    controller.view = view;
    
    //创建圆角按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(120, 100, 80, 40);
    [button setTitle:@"确定" forState:UIControlStateNormal];
    [view addSubview:button];
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(60, 40, 180, 30)];
    label.text = @"初始文本";
    label.backgroundColor = [UIColor grayColor];
    [view addSubview:label];
    
    [button addTarget:self action:@selector(clickHandler:) forControlEvents:UIControlEventTouchUpInside];

    //让整个主window显示
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)clickHandler:(id)sender
{
    count++;
    label.text = [NSString stringWithFormat:@"我变了%d次", count];
    
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
