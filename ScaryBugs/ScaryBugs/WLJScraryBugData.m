//
//  WLJScraryBugData.m
//  ScaryBugs
//
//  Created by Likingwang on 14-6-30.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import "WLJScraryBugData.h"

@implementation WLJScraryBugData

@synthesize title = _title;
@synthesize rating = _rating;

- (id)initWithTitle:(NSString *)title rating:(float)rating
{
    if ((self = [super init])) {
        self.title = title;
        self.rating = rating;
    }
    return self;
}
@end
