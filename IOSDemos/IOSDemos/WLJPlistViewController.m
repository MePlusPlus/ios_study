//
//  WLJPlistViewController.m
//  IOSDemos
//
//  Created by Likingwang on 14-7-23.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import "WLJPlistViewController.h"

@interface WLJPlistViewController ()
@property (strong, nonatomic) IBOutletCollection(UITextField) NSArray *lineFields;

- (IBAction)savedata:(id)sender;
- (IBAction)readdata:(id)sender;

// 将根view改成UIControl才能响应事件
- (IBAction)taped:(id)sender;

@end

@implementation WLJPlistViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 获取plist的存储路径
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
    return  [paths[0] stringByAppendingPathComponent:@"data.plist"];
}

- (IBAction)taped:(id)sender {
    // 这个不行，这个是当前controller对象（不是textfield对象）
    //[self resignFirstResponder];
    for(UITextField *text in self.lineFields)
    {
        [text resignFirstResponder];
    }
}

// 保存数据到plist
- (IBAction)savedata:(id)sender {
    NSString *path = [self dataFilePath];
    NSArray *array = [self.lineFields valueForKey:@"text"];
    // 先写入辅助文件，在写入其它的，避免失败对原来的文件进行破坏
    [array writeToFile:path atomically:YES];
}

// 读取数据显示
- (IBAction)readdata:(id)sender {
    NSString *path = [self dataFilePath];
    // 如果文件存在才读取（该方法也可以用于判断目录是否存在
    if ([[NSFileManager defaultManager] fileExistsAtPath:path]) {
        
        // 注意该文件必须是 writeToFile 产生的
        NSArray *array = [[NSArray alloc] initWithContentsOfFile:path];
        NSString *str = [array description];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"数据" message:str delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles: nil];
        [alert show];
    }
}
@end
