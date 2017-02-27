//
//  HXHomeViewController.m
//  GlobalCloud
//
//  Created by hexuan on 16/12/22.
//  Copyright © 2016年 hexuan. All rights reserved.
//

#import "HXHomeViewController.h"
#import "PageView.h"
#import "HXHomeCollectionViewCell.h"
#import "AdvertiseView.h"
#import "HXTotolViewController.h"
#import "HXHomeCollectionViewLayout.h"
#import "HXHomeCollectionViewCellTwo.h"

@interface HXHomeViewController ()<UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,PageViewDelegate>

@property (nonatomic,strong) UITableView *globalTableView;
@property (nonatomic,strong) PageView *tableViewHeaderView;
@property (nonatomic,strong) NSArray *titlesArray;
@property (nonatomic,strong) NSArray *imagesArray;
@property (nonatomic,strong) AdvertiseView *adView;
@property (nonatomic, copy) NSArray *adTitles;
@property(nonatomic,strong)UICollectionView *firstCollectionView;
@property(nonatomic,strong)UICollectionView *secondCollectionView;
@property(nonatomic,assign)CGRect frame;
@property(nonatomic,assign)CGRect frameTwo;

@property(nonatomic,strong)NSMutableDictionary *secondDataSource;

@end
static NSString * const reuseIdentifier_Global = @"globalCellID";
static NSString * const reuseIdentifier_HomeCollectionID = @"HXHomeCollectionViewCellID";
@implementation HXHomeViewController


/**
 存储所有模型的集合
 */
-(NSMutableDictionary *)secondDataSource{
    if (!_secondDataSource) {
        _secondDataSource = [[NSMutableDictionary alloc] init];
    }return _secondDataSource;
}

-(UITableView *)globalTableView{

    if (!_globalTableView) {
        
        CGRect frame = CGRectMake(0, 0, kDeviceWidth, kDeviceHeight-64);
        UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStyleGrouped];
        self.globalTableView = tableView;
        self.globalTableView.delegate = self;
        self.globalTableView.dataSource = self;
        tableView.tableHeaderView = self.tableViewHeaderView;
        [self.globalTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:reuseIdentifier_Global];
        self.globalTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        //注册单元格
        [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"FirstSectionCell"];
        
        [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"threeSectionCell"];
        
        
    }return _globalTableView;
}

#pragma mark 懒加载方法
- (PageView *)tableViewHeaderView {
    
    if (!_tableViewHeaderView) {
        _tableViewHeaderView = [[PageView alloc] initWithFrame:CGRectMake(0,0,kDeviceWidth,kDeviceHeight*0.25)];
        _tableViewHeaderView.delegate = self;
        _tableViewHeaderView.isWebImage = NO;
        _tableViewHeaderView.imageArray = @[@"header01.png",@"header02.png",@"header03.png",@"header04.png",@"header05.png",@"header06.png",@"header07.png",@"header08.png"];
    }
    
    return _tableViewHeaderView;
}


-(NSArray *)adTitles{
    
    if (!_adTitles) {
        _adTitles = @[@"恭喜 再不中就卸载 10分钟前获得iPhone 6s（64G）",@"恭喜 中辆宝马送媳妇 7分钟前获得BMW X5一台",@"恭喜 王大锤 5分钟前获得BenZ ML520一台",@"恭喜 掉坑里了 3分钟前获得十二篮T恤一件！"];
    }return _adTitles;
    
}

-(AdvertiseView *)adView{
    
    if (!_adView) {
        _adView = [[AdvertiseView alloc] initWithTitles: self.adTitles];
    }return _adView;
    
}


-(UICollectionView *)firstCollectionView{
    
    if (!_firstCollectionView) {
        
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.sectionInset = UIEdgeInsetsMake(0.5, 0.5, 0.5, 1);
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0.5;
        layout.itemSize = CGSizeMake((kDeviceWidth-3)*0.25, (self.frame.size.height-1.5)*0.5);
        
        _firstCollectionView = [[UICollectionView alloc] initWithFrame:self.frame collectionViewLayout:layout];
        
        _firstCollectionView.delegate = self;
        _firstCollectionView.dataSource = self;
        
        _firstCollectionView.scrollEnabled = NO;
        _firstCollectionView.backgroundColor = [UIColor lightGrayColor];
        
        //注册collectionCell
        [_firstCollectionView registerNib:[UINib nibWithNibName:@"HXHomeCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:reuseIdentifier_HomeCollectionID];
        
    }return _firstCollectionView;
}


-(UICollectionView *)secondCollectionView{
    
    if (!_secondCollectionView) {
        
        HXHomeCollectionViewLayout *homeLayout = [[HXHomeCollectionViewLayout alloc] init];
        
        _secondCollectionView = [[UICollectionView alloc] initWithFrame:self.frameTwo collectionViewLayout:homeLayout];
        
        _secondCollectionView.delegate = self;
        _secondCollectionView.dataSource = self;
        
        _secondCollectionView.scrollEnabled = NO;
        _secondCollectionView.backgroundColor = [UIColor lightGrayColor];
        
        //注册collectionCell
        
          [_secondCollectionView registerNib:[UINib nibWithNibName:@"HXHomeCollectionViewCellTwo" bundle:nil] forCellWithReuseIdentifier:@"cellID"];
        

    }return _secondCollectionView;
}


#pragma mark --- <视图生命周期>
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    NSArray *firstArrays = @[@"First01",@"First02",@"First03",@"First04",@"First05"];
    NSArray *secondArrays = @[@"Section01",@"Section02",@"Section03"];
    NSArray *threeArrays = @[@"Three01",@"Three02",@"Three03",@"Three04"];
    
    [self.secondDataSource setObject:firstArrays forKey:@"0"];
    [self.secondDataSource setObject:secondArrays forKey:@"1"];
    [self.secondDataSource setObject:threeArrays forKey:@"2"];
    
    _titlesArray = @[@"夺宝", @"设计", @"圈子", @"赚钱", @"文案策划", @"营销推广", @"移动开发", @"全部"];
    _imagesArray = @[@"视频调用",@"停车缴费",@"物业报修",@"物业投诉",@"物业装修",@"停车缴费",@"物业报修",@"物业投诉"];
    
    [self.view addSubview:self.globalTableView];
    
    
//    UIButton *btn = [[UIButton alloc] init];
//    btn.frame = CGRectMake(10, self.view.height-200, 100, 60);
//    btn.backgroundColor = [UIColor redColor];
//    [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn];
}

-(void)clickBtn:(UIButton *)btn{
    [self.globalTableView reloadData];
}


#pragma mark ---- <UITableViewDataSource>
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
   
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FirstSectionCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        self.frame = cell.contentView.frame;
        [cell.contentView addSubview:self.firstCollectionView];
        return cell;

    }else if(indexPath.section == 1){
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier_Global forIndexPath:indexPath];
        
        self.adView.frame = cell.contentView.frame;
        UIImage *image =  [UIImage imageNamed:@"common_notify_19x18_"];
        self.adView.headImg = image;
        self.adView.backgroundColor = UIColorFromRGBA(0xf3f3f3, 1.0);
        self.adView.edgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        [self.adView beginScroll];
        [cell.contentView addSubview:_adView];

        
         return cell;
    
    }else{
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"threeSectionCell" forIndexPath:indexPath];
        self.frameTwo = cell.contentView.frame;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell.contentView addSubview:self.secondCollectionView];

       return cell;
        
    }

}

#pragma mark ---- <UITableViewDelegate>
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 180;
    }else if(indexPath.section == 1){
        return 44;
    }else{
        return 564;
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
     return 0.001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.001;
}


#pragma mark ---  <UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    if (collectionView == self.firstCollectionView) {
         return 1;
    }else{
    
        return 3;
    }
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    if (collectionView == self.firstCollectionView) {
        
        return self.titlesArray.count;
        
    }else{
        if (section == 0) {
            return 5;
        }else if(section == 1){
            return 3;
        }else{
            return 4;
        }
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (collectionView == self.firstCollectionView) {
       
        HXHomeCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier_HomeCollectionID forIndexPath:indexPath];
        cell.titleLabel.text = _titlesArray[indexPath.item];
        cell.iconView.image = [UIImage imageNamed:_imagesArray[indexPath.item]];
        
        return cell;
    }else{
    
        
        NSString *keyStr = [NSString stringWithFormat:@"%lu",indexPath.section];
        NSArray *dataSource = self.secondDataSource[keyStr];
        HXHomeCollectionViewCellTwo *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
        cell.contentImageView.image = [UIImage imageNamed:dataSource[indexPath.item]];
        return cell;
    }
    
   
}



-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{


    if (collectionView == self.firstCollectionView) {
        
        HXLog(@"firstCollectionView -- %lu",indexPath.item);
        UINavigationController *nav= self.tabBarController.viewControllers[1];
        HXTotolViewController *totolVC = nav.viewControllers[0];
        
        switch (indexPath.item) {
            case 0:
                totolVC.selectIndex = 0;
                [self.tabBarController setSelectedIndex:1];
                break;
            case 1:
                totolVC.selectIndex = 3;
                [self.tabBarController setSelectedIndex:1];
                break;
            case 2:
                totolVC.selectIndex = 1;
                [self.tabBarController setSelectedIndex:1];
                break;
            case 3:
                
                break;
            case 4:
                totolVC.selectIndex = 6;
                [self.tabBarController setSelectedIndex:1];
                break;
            case 5:
                totolVC.selectIndex = 5;
                [self.tabBarController setSelectedIndex:1];
                break;
            case 6:
                totolVC.selectIndex = 4;
                [self.tabBarController setSelectedIndex:1];
                break;
            case 7:
                totolVC.selectIndex = 0;
                [self.tabBarController setSelectedIndex:1];
                break;
                
            default:
                break;
        }

    }else{
    
    
        
        
        NSLog(@"secondCollectionView == %lu--%lu",indexPath.section, indexPath.item);
        

    
    }
    
   
}



#pragma mark --- <PageViewDelegate>
-(void)didSelectPageViewWithNumber:(NSInteger)selectNumber{


    HXLog(@"%lu",selectNumber);

}




@end
