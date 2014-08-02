//
//  WLJCheckOneTableViewController.m
//  IOSDemos
//
//  Created by Likingwang on 14-7-23.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import "WLJCheckOneTableViewController.h"

@interface WLJCheckOneTableViewController ()
@property (nonatomic,strong) NSIndexPath *selectedRow; // 选中的行
@end

@implementation WLJCheckOneTableViewController

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
    self.selectedRow = nil; // 一开始，默认没有选中， 0表示选中第一行，NSNotFound是最大的整数，用于区分这种情况
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 必须先判断nil这种情况，否则导致第一次第一行无法选中
    // 因为nil调用时返回0； 0分区0行无法第一次选中
    if (self.selectedRow == nil || !(indexPath.section == self.selectedRow.section && indexPath.row == self.selectedRow.row))
    {
        UITableViewCell *oldCell = [tableView cellForRowAtIndexPath:self.selectedRow];
        oldCell.accessoryType = UITableViewCellAccessoryNone;
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        self.selectedRow = indexPath;
    }
    
    // 必须取消当前行的选中状态，否则就会有底色
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}


@end
