//
//  WLJWindow.m
//  IOSDemos
//
//  Created by Likingwang on 14-8-22.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import "WLJWindow.h"

static UIWindow *hudWindow = nil;


// 为UIWindow增加方便的 dimiss窗口的方法
@interface UIWindow(Hud)
- (void)dismiss;
- (void)dismissAfterDelay:(NSTimeInterval)delay;
@end

@implementation UIWindow(Hud)

- (void)dismiss
{
    self.windowLevel = -1.0f;
    self.hidden = YES;

}

- (void)dismissAfterDelay:(NSTimeInterval)delay
{
    [self performSelector:@selector(dismiss) withObject:nil afterDelay:delay+0.3];
}
@end

// 定义一种信息展示view
@interface MessageView : UIView

@property (nonatomic, assign) BOOL removeFromSuperViewOnHide;

+ (instancetype)showOn:(UIView *)view animated:(BOOL)animated;

@end

@implementation MessageView

+ (instancetype)showOn:(UIView *)view animated:(BOOL)animated
{
    MessageView *btn = [[self alloc] initWithFrame:view.bounds];
    btn.backgroundColor = [UIColor redColor];
    [view addSubview:btn];
    if (animated) {
        [UIView beginAnimations:nil context:NULL];
        [UIView setAnimationDuration:0.30];
        btn.alpha = 1.0f;
        //btn.transform = CGAffineTransformMakeScale(0.5, 0.5);
        [UIView commitAnimations];
    }
    
    return btn;
}

@end

@implementation WLJWindow

+ (UIWindow *)windowForShow
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        hudWindow = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
        });
    hudWindow.windowLevel = UIWindowLevelStatusBar + 10.0f;
    hudWindow.hidden = NO;
    return hudWindow;
}

+ (void)show:(NSString *)message duration:(NSTimeInterval)duration
{
    dispatch_block_t block = ^{
        
        MessageView *view = [MessageView showOn:[self windowForShow] animated:YES];
        UIImageView *image = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"msg.jpg"]];
        image.frame = CGRectMake(view.bounds.size.width/2 - image.bounds.size.width/2, view.bounds.size.height/2 - image.bounds.size.height/2, image.bounds.size.width, image.bounds.size.height);
        [view addSubview:image];
        [hudWindow dismissAfterDelay:duration];
        
    };
    
    if (![NSThread isMainThread]) {
        dispatch_async(dispatch_get_main_queue(), block);
    }else
        block();
}
@end


