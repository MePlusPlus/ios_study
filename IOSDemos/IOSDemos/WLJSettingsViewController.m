//
//  WLJSettingsViewController.m
//  IOSDemos
//
//  Created by Likingwang on 14-7-23.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import "WLJSettingsViewController.h"



@interface WLJSettingsViewController ()
@property (weak, nonatomic) IBOutlet UILabel *protocol;
@property (weak, nonatomic) IBOutlet UILabel *username;
@property (weak, nonatomic) IBOutlet UILabel *speed;
@property (weak, nonatomic) IBOutlet UILabel *speedfactor;
- (IBAction)speedTaged:(id)sender;

@end

@implementation WLJSettingsViewController

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
    //读取配置 为了更新不在这里调用
    //[self refreshFeilds];
}

// 当modal辅助视图被解除时，该方法不会被动用
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self refreshFeilds];
}


- (void)refreshFeilds
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    self.username.text = [defaults objectForKey:kUserNanmeKey];
    self.protocol.text = [defaults objectForKey:kUserProtocol];
    //布尔值 必须用bool获取特定类型的值，否则始终为真
    self.speed.text = [defaults boolForKey:kUserSpeed]?@"开":@"关";
    //数字
    self.speedfactor.text = [[defaults objectForKey:kUserSpeedFactor] stringValue];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    UIApplication *app = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillEnterForeground:) name:UIApplicationWillEnterForegroundNotification object:app];
}

// 用于系统设置改变时， 应用从后面返回时，通知刷新
- (void) applicationWillEnterForeground:(NSNotification *)notification
{
    NSUserDefaults *set = [NSUserDefaults standardUserDefaults];
    [set synchronize];
    [self refreshFeilds];
}

- (void)viewWillDisappear:(BOOL)animated
{
    // 移除当前对象所有的通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (IBAction)speedTaged:(id)sender {
    // 不需要后缀名
    UIStoryboard *story = [UIStoryboard storyboardWithName:@"settings" bundle:nil];
    // 直接用初始的view，也可以定义 identifier
    // 本来一直无法显示出nav视图，因为storyBoard中的联线错误，应该使用自动加载的relationship
    // 而不能选择 manual push modal之类的（这个需要手动绑定触发，或者 有些系统控件action去触发（通过action连线）
    UINavigationController *nav = (UINavigationController *)[story instantiateInitialViewController];
    nav.modalPresentationStyle = UIModalPresentationFullScreen;
    nav.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    [self presentViewController:nav animated:YES completion:nil];
}
@end
