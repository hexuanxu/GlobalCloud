//
//  HXInfoCellOne.m
//  QIGuanZiDemo
//
//  Created by hexuan on 16/10/1.
//  Copyright © 2016年 hexuan. All rights reserved.
//

#import "HXInfoCellOne.h"
#import "UIImageView+WebCache.h"


@implementation HXInfoCellOne

- (void)awakeFromNib {
    [super awakeFromNib];
    
    [self.headerImageView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:[UIImage imageNamed:@"personIcon"]];
    self.headerImageView.layer.cornerRadius = self.headerImageView.frame.size.width/2;
    self.headerImageView.clipsToBounds = YES;
    
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
