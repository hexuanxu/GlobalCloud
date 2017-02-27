//
//  HXPersonCenterViewController.m
//  GlobalCloud
//
//  Created by hexuan on 16/12/27.
//  Copyright © 2016年 hexuan. All rights reserved.
//

#import "HXPersonCenterViewController.h"
#import "HXInfoCellOne.h"
#import "KKPicture.h"
#import "HXChangeNameViewController.h"
#import "UITableView+Custom.h"

@interface HXPersonCenterViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)NSArray *dataSource;
@property(nonatomic,strong) UITableView *infoTableView;
@end

static NSString * const reuseIdentifier_Info = @"HXInfoCellID";
@implementation HXPersonCenterViewController

/**
 懒加载设置TableView
 */
-(UITableView *)infoTableView{
    
    if (!_infoTableView) {
        
        UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        self.infoTableView = tableView;
        self.infoTableView.delegate = self;
        self.infoTableView.dataSource = self;
        [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cellID"];
        [tableView registerNib:[UINib nibWithNibName:@"HXInfoCellOne" bundle:nil] forCellReuseIdentifier:reuseIdentifier_Info];
        tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        [tableView setCustomSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
        tableView.rowHeight = 44;
    }return _infoTableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _dataSource = @[@"头像",@"昵称",@"会员等级",@"手机号码",@"收货地址",@"实名认证",@"银行卡"];
    
    [self.view addSubview:self.infoTableView];
    
    
    self.title = @"个人中心";
    
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.dataSource.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    HXInfoCellOne *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier_Info forIndexPath:indexPath];
    if (indexPath.row != 2) {
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    if (indexPath.row==0) {
        cell.rightLabel.hidden = YES;
        cell.headerImageView.hidden = NO;
    }else{
        cell.rightLabel.hidden = NO;
        cell.headerImageView.hidden = YES;
    }
    cell.leftLabel.text = self.dataSource[indexPath.row];
    return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.row==0) {
        HXInfoCellOne *cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
        KKPicture *picture = [KKPicture sharePicture];
        [picture getImageWithView:self.view returnImage:^(UIImage *returnImage) {
            cell.headerImageView.image = returnImage;
        }];
    }else if (indexPath.row == 1){
    
        HXInfoCellOne *cell = [tableView cellForRowAtIndexPath:[NSIndexPath indexPathForRow:1 inSection:0]];
        HXChangeNameViewController *ChangeNameVC = [[HXChangeNameViewController alloc] initWithNibName:@"HXChangeNameViewController" bundle:nil];
        [ChangeNameVC saveName:^(NSString *nameStr) {
            cell.rightLabel.text = nameStr;
        }];
        [self.navigationController pushViewController:ChangeNameVC animated:YES];
    
    }

}



@end
