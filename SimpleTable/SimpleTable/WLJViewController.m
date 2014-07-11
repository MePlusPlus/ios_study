//
//  WLJViewController.m
//  SimpleTable
//
//  Created by Likingwang on 14-7-1.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import "WLJViewController.h"

@interface WLJViewController ()

@end

@implementation WLJViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.dwarves = @[@"Sleepy", @"Sneezy", @"Bashfull", @"Happy", @"Doc", @"Grumpy", @"Dopey", @"Thorin"
                     , @"Dorin", @"Nori", @"Ori", @"Balin", @"Dwalin", @"Fili", @"Kili", @"Oin"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//获取指定分区的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.dwarves count];
}

//获取特定行单元
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *SimpleTableIdentifier = @"SimpleTableIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:SimpleTableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:SimpleTableIdentifier];
    }
    cell.textLabel.text = self.dwarves[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"icon01.jpg"];
    
    //改变字体
    cell.textLabel.font = [UIFont boldSystemFontOfSize:50];
    return cell;;
    
}

//指明每行的级别缩进
- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.row;
}


//被点击，但未被选中，用于选中之前进行响应,可以禁止某些行的访问
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return nil;
    }else
        return indexPath;
}

//选中某一行，点击被选中
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *rowValue = self.dwarves[indexPath.row];
    NSString *message = [[NSString alloc] initWithFormat:@"You selected %@", rowValue];
    UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Row selected"
                                                   message:message delegate:nil
                                         cancelButtonTitle:@"Yes I Did" otherButtonTitles:nil];
    [alert show];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//改变行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70;
}
@end
