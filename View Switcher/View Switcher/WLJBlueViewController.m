//
//  WLJBlueViewController.m
//  View Switcher
//
//  Created by Likingwang on 14-7-1.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import "WLJBlueViewController.h"

@interface WLJBlueViewController ()

@end

@implementation WLJBlueViewController

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

- (IBAction)blueButtonPressed:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Blue View Button Pressed"
                                                    message:@"You pressed the button on the blue view" delegate:nil
                                          cancelButtonTitle:@"Yep, I did" otherButtonTitles:nil];
    [alert show];
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

@end
