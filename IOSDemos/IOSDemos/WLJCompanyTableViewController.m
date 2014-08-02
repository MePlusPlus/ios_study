//
//  WLJCompanyTableViewController.m
//  IOSDemos
//
//  Created by Likingwang on 14-7-22.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import "WLJCompanyTableViewController.h"

@interface WLJCompanyTableViewController ()

@end

@implementation WLJCompanyTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    // 注意Dictionary中的key不是有序的，所以image不能用数组
    self.companyProducts = @{
                             @"Microsoft":@[@"Windows 7", @"SQL Server", @"Office", @"Xbox", @"Azure"],
                             @"Apple":@[@"Mac OS X", @"iPhone", @"iPad", @"iPod", @"MacBook"],
                             @"Google":@[@"Chrome", @"Scholar", @"Map", @"Search", @"Docs"]
                             };
    self.images = @{@"Microsoft":@"microsoft.png",  @"Apple":@"apple.jpg", @"Google":@"google.png"};
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

// 分区数量
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    return self.companyProducts.count;
}

// 每个分区对应的行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    if (section < self.companyProducts.count) {
        return ((NSArray *)self.companyProducts[self.companyProducts.allKeys[section]]).count;
    }
    return 0;
}

// 设置行缩进，返回整数，整数越大，朝右边偏离越多, 用于展示层次结构
// 这里没有起作用
- (NSInteger)tableView:(UITableView *)tableView indentationLevelForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //这里为了演示，每行都缩进
    if (indexPath.row == 0) {
        return 5;
    }
    return 0;
}

// 设置分区的头标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (section < self.companyProducts.count) {
        return self.companyProducts.allKeys[section];
    }
    
    return @"";
}

// 获取每个单元格的视图
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyTableCell" forIndexPath:indexPath];
    
    // 从ios5以后，由于可以关联xb文件，这个判断不需要了
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MyTableCell"];
    }
    
    UIImage *image = [UIImage imageNamed:self.images[self.companyProducts.allKeys[indexPath.section]]];
    cell.imageView.image = image;
    cell.textLabel.text = ((NSArray *)self.companyProducts[self.companyProducts.allKeys[indexPath.section]])[indexPath.row];
    
    // 改变字体，对于第一行进行特殊处理 不能在这里改变，否则会有重用的单元格(不是0行，也会被设置颜色的错误），因此需要恢复
    // 这里没有恢复，直接使用
    if (indexPath.row == 0) {
        cell.textLabel.font = [UIFont boldSystemFontOfSize:25];
        cell.textLabel.backgroundColor = [UIColor greenColor];
    }else
    {
        cell.textLabel.font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
        cell.textLabel.backgroundColor = [UIColor whiteColor];
    }
    return cell;
}

// 在用户选择某行前进行拦截，可以进行控制，和改变选中的行，可以让这一行无法响应事件
- (NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 对于第一行不能选中
    if (indexPath.row == 0) {
        return nil;
    }
    return indexPath;
}

// 选中某一行
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *str = [tableView cellForRowAtIndexPath:indexPath].textLabel.text;
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:str  delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil];
    [alert show];
}

// 设置行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
