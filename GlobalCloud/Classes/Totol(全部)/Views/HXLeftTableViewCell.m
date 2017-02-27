//
//  HXLeftTableViewCell.m
//  GlobalCloud
//
//  Created by hexuan on 16/12/24.
//  Copyright © 2016年 hexuan. All rights reserved.
//

#import "HXLeftTableViewCell.h"

@implementation HXLeftTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    //选中设置字体颜色为红色 不选中颜色为黑色
    self.textLabel.textColor = selected ? [UIColor redColor]:[UIColor blackColor];
    self.backgroundColor = selected?UIColorFromRGBA(0xf3f3f3, 1.0):UIColorFromRGBA(0xffffff, 1.0);
    // Configure the view for the selected state
}

@end
