//
//  WLJArchierViewController.m
//  IOSDemos
//
//  Created by Likingwang on 14-7-24.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import "WLJArchierViewController.h"
#import "WLJDocumentModel.h"
#import "sqlite3.h"

@interface WLJArchierViewController ()
- (IBAction)read:(id)sender;
- (IBAction)save:(id)sender;
@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *lines;

@end

@implementation WLJArchierViewController

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
    // Do any additional setup after loading the view.
    [self createDb];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 获取归档文件的存储路径
- (NSString *)dataFilePath
{
    // 在当前用户作用域内 搜索用户主目录
    // YES表明展开 ~ 当前目录的符号
    // 展开以后，就是绝对路径
    NSArray *paths1 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, NO);
    NSLog(@"%@", paths1[0]);
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSLog(@"%@", paths[0]);
    // 组合成文件路径
    return  [paths[0] stringByAppendingPathComponent:@"data.archive"];
}


- (IBAction)read:(id)sender {
    NSData *data = [[NSMutableData alloc] initWithContentsOfFile:[self dataFilePath]];
    NSKeyedUnarchiver *unarchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    WLJDocumentModel *model = [unarchiver decodeObjectForKey:kLinesKey];
    [unarchiver finishDecoding];
    NSString *str = [model.lines description];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"数据" message:str delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil];
    [alert show];
}
- (IBAction)taped:(id)sender {
    for (UITextField *text in self.lines){
        [text resignFirstResponder];
    }
}

- (IBAction)save:(id)sender {
    NSString *path = [self dataFilePath];
    WLJDocumentModel *model = [[WLJDocumentModel alloc] init];
    model.lines = [self.lines valueForKey:@"text"];
    
    // 创新一块数据区域
    NSMutableData *data = [NSMutableData data];
    NSKeyedArchiver *archer = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    
    [archer encodeObject:model forKey:kLinesKey];
    [archer finishEncoding];
    [data writeToFile:path atomically:YES];
}

// 数据库保存 需要添加sqlite链接库 必须是C字符串
- (IBAction)sqlsave:(id)sender {
    static int i=0;
    sqlite3 *database;
    if (sqlite3_open([[self sqlitefilepath] UTF8String], &database) != SQLITE_OK) {
        sqlite3_close(database);
        NSAssert(0, @"打开数据库失败");
    }
    for (UITextField *text in self.lines)
    {
        char *update = "INSERT OR REPLACE INTO T_FIELDS (ROW, FIELD_DATA) VALUES(?,?);";
        char *errorMsg = NULL;
        sqlite3_stmt *stmt;
        if (sqlite3_prepare_v2(database, update, -1, &stmt, nil) == SQLITE_OK) {
            sqlite3_bind_int(stmt, 1, i++);
            sqlite3_bind_text(stmt, 2, [text.text UTF8String], -1, NULL);
        }
        if (sqlite3_step(stmt) != SQLITE_DONE) {
            NSAssert(0, @"更新错误");
        }
        sqlite3_finalize(stmt);
    }
    sqlite3_close(database);
    
}

- (void)createDb
{
    sqlite3 *database;
    if (sqlite3_open([[self sqlitefilepath] UTF8String], &database) != SQLITE_OK) {
        sqlite3_close(database);
        NSAssert(0, @"打开数据库失败");
    }
    
    NSString *createSQL = @"CREATE TABLE IF NOT EXISTS T_FIELDS (ROW INTEGER PRIMARY KEY, FIELD_DATA TEXT);";
    if (sqlite3_exec(database, [createSQL UTF8String], NULL, NULL, NULL)) {
        sqlite3_close(database);
        NSAssert(0, @"表格创建失败");
    }
    
    sqlite3_close(database);
}

// 数据库查看 （先点查看创建数据库）
- (IBAction)readfromsql:(id)sender {
    sqlite3 *database;
    if (sqlite3_open([[self sqlitefilepath] UTF8String], &database) != SQLITE_OK) {
        sqlite3_close(database);
        NSAssert(0, @"打开数据库失败");
    }
    
    NSString *createSQL = @"CREATE TABLE IF NOT EXISTS T_FIELDS (ROW INTEGER PRIMARY KEY, FIELD_DATA TEXT);";
    if (sqlite3_exec(database, [createSQL UTF8String], NULL, NULL, NULL)) {
        sqlite3_close(database);
        NSAssert(0, @"表格创建失败");
    }
    NSString *query = @"SELECT ROW, FIELD_DATA FROM T_FIELDS ORDER BY ROW";
    sqlite3_stmt *statement;
    NSMutableArray *res = [NSMutableArray array];
    if (sqlite3_prepare_v2(database, [query UTF8String], -1, &statement, nil) == SQLITE_OK) {
        while (sqlite3_step(statement) == SQLITE_ROW) {
            int row = sqlite3_column_int(statement,0);
            char *rowData = (char *)sqlite3_column_text(statement, 1);
            NSString *fieldValue = [[NSString alloc] initWithUTF8String:rowData];
            [res addObject:fieldValue];
            
        }
        sqlite3_finalize(statement);
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"数据" message:[res description] delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil];
        [alert show];

    }
    
    sqlite3_close(database);
}

- (NSString *)sqlitefilepath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths[0] stringByAppendingPathComponent:@"data.sqlite"];
}
@end
