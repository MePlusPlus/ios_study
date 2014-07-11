//
//  WLJPlayerCellTableViewCell.m
//  StoryBoard
//
//  Created by Likingwang on 14-6-26.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import "WLJPlayerCellTableViewCell.h"

@implementation WLJPlayerCellTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
