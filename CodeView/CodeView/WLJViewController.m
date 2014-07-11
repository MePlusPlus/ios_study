//
//  WLJViewController.m
//  CodeView
//
//  Created by Likingwang on 14-6-30.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "WLJViewController.h"

@interface WLJViewController ()

@end

//  实现动态添加和删除控件布局
@implementation WLJViewController

int nextY = 80;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //设置view的背景色
    self.view.backgroundColor = [UIColor grayColor];
    //初始化labels数组
    self.labels = [NSMutableArray array];
    //创建UIButton对象
    UIButton * addBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    //设置UIButton的大小和位置
    addBtn.frame = CGRectMake(30, 30, 60, 40);
    
    //设置文本
    [addBtn setTitle:@"添加" forState:UIControlStateNormal];
    //为addBtn的Touch UP inside绑定事件处理方法
    [addBtn addTarget:self action:@selector(add:) forControlEvents:UIControlEventTouchUpInside];
    
    //创建UIButton对象
    UIButton * removeBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    
    //设置UIButton的大小和位置
    removeBtn.frame = CGRectMake(230, 30, 60, 40);
    
    //设置文本
    [removeBtn setTitle:@"删除" forState:UIControlStateNormal];
    //为addBtn的Touch UP inside绑定事件处理方法
    [removeBtn addTarget:self action:@selector(remove:) forControlEvents:UIControlEventTouchUpInside];
    

    [self.view addSubview:addBtn];
    [self.view addSubview:removeBtn];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)add:(id)sender
{
    //创建一个UILabel控件
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(80, nextY, 160, 30)];
    label.text = @"I Can do it";
    [self.labels addObject:label];
    [self.view addSubview:label];
    nextY += 50;
}

- (void)remove:(id)sender
{
    if([self.labels count] > 0)
    {
        [[self.labels lastObject] removeFromSuperview];
        [self.labels removeLastObject];
        nextY -= 50;
    }
}

@end
