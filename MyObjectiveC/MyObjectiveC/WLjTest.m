//
//  WLjTest.m
//  MyObjectiveC
//
//  Created by Likingwang on 14-7-4.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import "WLjTest.h"

@implementation WLjTest
NSObject *obj;

//测试局部变量是否是强引用
- (void)test
{
    obj = [[NSObject alloc]init];
    NSObject *b = obj;
    NSLog(@"%lu", [obj retainCount]);
    [obj release];
    obj = nil;
    NSLog(@"%lu", [b retainCount]);
}

- (void)test2
{
    NSObject *o = [[NSObject alloc]init];
    obj = o;
    NSLog(@"%lu", [o retainCount]);
    [o release];
    o = nil;
   //     [obj release];
    NSLog(@"%lu", [obj retainCount]);


}
@end
