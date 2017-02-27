//
//  HXSettingCell.m
//  GlobalCloud
//
//  Created by hexuan on 16/12/27.
//  Copyright © 2016年 hexuan. All rights reserved.
//

#import "HXSettingCell.h"
#import "SettingCellModel.h"

@interface HXSettingCell()

/**
 *  头像
 */
@property (nonatomic, weak) UIImageView *iconView;

/**
 *  电话
 */
@property (nonatomic, weak) UILabel *phoneView;
/**
 *  正文
 */
@property (nonatomic, weak) UILabel *textView;


@end

@implementation HXSettingCell

/**
   初始化创建cell的字控件
 */
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {

        UIImageView *iconView = [[UIImageView alloc] init];
        [self.contentView addSubview:iconView];
        self.iconView = iconView;
        
        UILabel *phoneView = [[UILabel alloc] init];
        phoneView.font = SYSTEM_FONT(12);
        [self.contentView addSubview:phoneView];
        self.phoneView = phoneView;
        
        UILabel *textView = [[UILabel alloc] init];
        textView.font = SYSTEM_FONT(14);
        [self.contentView addSubview:textView];
        self.textView = textView;
        
        
    }return self;

}



/**
  设置数据与frame
  @param cellSettingModel 数据源模型
 */
-(void)setCellSettingModel:(SettingCellModel *)cellSettingModel{

    _cellSettingModel = cellSettingModel;
    
    
    _iconView.image = [UIImage imageNamed:cellSettingModel.imageStr];
    
    
    _textView.text = cellSettingModel.title;
    
    
    _phoneView.text = cellSettingModel.phoneText;
    
    [self settingFrame];
    
}

/**
  设置数据与frame
 */
-(void)settingFrame{

    // 子控件之间的间距
    CGFloat padding = 10;
    // 1.头像
    CGFloat iconX = padding;
    CGFloat iconW = 25;
    CGFloat iconH = 25;
    CGFloat iconY = (44-iconW)/2;
    _iconView.frame = CGRectMake(iconX, iconY, iconW, iconH);
    
    
    CGFloat textX = CGRectGetMaxX(_iconView.frame) + padding;
    CGFloat textY = 0;
    CGFloat textW = 100;
    CGFloat textH = 44;
    _textView.frame = CGRectMake(textX, textY, textW, textH);
    
    CGFloat phoneX = (kDeviceWidth-80-30);
    CGFloat phoneY = 0;
    CGFloat phoneW = 100;
    CGFloat phoneH = 44;
    _phoneView.frame = CGRectMake(phoneX, phoneY, phoneW, phoneH);

}


/**
   创建cell
 */
+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"SettingID";
    HXSettingCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[HXSettingCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}


@end
