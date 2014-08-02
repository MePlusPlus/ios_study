//
//  WLJDocumentModel.m
//  IOSDemos
//
//  Created by Likingwang on 14-7-24.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import "WLJDocumentModel.h"

@implementation WLJDocumentModel 

#pragma mark - Coding
- (id)initWithCoder:(NSCoder *)aDecoder
{
    // 是NSObject的子类或者 非NSCoding子类
    self = [super init];
    if (self) {
        self.lines = [aDecoder decodeObjectForKey:kLinesKey];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.lines forKey:kLinesKey];
}

#pragma mark - Copying
- (id)copyWithZone:(NSZone *)zone
{
    WLJDocumentModel *model = [[[self class] alloc] init];
    NSMutableArray *lineCopy = [NSMutableArray array];
    for (id line in self.lines){
        [lineCopy addObject:line];
    }
    model.lines = lineCopy;
    return model;
}
@end
