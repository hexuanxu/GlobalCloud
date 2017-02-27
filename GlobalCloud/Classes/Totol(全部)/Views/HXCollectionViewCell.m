//
//  HXCollectionViewCell.m
//  GlobalCloud
//
//  Created by hexuan on 16/12/23.
//  Copyright © 2016年 hexuan. All rights reserved.
//

#import "HXCollectionViewCell.h"
#import "UIImageView+WebCache.h"

@implementation HXCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    self.nameLabel.textColor = [UIColor blackColor];
    self.nameLabel.font = [UIFont systemFontOfSize:12];
}

-(void)setModel:(rightCollectionModel *)model{

    _model = model;
    
    self.nameLabel.text = model.name;

    [self.iconView sd_setImageWithURL:[NSURL URLWithString:model.icon_url]];
    
}



@end
