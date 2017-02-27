//
//  HXMineCollectionReusableView.h
//  GlobalCloud
//
//  Created by hexuan on 16/12/26.
//  Copyright © 2016年 hexuan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,  MineCollectionReusableViewType) {
    MineCollectionReusableViewTypeNotice,
    MineCollectionReusableViewTypeSetting,
    MineCollectionReusableViewTypeCharge,
    MineCollectionReusableViewTypeHeaderImageView
};


@interface HXMineCollectionReusableView : UICollectionReusableView

@property (weak, nonatomic) IBOutlet UIButton *noticeBtn;
@property (weak, nonatomic) IBOutlet UIButton *settingBtn;
@property (weak, nonatomic) IBOutlet UIButton *chargeBtn;
@property (weak, nonatomic) IBOutlet UIView *firstView;
@property (weak, nonatomic) IBOutlet UIView *secondView;
@property (weak, nonatomic) IBOutlet UILabel *schoolLabel;
@property (weak, nonatomic) IBOutlet UIImageView *headerImageView;


typedef void(^returnBlock)(MineCollectionReusableViewType type);

//回调block
@property(nonatomic,strong)returnBlock block;


- (void)selectMineCollectionReusableView:(returnBlock)block;

@end
