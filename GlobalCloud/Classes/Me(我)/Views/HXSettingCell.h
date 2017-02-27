//
//  HXSettingCell.h
//  GlobalCloud
//
//  Created by hexuan on 16/12/27.
//  Copyright © 2016年 hexuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SettingCellModel;

@interface HXSettingCell : UITableViewCell


@property(nonatomic,strong)SettingCellModel *cellSettingModel;

+ (instancetype)cellWithTableView:(UITableView *)tableView;


@end
