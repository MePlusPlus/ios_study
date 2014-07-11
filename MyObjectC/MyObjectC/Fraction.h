//
//  Fraction.h
//  MyObjectC
//
//  Created by Likingwang on 14-6-23.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fraction : NSObject
{
    int numberator;
    int denominator;
}


-(void) print;
-(void) setNumberator : (int) n;
-(void) setDenominator : (int) d;
-(int) numberator;
-(int) denominator;

@end
