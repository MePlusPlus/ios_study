//
//  WLJMediaPlayer.h
//  AllVideoDemo
//
//  Created by Likingwang on 14-8-7.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MediaPlayer/MediaPlayer.h>

@interface WLJMediaPlayer : NSObject

// 只读，该类实例负责生成
@property (nonatomic, readonly) MPMoviePlayerController *moviePlayerController;

- (void) playMoiveFile:(NSURL *)movieFileURL;
- (void) playMoiveStream:(NSURL *)movieFileURL;
- (void) addOverLayView:(UIView *)overLayView;
- (void) remove
@end
