//
//  HXMeViewController.m
//  GlobalCloud
//
//  Created by hexuan on 16/12/22.
//  Copyright © 2016年 hexuan. All rights reserved.
//

#import "HXMeViewController.h"
#import "HXHomeCollectionViewCell.h"
#import "HXMineCollectionReusableView.h"
#import "KKPicture.h"
#import "HXSettingViewController.h"
#import "HXPersonCenterViewController.h"
#import "HXMainTabBarController.h"
#import "LBTabBar.h"

@interface HXMeViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *mineCollectionView;

@end

static NSString * const reuseIdentifier_ReusableFirstID= @"ReusableFirstID";

static NSString * const reuseIdentifier_ReusableSecondID= @"ReusableSecondID";

@implementation HXMeViewController


//创建右边视图
-(UICollectionView *)mineCollectionView{
    
    if (!_mineCollectionView) {
     
        //创建tableview的列表
        UICollectionViewFlowLayout *flowayout = [[UICollectionViewFlowLayout alloc]init];
        flowayout.sectionInset = UIEdgeInsetsMake(0.5, 0.5, 0.5, 1);
        flowayout.minimumInteritemSpacing = 0;
        flowayout.minimumLineSpacing = 0.5;
        flowayout.itemSize = CGSizeMake((kDeviceWidth-3)/3, 100);//设置每个item的大小
        
        _mineCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height-64) collectionViewLayout:flowayout];
        
        [_mineCollectionView setBackgroundColor:UIColorFromRGBA(0xf3f3f3, 1.0)];
        //注册cell
        [_mineCollectionView registerNib:[UINib nibWithNibName:@"HXHomeCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"HXHomeCollectionViewCellID"];
        //注册分区头视图
        [_mineCollectionView registerNib:[UINib nibWithNibName:@"HXMineCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:reuseIdentifier_ReusableFirstID];
        [_mineCollectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:reuseIdentifier_ReusableSecondID];
        

        _mineCollectionView.delegate = self;
        _mineCollectionView.dataSource = self;
        
    }return _mineCollectionView;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    [self.view addSubview:self.mineCollectionView];
    
    
}
-(void)viewWillAppear:(BOOL)animated{

    [super viewWillAppear:animated];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    HXMainTabBarController *tabbarVC = (HXMainTabBarController *)appDelegate.window.rootViewController;
    LBTabBar *tabbar = (LBTabBar *)tabbarVC.tabBar;
    [tabbar.redView.layer removeAllAnimations];
    [tabbar startAnimation:tabbar.redView];

}


#pragma mark - delegates
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 2;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if (section == 0) {
        return 9;
    }else{
        return 3;
    }
    
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    HXHomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HXHomeCollectionViewCellID" forIndexPath:indexPath];
    cell.titleLabel.text = @"he";
    cell.iconView.image = [UIImage imageNamed:@"视频专区"];
    return cell;
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section ==0) {
        HXMineCollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:reuseIdentifier_ReusableFirstID forIndexPath:indexPath];
        [header selectMineCollectionReusableView:^(MineCollectionReusableViewType type) {
            
            if (type==MineCollectionReusableViewTypeNotice) {
                 HXLog(@"clickNoticeBtn");
            }else if (type==MineCollectionReusableViewTypeCharge){
                 HXLog(@"clickChargeBtn");
            }else if(type == MineCollectionReusableViewTypeSetting){
                 HXLog(@"clickSettingBtn");
                
                HXSettingViewController *settingVC = [[HXSettingViewController alloc] init];
                [self.navigationController pushViewController:settingVC animated:YES];
                
            }else{
                HXLog(@"MineCollectionReusableViewTypeHeaderImageView");
                
                HXPersonCenterViewController *personInfo = [[HXPersonCenterViewController alloc] init];
                [self.navigationController pushViewController:personInfo animated:YES];
            }
        }];
        
        return header;
        
    }else{
        
        UICollectionReusableView *collectionReusableView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:reuseIdentifier_ReusableSecondID forIndexPath:indexPath];
        UILabel *headerLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 60)];
        headerLabel.text = @" 第三方服务";
        [collectionReusableView addSubview:headerLabel];
        return collectionReusableView;

    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
          return CGSizeMake(kDeviceWidth, 210);
    }else{
          return CGSizeMake(kDeviceWidth, 60);
    }
}


@end
