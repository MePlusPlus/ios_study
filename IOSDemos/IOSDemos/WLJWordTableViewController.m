
//
//  WLJWordTableViewController.m
//  IOSDemos
//
//  Created by Likingwang on 14-7-22.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import "WLJWordTableViewController.h"

@interface WLJWordTableViewController ()
@property (weak, nonatomic) IBOutlet UISearchBar *searchBar;

@end

@implementation WLJWordTableViewController

NSMutableArray *wordfilter;
// 搜索本身也有一张表，需要自己设置内容
// 重用同一个数据源，因此需要原来的表需要tag区分
UISearchDisplayController *searchController;

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
    NSString *path = [[NSBundle mainBundle] pathForResource:@"sortedword" ofType:@"plist"];
    self.words = [NSDictionary dictionaryWithContentsOfFile:path];
    self.keys = [[self.words allKeys] sortedArrayUsingSelector:@selector(compare:)];
    
    searchController = [[UISearchDisplayController alloc] initWithSearchBar:self.searchBar contentsController:self];
    
    // 处理本身的一些动作，例如开始搜索，结束搜索
    searchController.delegate = self;
    //指明搜索结果的数据源
    searchController.searchResultsDataSource = self;
    //指明用户与搜索结果交互是的动作，例如选中
    searchController.searchResultsDelegate = self;
    
    wordfilter = [NSMutableArray array];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    if (tableView.tag == 2) {
        return [self.keys count];
    }else
    return  1;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    NSArray *sectionWord = self.words[self.keys[section]];
    if (tableView.tag == 2) {
       return sectionWord.count;
    }else
    
    return [wordfilter count];
    
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    if (tableView.tag == 2) {
        return self.keys[section];
    }else
        return nil;
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MyWordCell" forIndexPath:indexPath];
    if (tableView.tag == 2) {
        cell.textLabel.text = ((NSArray *)self.words[self.keys[indexPath.section]])[indexPath.row];
    }else
        cell.textLabel.text = wordfilter[indexPath.row];

    return cell;
}

// 分区索引
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return self.keys;
}

#pragma mark -
#pragma  mark 搜索栏

// 注册单元格
- (void)searchDisplayController:(UISearchDisplayController *)controller didLoadSearchResultsTableView:(UITableView *)tableView
{
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"MyWordCell"];
}

// 当输入有改变时，调用该方法，刷新搜索显示
- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
    [wordfilter removeAllObjects];
    if(searchString.length > 0)
    {
        
        //谓词判断，对于每个key进行判断，key作为参数穿个word
        NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(NSString *word, NSDictionary *db) {
            
            NSRange range = [word rangeOfString:searchString options:NSCaseInsensitiveSearch];
            return range.location != NSNotFound;
        }];
        
        for (NSString *key in self.keys) {
            NSArray *matches = [self.words[key] filteredArrayUsingPredicate:predicate];
            [wordfilter addObjectsFromArray:matches];
        }
    }
    return  YES;
}
@end
