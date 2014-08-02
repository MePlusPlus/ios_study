//
//  WLJSpeedViewController.m
//  IOSDemos
//
//  Created by Likingwang on 14-7-23.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import "WLJSpeedViewController.h"
#import "WLJSettingsViewController.h"

@interface WLJSpeedViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *speed;
@property (weak, nonatomic) IBOutlet UISlider *speedfactor;
- (IBAction)engineSwitchTaged:(UISwitch *)sender;
- (IBAction)speedfactorSlider:(UISlider *)sender;
- (IBAction)closeButtonTaped:(id)sender;

@end

@implementation WLJSpeedViewController

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
    [self refresh];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)refresh
{
    NSUserDefaults *defaults  = [NSUserDefaults standardUserDefaults];
    self.speed.on = [defaults boolForKey:kUserSpeed];
    self.speedfactor.value = [defaults floatForKey:kUserSpeedFactor];
    
}

- (IBAction)engineSwitchTaged:(UISwitch *)sender {
    NSUserDefaults *set = [NSUserDefaults standardUserDefaults];
    [set setBool:sender.on forKey:kUserSpeed];
    [set synchronize];
}

- (IBAction)speedfactorSlider:(UISlider *)sender {
    NSUserDefaults *set = [NSUserDefaults standardUserDefaults];
    [set setFloat:sender.value forKey:kUserSpeedFactor];
    [set synchronize]; // 同步到存储
}

- (IBAction)closeButtonTaped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    UIApplication *app = [UIApplication sharedApplication];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(applicationWillEnterForeground:) name:UIApplicationWillEnterForegroundNotification object:app];
}

- (void)viewWillDisappear:(BOOL)animated
{
    // 移除当前对象所有的通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

// 用于系统设置改变时， 应用从后面返回时，通知刷新
- (void) applicationWillEnterForeground:(NSNotification *)notification
{
    NSUserDefaults *set = [NSUserDefaults standardUserDefaults];
    [set synchronize];
    [self refresh];
}
@end
