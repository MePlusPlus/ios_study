//
//  WLJUpdateTableViewController.m
//  IOSDemos
//
//  Created by Likingwang on 14-7-23.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import "WLJUpdateTableViewController.h"

@interface WLJUpdateTableViewController ()
@property (nonatomic,strong) NSMutableArray *fruits;
@end

@implementation WLJUpdateTableViewController

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
    
    // 添加开启 编辑模式的 按钮
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    self.fruits = [@[@"苹果", @"梨子", @"香蕉", @"桃子", @"西瓜"] mutableCopy];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.fruits.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyTableCell"];
    cell.textLabel.text = self.fruits[indexPath.row];
    return cell;
}

// 表明某行是否支持删除和插入
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row > 3) {
        return  UITableViewCellEditingStyleInsert;
    }
    return UITableViewCellEditingStyleDelete;
}

// 禁止删除的行缩进
- (BOOL)tableView:(UITableView *)tableView shouldIndentWhileEditingRowAtIndexPath:(NSIndexPath *)indexPath
{
    return NO;
}

// 移动行
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    id object = [self.fruits objectAtIndex:sourceIndexPath.row];
    [self.fruits removeObjectAtIndex:sourceIndexPath.row];
    [self.fruits insertObject:object atIndex:destinationIndexPath.row];
}

// 删除行 和 添加行的处理
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.fruits removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObjects:indexPath,nil] withRowAnimation:UITableViewRowAnimationAutomatic];
    }else if(editingStyle == UITableViewCellEditingStyleInsert) {
        [self.fruits addObject:@"火星果"];
        NSIndexPath *path = [NSIndexPath indexPathForRow:self.fruits.count-1 inSection:0];
        
        // 此处不能这样调用，因为此时表格并没有新增加的一行
        // [tableView reloadRowsAtIndexPaths:[NSArray arrayWithObjects:path, nil] withRowAnimation:UITableViewRowAnimationAutomatic];
        [tableView insertRowsAtIndexPaths:[NSArray arrayWithObjects:path, nil] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
  
}


@end
