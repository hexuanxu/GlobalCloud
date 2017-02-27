//
//  HXSettingViewController.m
//  GlobalCloud
//
//  Created by hexuan on 16/12/27.
//  Copyright © 2016年 hexuan. All rights reserved.
//

#import "HXSettingViewController.h"
#import "SettingCellModel.h"
#import "SettingSecModel.h"
#import "HXSettingCell.h"
#import "UITableView+Custom.h"
@interface HXSettingViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *settingTableView;
@property(nonatomic,strong)NSArray *dataSource;

@end
static NSString * const reuseIdentifier_Setting = @"SettingID";
@implementation HXSettingViewController

/**
懒加载设置TableView
 */
-(UITableView *)settingTableView{

    if (!_settingTableView) {
        
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        self.settingTableView = tableView;
        self.settingTableView.delegate = self;
        self.settingTableView.dataSource = self;
        [tableView setCustomSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
        
    }return _settingTableView;
}


/**
 懒加载设置控制器数据
 */
-(NSArray *)dataSource{

    if (!_dataSource) {
        
        _dataSource = [SettingSecModel allSecArrays];
        
    }return _dataSource;

}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.settingTableView];
    
    self.title = @"设置";
    
}


#pragma mark --- <UITableViewDataSource>
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return self.dataSource.count;

}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    SettingSecModel *secModel = self.dataSource[section];
    return secModel.secArrays.count;

}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    SettingSecModel *sec = self.dataSource[indexPath.section];
    SettingCellModel *cellModel  = sec.secArrays[indexPath.row];
    
    HXSettingCell *cell = [HXSettingCell cellWithTableView:tableView];
    
    cell.cellSettingModel = cellModel;
    
    return cell;

}

#pragma mark --- <UITableViewDelegate>
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{

    SettingSecModel *sec = self.dataSource[section];
    return sec.secTitle;

}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    return 0.1;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 30;
}

@end
