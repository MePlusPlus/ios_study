//
//  WLJChatViewController.m
//  ChatApp
//
//  Created by Likingwang on 14-8-4.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import "WLJChatViewController.h"
#import "WLJChatView.h"


@implementation WLJChatViewController

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
    //init方法都必须先alloc
    WLJChatView *chatView = [[WLJChatView alloc ]initWithFrame:self.view.bounds];
    [chatView setGroupInfo:@"a"];
    /*
    NSString *str = @"wlj";
    [str drawInRect:CGRectMake(10, 200, 100, 100) withFont:[UIFont systemFontOfSize:16] lineBreakMode:NSLineBreakByTruncatingTail alignment:NSTextAlignmentLeft];
     */
    [self.view addSubview:chatView];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
}



@end
