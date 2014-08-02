//
//  WLJDoublePickerViewController.m
//  IOSDemos
//
//  Created by Likingwang on 14-7-21.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import "WLJDoublePickerViewController.h"

@interface WLJDoublePickerViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
- (IBAction)buttonPressed:(id)sender;

@end

@implementation WLJDoublePickerViewController

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
    //注意，该多组件部分之间是没有关联的数据，不会选择一个，影响另一个
    //因此数据此处改成 月饼品牌和果馅
    self.bookNames = @[@"安徽月饼", @"浙江月饼", @"广东月饼"];
    self.characterNames = @[@"菠萝馅", @"梨子馅", @"桃子馅"];
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
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == kBookComponent) {
        return self.bookNames.count;
    }else if(component == kCharacterCompont)
    {
        return self.characterNames.count;
    }
    return 0;
}

#pragma  mark 委托
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == kBookComponent)
    {
        return self.bookNames[row];
        
    }else if(component == kCharacterCompont)
    {
        return self.characterNames[row];
    }
    return @"";
}

- (IBAction)buttonPressed:(id)sender {
    NSInteger bookRow = [self.picker selectedRowInComponent:kBookComponent];
    NSInteger characterRow = [self.picker selectedRowInComponent:kCharacterCompont];
    NSString *msg = [NSString stringWithFormat:@"您选择了%@%@", self.bookNames[bookRow], self.characterNames[characterRow]];
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:msg delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles: nil];
    [alert show];
}
@end
