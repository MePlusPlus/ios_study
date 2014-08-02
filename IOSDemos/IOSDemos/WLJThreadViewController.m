//
//  WLJThreadViewController.m
//  IOSDemos
//
//  Created by Likingwang on 14-7-24.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import "WLJThreadViewController.h"

@interface WLJThreadViewController ()
@property (weak, nonatomic) IBOutlet UITextView *result;

// 界面卡主
- (IBAction)slowbutton:(id)sender;

// 慢线程，只将任务简单交给线程去做，提高了界面响应，但是时间没有减少
- (IBAction)slowGcd:(id)sender;
// 将任务分组
- (IBAction)groupGcd:(id)sender;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *spinner;

@end

@implementation WLJThreadViewController

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


// 慢工作方式
- (IBAction)slowbutton:(id)sender {
    NSDate *startTime = [NSDate date];
    NSString *processData = [self processData:[self fetchSomethingFromServer]];
    NSString *res = [NSString stringWithFormat:@"First:[%@]\nSecond:[%@]", [self calculateFirstResult:processData], [self calculateSecondResult:processData]];
    self.result.text = res;
    NSDate *endTime = [NSDate date];
    NSString *str = [NSString stringWithFormat:@"耗时%f秒",[endTime timeIntervalSinceDate:startTime]];
    [self showAlert:str];
    
}

- (IBAction)slowGcd:(id)sender {
    NSDate *startTime = [NSDate date];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSString *processData = [self processData:[self fetchSomethingFromServer]];
        NSString *res = [NSString stringWithFormat:@"First:[%@]\nSecond:[%@]", [self calculateFirstResult:processData], [self calculateSecondResult:processData]];
        
        //更新 主线程 UI
        dispatch_async(dispatch_get_main_queue(), ^{
            self.result.text = res;
            NSDate *endTime = [NSDate date];
            NSString *str = [NSString stringWithFormat:@"耗时%f秒",[endTime timeIntervalSinceDate:startTime]];
            [self showAlert:str];
        });

    });

}

- (IBAction)groupGcd:(id)sender {
    // 第一个计算和第二个计算可以并发
    NSDate *startTime = [NSDate date];
    
    [self.spinner startAnimating];
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        NSString *processData = [self processData:[self fetchSomethingFromServer]];
        __block NSString *first, *second;
        dispatch_group_t group = dispatch_group_create();
        
        __weak WLJThreadViewController *weak_self = self;
        dispatch_group_async(group, queue, ^{
            first = [weak_self calculateFirstResult:processData];
        })
        ;
        
        dispatch_group_async(group, queue, ^{
            second = [weak_self calculateSecondResult:processData];
        })
        ;
        
        dispatch_group_notify(group, queue, ^{
            NSString *res = [NSString stringWithFormat:@"First:[%@]\nSecond:[%@]", first, second];
            dispatch_async(dispatch_get_main_queue(), ^{
            weak_self.result.text = res;
            NSDate *endTime = [NSDate date];
            NSString *str = [NSString stringWithFormat:@"耗时%f秒",[endTime timeIntervalSinceDate:startTime]];
            [weak_self showAlert:str];
            [weak_self.spinner stopAnimating];
            });
            
        });
    });

    
}

- (void)showAlert:(NSString *)msg
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:msg delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil];
    [alert show];
}

- (NSString *)fetchSomethingFromServer
{
    [NSThread sleepForTimeInterval:1];
    return @"一些来自服务器的数据";
}

- (NSString *)processData:(NSString *)data
{
    [NSThread sleepForTimeInterval:2];
    return [data uppercaseString];
}

- (NSString *)calculateFirstResult:(NSString *)data
{
    [NSThread sleepForTimeInterval:1];
    return [NSString stringWithFormat:@"内容长度%d", [data length]];
}

- (NSString *)calculateSecondResult:(NSString *)data
{
    [NSThread sleepForTimeInterval:1];
    return [data stringByAppendingString:@"hahha"];
}
@end
