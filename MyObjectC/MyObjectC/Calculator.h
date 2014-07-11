//
//  简单加减乘除
//  Calculator.h
//  MyObjectC
//
//  Created by Likingwang on 14-6-23.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Calculator : NSObject

//累加方法
-(void) setAccumulator: (double) value;
-(void) clear;
-(double) accumulator;

//算术方法
-(void) add:(double) value;
-(void) subtract:(double) value;
-(void) multiply: (double) value;
-(void) divide:(double) value;
@end
