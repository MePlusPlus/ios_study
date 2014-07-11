//
//  WLJScaryBugDoc.m
//  ScaryBugs
//
//  Created by Likingwang on 14-6-30.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import "WLJScaryBugDoc.h"
#import "WLJScraryBugData.h"

@implementation WLJScaryBugDoc

@synthesize data = _data;
@synthesize thumImage = _thumImage;
@synthesize fullImage = _fullImage;

- (id)initWithTitle:(NSString *)title rating:(float)rating thumbImage:(UIImage *)thumbImage fullImage:(UIImage *)fullImage
{
    if ((self = [super init])) {
        self.data = [[WLJScraryBugData alloc]initWithTitle:title rating:rating];
        self.thumImage = thumbImage;
        self.fullImage = fullImage;
    }
    return self;
}

@end
