//
//  main.m
//  MyObjectiveC
//
//  Created by Likingwang on 14-7-3.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WLjTest.h"

int main(int argc, const char * argv[])
{
    
    /*
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc]init];
    NSLog(@"%lu", [pool retainCount]);//测试pool的引用计数

    NSObject *obj = [NSObject alloc];
    [obj retain];
    NSLog(@"%lu", [obj retainCount]);//测试autorelease的效果
    [obj autorelease];
    NSLog(@"%lu", [obj retainCount]);
    [obj autorelease];
    [pool release];
    NSLog(@"%lu", [pool retainCount]); //测试pool的释放后的引用计数
 //   NSLog(@"%lu", [obj retainCount]);//对已经释放的对象访问，出错
     */
    /*
    NSObject *sss;
    NSLog(@"%lu", [sss retainCount]);//测试默认的对象的值 nil
    
    //测试字符串的引用计数 由于是常量，不会计数，一般输出很大或者-1的数
    NSString *str1 = @"xxx";
    NSString *str2 = @"xxx";
    NSLog(@"%lu", [str1 retainCount]);
    NSLog(@"%lu", [str2 retainCount]);
    [str1 release];*/
    
    WLjTest *t1 = [[WLjTest alloc]init];
    [t1 test];
    [t1 test2];
    
    return 0;
}

