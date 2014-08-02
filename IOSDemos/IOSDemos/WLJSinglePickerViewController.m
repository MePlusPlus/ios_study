//
//  WLJSinglePickerViewController.m
//  IOSDemos
//
//  Created by Likingwang on 14-7-21.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import "WLJSinglePickerViewController.h"

@interface WLJSinglePickerViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
- (IBAction)buttonPressed:(id)sender;
@end

@implementation WLJSinglePickerViewController

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
    //加载数据
    self.heroNames = @[@"西门吹雪", @"独孤求败", @"慕容无敌", @"李寻欢", @"楚留香"];
    
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

#pragma mark 选取器数据源
//单组件，只有1个,日期选取器有3个组件
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

//单组件，只处理一个
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) {
        return [self.heroNames count];
    }
    return 0;
}

#pragma mark 选取器委托
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        return self.heroNames[row];
    }
    return @"";
}

- (IBAction)buttonPressed:(id)sender {
    NSString *msg = self.heroNames[[self.picker selectedRowInComponent:0]];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:msg delegate:nil
                                          cancelButtonTitle:@"知道了" otherButtonTitles:nil];
    [alert show];

    
}
@end
