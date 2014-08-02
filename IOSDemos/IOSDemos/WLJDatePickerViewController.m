//
//  WLJDatePickerViewController.m
//  IOSDemos
//
//  Created by Likingwang on 14-7-21.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import "WLJDatePickerViewController.h"

@interface WLJDatePickerViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
- (IBAction)dateButtonPressed:(id)sender;

@end

@implementation WLJDatePickerViewController

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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)dateButtonPressed:(id)sender {
    NSDate *selecteDate = [self.datePicker date];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = @"yyyy-MM-dd";
    NSString *message  = [NSString stringWithFormat:@"您选中的日期是%@", [dateFormatter stringFromDate:selecteDate]];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:message delegate:nil
                                        cancelButtonTitle:@"知道了" otherButtonTitles:nil];
    [alert show];
}
@end
