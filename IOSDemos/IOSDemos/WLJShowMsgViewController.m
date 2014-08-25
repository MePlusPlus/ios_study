//
//  WLJShowMsgViewController.m
//  IOSDemos
//
//  Created by Likingwang on 14-8-22.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import "WLJShowMsgViewController.h"
#import "WLJWindow.h"

@interface WLJShowMsgViewController ()
- (IBAction)show:(id)sender;

@end

@implementation WLJShowMsgViewController

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

- (IBAction)show:(id)sender {
    [WLJWindow show:@"上传" duration:3];
}
@end
