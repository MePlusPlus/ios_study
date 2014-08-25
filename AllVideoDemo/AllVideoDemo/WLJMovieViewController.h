//
//  WLJMovieViewController.h
//  AllVideoDemo
//
//  Created by Likingwang on 14-8-7.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>

@interface WLJMovieViewController : UIViewController
{
 @private
    MPMoviePlayerController *moviePlayerController;
}

// 默认是nil，添加视频图层
@property (nonatomic, strong) UIView *overlayView;
@property (nonatomic, copy) NSString *movieURL;

// 播放本地文件
- (void)playMovieFile:(NSURL *)movieFileURL;
// 播放网络视频
- (void)playMovieStream:(NSURL *)movieFileURL;


@end
