//
//  HXMessageCell.m
//  GlobalCloud
//
//  Created by hexuan on 16/12/24.
//  Copyright © 2016年 hexuan. All rights reserved.
//

#import "HXMessageCell.h"

@interface HXMessageCell()

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitileLabel;
@property (weak, nonatomic) IBOutlet UIImageView *iconView;

@end

@implementation HXMessageCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setMessage:(MessageModel *)message{

    _message = message;
    
    _titleLabel.text = message.title;
    
    _subTitileLabel.text = message.subTitle;
    
    _iconView.image = [UIImage imageNamed:message.imageStr];

}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
