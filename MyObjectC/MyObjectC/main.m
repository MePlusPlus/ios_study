//
//  main.m
//  MyObjectC
//
//  Created by Likingwang on 14-6-23.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Fraction.h"
#import "Calculator.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
    
        Calculator *calc = [[Calculator alloc] init];
        [calc setAccumulator:100.0];
        [calc add:200.];
        [calc divide:15];
        [calc subtract:10];
        [calc multiply:5];
        NSLog(@"The result is %g", [calc accumulator]);
        
        /*
        Fraction *myFraction = [[Fraction alloc] init];
        //设置分子和分母
        [myFraction setNumberator: 1];
        [myFraction setDenominator: 3];
        
        
        // insert code here...
        NSLog(@"The value of myFraction is: %i/%i",
              [myFraction numberator], [myFraction denominator]);
         */
        
    }
    return 0;
}

