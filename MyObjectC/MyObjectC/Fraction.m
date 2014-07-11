//
//  Fraction.m
//  MyObjectC
//
//  Created by Likingwang on 14-6-23.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import "Fraction.h"

@implementation Fraction

-(void) print
{
    NSLog(@"%i/%i", numberator, denominator);
}

-(void) setNumberator:(int)n
{
    numberator = n;
}

-(void) setDenominator:(int)d
{
    denominator = d;
}

-(int) denominator
{
    return denominator;
}

-(int) numberator
{
    return numberator;
}

@end
