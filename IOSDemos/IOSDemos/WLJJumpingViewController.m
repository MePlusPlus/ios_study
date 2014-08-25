//
//  WLJJumpingViewController.m
//  IOSDemos
//
//  Created by Likingwang on 14-8-15.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import "WLJJumpingViewController.h"

@interface WLJJumpingViewController ()


@end

@implementation WLJJumpingViewController

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

// 增加控制跳跃的按钮
- (void)addButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(240, 150, 50, 50);
    [button setBackgroundImage:[UIImage imageNamed:@"button.png"] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(buttonPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)buttonPressed
{
    NSLog(@"按钮按下");
    [self jump:self.player];
}

// 该方法默认会用来加载view的，如果nib中定义了，不要重写该方法，否则nib中的内容不会执行了
// 重写了以后，关联的nib就没有用了
- (void)loadView
{
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    self.view = [[UIView alloc] initWithFrame:[[UIScreen mainScreen] applicationFrame]];
    self.view.backgroundColor = [UIColor blackColor];
    
    UIImageView *bg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 572, 206)];
    [bg setImage:[UIImage imageNamed:@"bg.jpg"]];
    [self.view addSubview:bg];
    
    [self addButton];
    [self initPlayer];
}

- (void) initPlayer
{
    self.player = [[UIImageView alloc] initWithFrame:CGRectMake(10, 100, 77, 94)];
    [self setPlayerNormalStance];
    self.player.opaque = YES;
    [self.view addSubview:self.player];
    
}

- (void)setPlayerNormalStance
{
    [self.player setImage:[UIImage imageNamed:@"ryu.png"]];
}

- (void)setPlayerCleanStance
{
    [self.player setImage:nil];
    self.player.animationImages = nil;
}

- (void)setPlayerJumpStance
{
    [self setPlayerCleanStance];
    NSArray *imageArray = [[NSArray alloc] initWithObjects:[UIImage imageNamed:@"jump1.png"], [UIImage imageNamed:@"jump2.png"], nil];
    self.player.animationImages = imageArray;
    self.player.contentMode = UIViewContentModeBottomLeft;
    self.player.animationDuration = 0.3;
    [self.view addSubview:self.player];
    [self.player startAnimating];
    
}

- (void)jump:(UIImageView *)image
{
    [self setPlayerJumpStance];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationBeginsFromCurrentState:YES];
    image.transform = CGAffineTransformMakeTranslation(0, -40);  //垂直移动40
    
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(fall:finished:context:)];
    [UIView commitAnimations];
    
    
}

- (void)fall:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
    [self setPlayerCleanStance];
    [self setPlayerNormalStance];
    
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationBeginsFromCurrentState:YES];
    [UIView setAnimationDuration:0.2];
    self.player.transform = CGAffineTransformMakeTranslation(0, 0);
    [UIView commitAnimations];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation
{
    return (toInterfaceOrientation == UIInterfaceOrientationLandscapeLeft || toInterfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskLandscape;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationLandscapeRight;
}
@end
