//
//  WLJNameAndColorTableViewCell.m
//  SimpleTable2
//
//  Created by Likingwang on 14-7-1.
//  Copyright (c) 2014年 Likingwang. All rights reserved.
//

#import "WLJNameAndColorTableViewCell.h"

@implementation WLJNameAndColorTableViewCell
{
    UILabel *_nameLabel;
    UILabel *_colorLabel;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        CGRect nameLabelRect = CGRectMake(0, 5, 70, 15);
        UILabel *nameLabel = [[UILabel alloc] initWithFrame:nameLabelRect];
        nameLabel.textAlignment = NSTextAlignmentRight;
        nameLabel.text = @"Name";
        nameLabel.font = [UIFont boldSystemFontOfSize:12];
        [self.contentView addSubview:nameLabel];
        
        CGRect colorLabelRect = CGRectMake(0, 26, 70, 15);
        UILabel *colorLabel = [[UILabel alloc] initWithFrame:colorLabelRect];
        colorLabel.textAlignment = NSTextAlignmentRight;
        colorLabel.text = @"Color:";
        colorLabel.font = [UIFont boldSystemFontOfSize:12];
        [self.contentView addSubview:colorLabel];
        
        CGRect nameValueRect = CGRectMake(80, 5, 200, 15);
        _nameLabel = [[UILabel alloc] initWithFrame:nameValueRect];
        [self.contentView addSubview:_nameLabel];
        
        CGRect colorValueRect = CGRectMake(80, 26, 200, 15);
        _colorLabel = [[UILabel alloc] initWithFrame:colorValueRect];
        [self.contentView addSubview:_colorLabel];
        
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

- (void)setName:(NSString *)name
{
    if (![name isEqualToString:_name]) {
        _name = [name copy];
        _nameLabel.text = _name;
    }
}

- (void)setColor:(NSString *)color
{
    if (![color isEqualToString:_color]) {
        _color = [color copy];
        _colorLabel.text = _color;
    }
}

@end
