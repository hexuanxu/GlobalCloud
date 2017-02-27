//
//  HXMineCollectionReusableView.m
//  GlobalCloud
//
//  Created by hexuan on 16/12/26.
//  Copyright © 2016年 hexuan. All rights reserved.
//

#import "HXMineCollectionReusableView.h"

@interface HXMineCollectionReusableView()

@property(nonatomic,strong)UITapGestureRecognizer *tapGesture;

@end

@implementation HXMineCollectionReusableView

-(UITapGestureRecognizer *)tapGesture{

    if (!_tapGesture) {
        _tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickHeaderImageView:)];
    }return _tapGesture;
}

-(void)awakeFromNib{

    [super awakeFromNib];
    
    [self.noticeBtn addTarget:self action:@selector(clickNoticeBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.settingBtn addTarget:self action:@selector(clickSettingBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.chargeBtn addTarget:self action:@selector(clickChargeBtn:) forControlEvents:UIControlEventTouchUpInside];
    
    UIImageView *imageview = [[UIImageView alloc] initWithFrame:self.firstView.bounds];
    imageview.image = [UIImage imageNamed:@"background"];
    [self.firstView addSubview:imageview];
    [self.firstView insertSubview:imageview atIndex:0];
    
    self.schoolLabel.backgroundColor = [UIColor whiteColor];
    self.schoolLabel.textColor = [UIColor blackColor];
    self.schoolLabel.layer.cornerRadius = self.schoolLabel.height/2;
    self.schoolLabel.clipsToBounds = YES;
    self.schoolLabel.font = SYSTEM_FONT(14);
    
    self.headerImageView.layer.cornerRadius = self.headerImageView.width/2;
    self.headerImageView.clipsToBounds = YES;
    self.headerImageView.userInteractionEnabled = YES;
    [self.headerImageView addGestureRecognizer:self.tapGesture];
    
    
    for (int i = 0; i<2; i++) {
       
        CGFloat originX = (i+1)*(kDeviceWidth-2)/3 + i*1;
        CGFloat originY = (self.secondView.height-40)/2;
        UIView *leftLine = [[UIView alloc] initWithFrame:CGRectMake(originX, originY, 1, self.secondView.height-2*originY)];
        leftLine.backgroundColor = [UIColor lightGrayColor];
        [self.secondView addSubview:leftLine];
        
    }
    
}

- (void)selectMineCollectionReusableView:(returnBlock)block{
    self.block = block;
}


-(void)clickNoticeBtn:(UIButton *)sender{
    self.block(MineCollectionReusableViewTypeNotice);
}

-(void)clickSettingBtn:(UIButton *)sender{
    self.block(MineCollectionReusableViewTypeSetting);
}

-(void)clickChargeBtn:(UIButton *)sender{
     self.block(MineCollectionReusableViewTypeCharge);
}

-(void)clickHeaderImageView:(UITapGestureRecognizer *)sender{

    self.block(MineCollectionReusableViewTypeHeaderImageView);
}

@end
