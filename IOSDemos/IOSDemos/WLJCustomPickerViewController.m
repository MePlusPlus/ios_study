//
//  WLJCustomPickerViewController.m
//  IOSDemos
//
//  Created by Likingwang on 14-7-21.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import "WLJCustomPickerViewController.h"

@interface WLJCustomPickerViewController ()
@property (weak, nonatomic) IBOutlet UIButton *spinButton;
@property (weak, nonatomic) IBOutlet UIPickerView *picker;
@property (weak, nonatomic) IBOutlet UILabel *label;
- (IBAction)buttonPressed:(id)sender;

@end

@implementation WLJCustomPickerViewController

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
    self.images = @[[UIImage imageNamed:@"pin1.jpg"],
                    [UIImage imageNamed:@"pin2.jpg"],
                    [UIImage imageNamed:@"pin3.jpg"]];
    srandom(time(NULL));
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

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 5;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return [self.images count];
}

// 定制视图view
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UIImage *image = self.images[row];
    UIImageView *imageView = (UIImageView *)view;
    if (imageView == nil) {
        imageView = [[UIImageView alloc] initWithImage:image];
    }
    
    return imageView;
}

// 5个中出现连续的3个相同才算赢，所以判断较为容易
- (IBAction)buttonPressed:(id)sender {
    self.label.text = @"正在开奖";
    self.spinButton.hidden = YES;
    BOOL win = NO;
    int numInRow = 1; //连续出现相同的图片的个数
    int lastVal = -1; //上一次的图片
    for (int i= 0; i<5; i++) {
        int newValue = random() % [self.images count];
        if (newValue == lastVal) {
            numInRow ++;
        }else
            numInRow = 1;
        lastVal = newValue;
        [self.picker selectRow:newValue inComponent:i animated:YES];
        [self.picker reloadComponent:i];
        if (numInRow >= 3) {
            win = YES;
        }
    }
    
    if (win) {
        self.label.text = @"你赢了";
        [self performSelector:@selector(playWinSound) withObject:nil afterDelay:0.5];
    }else
    {
        self.label.text = @"你输了";
        [self performSelector:@selector(playLoseSound) withObject:nil afterDelay:0.5];
    }
   // self.spinButton.hidden = NO;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 250;
}

SystemSoundID winSoundID;
- (void)playWinSound
{
    if (winSoundID == 0) {
        NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"win" withExtension:@"wav"];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &winSoundID);
                }
    AudioServicesPlaySystemSound(winSoundID);

    [self performSelector:@selector(showButton) withObject:nil afterDelay:1.5];

}

SystemSoundID loseSoundID;
- (void)playLoseSound
{
    if (loseSoundID == 0) {
        NSString *path = [[NSBundle mainBundle] pathForResource:@"lose" ofType:@"wav"];
        NSURL *soundURL = [NSURL fileURLWithPath:path];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &loseSoundID);
       
        
    }
     AudioServicesPlaySystemSound(loseSoundID);
    [self performSelector:@selector(showButton) withObject:nil afterDelay:1.5];
}


- (void)showButton
{
    self.spinButton.hidden = NO;
}
@end
