//
//  WLJSmileViewController.m
//  IOSDemos
//
//  Created by Likingwang on 14-7-29.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import "WLJSmileViewController.h"

@interface WLJSmileViewController ()

@end

@implementation WLJSmileViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(applicationDidEnterBackground) name:UIApplicationDidEnterBackgroundNotification object:nil];
    [center addObserver:self selector:@selector(applicationWillEnterForeground) name:UIApplicationWillEnterForegroundNotification object:nil];
    CGRect bounds = self.view.bounds;
    CGRect labelFrame = CGRectMake(bounds.origin.x, CGRectGetMidY(bounds) - 50, bounds.size.width, 100);
    
    // 必须strong，否则立马被释放
    self.label = [[UILabel alloc] initWithFrame:labelFrame];
    self.label.font = [UIFont fontWithName:@"Helvetica" size:70];
    self.label.text = @"Smile!";
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.backgroundColor = [UIColor clearColor];
    
    CGRect smileyFrame = CGRectMake(CGRectGetMidX(bounds) - 42, CGRectGetMidY(bounds)/2 - 42, 84, 84);
    self.smileyView = [[UIImageView alloc] initWithFrame:smileyFrame];
    self.smileyView.contentMode = UIViewContentModeCenter;
    self.smiley = [UIImage imageNamed:@"smile.jpg"];
    self.smileyView.image = self.smiley;
    
    [self.view addSubview:self.smileyView];
    [self.view addSubview:self.label];
    [self rotateLabelDown];
    
    
    
}

- (void)viewWillDisappear:(BOOL)animated
{
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center removeObserver:self];
}

- (void)applicationDidEnterBackground
{
    self.smiley = nil;
    self.smileyView.image = nil;
 
}

- (void)applicationWillEnterForeground
{
    // 没有这句图片会消失
    self.smiley = [UIImage imageNamed:@"smile.jpg"];
    self.smileyView.image = self.smiley;
}

- (void)rotateLabelDown
{
    [UIView animateWithDuration:0.5 animations:^{
        self.label.transform = CGAffineTransformMakeRotation(M_PI);
    } completion:^(BOOL finished){
        [self rotateLabelUp];
    }];
}

- (void)rotateLabelUp
{
    [UIView animateWithDuration:0.5 animations:^{
        self.label.transform = CGAffineTransformMakeRotation(0);
    } completion:^(BOOL finished){
        [self rotateLabelDown];
    }];
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

@end
