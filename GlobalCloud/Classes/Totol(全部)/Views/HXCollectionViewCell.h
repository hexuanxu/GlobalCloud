//
//  HXCollectionViewCell.h
//  GlobalCloud
//
//  Created by hexuan on 16/12/23.
//  Copyright © 2016年 hexuan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "rightCollectionModel.h"

@interface HXCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *iconView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property(nonatomic,strong) rightCollectionModel *model;
@end
