//
//  WLJViewController.m
//  SimpleTable2
//
//  Created by Likingwang on 14-7-1.
//  Copyright (c) 2014年 ___FULLUSERNAME___. All rights reserved.
//

#import "WLJViewController.h"
#import "WLJNameAndColorTableViewCell.h"

@interface WLJViewController ()

@end

@implementation WLJViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.computers = @[
                       @{@"Name":@"MacBook", @"Color":@"White"},
                       @{@"Name":@"MacBook Pro", @"Color":@"Silver"}];
    UITableView *tableView  = (id)[self.view viewWithTag:1];
    [tableView registerClass:[WLJNameAndColorTableViewCell class] forCellReuseIdentifier:@"CellTableId"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.computers count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WLJNameAndColorTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellTableId"];
    NSDictionary *rowData = self.computers[indexPath.row];
    cell.name = rowData[@"Name"];
    cell.color = rowData[@"Color"];
    
    return cell;
}

@end
