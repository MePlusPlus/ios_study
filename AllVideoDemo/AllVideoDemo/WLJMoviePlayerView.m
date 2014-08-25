//
//  WLJMoviePlayerView.m
//  AllVideoDemo
//
//  Created by Likingwang on 14-8-10.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import "WLJMoviePlayerView.h"

@implementation WLJMoviePlayerView
//改变UIView默认的Layer类型
+ (Class)layerClass
{
    return [AVPlayerLayer class];
}

- (AVPlayer *)player
{
    return [(AVPlayerLayer *)[self layer] player];
}

- (void)setPlayer:(AVPlayer *)player
{
    [(AVPlayerLayer *)[self layer] setPlayer:player];
}

@end
