//
//  WLJAVMovieViewController.m
//  AllVideoDemo
//
//  Created by Likingwang on 14-8-10.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import "WLJAVMovieViewController.h"
#import <AVFoundation/AVFoundation.h>
#import "WLJMoviePlayerView.h"

@interface WLJAVMovieViewController ()
{
    AVPlayer *player;
}
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;
@property (weak, nonatomic) IBOutlet WLJMoviePlayerView *movieContainer;
@property (weak, nonatomic) IBOutlet UITextView *msgTextView;

- (IBAction)playButton:(id)sender;

@end

@implementation WLJAVMovieViewController

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

// 用来返回数据
static const NSString *ItemStatusContext;
- (IBAction)playButton:(id)sender {
    
     //有时出现错误，不是URL问题，重启，或者设置系统-》声音-》重新勾选用户界面声音
     NSURL *url2 = [NSURL URLWithString:self.urlTextField.text];
    //播放本地的格式
     NSURL *url = [[NSBundle mainBundle] URLForResource:@"Movie" withExtension:@"m4v"];
    
    AVURLAsset *asset = [AVURLAsset URLAssetWithURL:url2 options:nil];
    

    
    [asset loadValuesAsynchronouslyForKeys:@[@"tracks"] completionHandler:^{
        
        dispatch_async(dispatch_get_main_queue(), ^{
        NSError *error;
        // 传回错误对象
        AVKeyValueStatus status = [asset statusOfValueForKey:@"tracks" error:&error];
        if (status == AVKeyValueStatusLoaded) {
            
            AVPlayerItem *playerItem = [AVPlayerItem playerItemWithAsset:asset];
            //必须在播放内容项与player绑定之前设置观察着
            //监测播放内容的改变
            [playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionInitial context:&ItemStatusContext];
           
            //当这个视频播放结束时，通知处理
            //[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(palyerItemDidReachEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:playerItem];
             player = [AVPlayer playerWithPlayerItem:playerItem];
             [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playerItemDidReachEnd:) name:AVPlayerItemDidPlayToEndTimeNotification object:player.currentItem];
            [self.movieContainer setPlayer:player];
            [player play];
        }else
        {
            NSLog(@"视频加载失败:%@", [error localizedDescription]);
        }
        });
        
    }];
  }

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (context == &ItemStatusContext ) {
        dispatch_async(dispatch_get_main_queue(), ^{
           // UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"状态" message:@"状态" delegate:nil cancelButtonTitle:@"我知道了" otherButtonTitles:nil];
           // [alert show];
        });
    }else
    {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
        
    }
}

- (void)playerItemDidReachEnd:(NSNotification *)notification
{
    [player seekToTime:kCMTimeZero];
}
@end
