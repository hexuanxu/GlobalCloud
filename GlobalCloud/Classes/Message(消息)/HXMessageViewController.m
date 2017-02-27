//
//  HXMessageViewController.m
//  GlobalCloud
//
//  Created by hexuan on 16/12/22.
//  Copyright © 2016年 hexuan. All rights reserved.
//

#import "HXMessageViewController.h"
#import "HXMessageCell.h"
#import "MessageModel.h"
#import "HXSystemNoticeViewController.h"

@interface HXMessageViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *messageTableView;
@property(nonatomic,strong)NSArray *dataSource;

@end

static NSString * const reuseIdentifier_Message = @"HXMessageCellID";
@implementation HXMessageViewController

-(UITableView *)messageTableView{
    
    if (!_messageTableView) {
        
        CGRect frame = CGRectMake(0, 0, kDeviceWidth, kDeviceHeight-64-49);
        UITableView *tableView = [[UITableView alloc] initWithFrame:frame style:UITableViewStyleGrouped];
        self.messageTableView = tableView;
        self.messageTableView.delegate = self;
        self.messageTableView.dataSource = self;
        [self.messageTableView registerNib:[UINib nibWithNibName:@"HXMessageCell" bundle:nil] forCellReuseIdentifier:reuseIdentifier_Message];
       // self.messageTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        //注册单元格        
    
    }return _messageTableView;
}

-(NSArray *)dataSource{
    if (!_dataSource) {
        _dataSource = [MessageModel demoArrays];
    }return _dataSource;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
  
    [self.view addSubview:self.messageTableView];
    
  //  [self hideNavigationBar:YES animated:YES];
    
}

- (void)hideNavigationBar:(BOOL)hidden animated:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:hidden animated:animated];;
}

#pragma mark -- <UITableViewDataSource>
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return self.dataSource.count;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 1;

}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    MessageModel *message = self.dataSource[indexPath.section];
    HXMessageCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier_Message forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.message = message;
    return cell;

}




#pragma mark --- <UITableViewDelegate>

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section==0) {
       
        HXSystemNoticeViewController *SNotice = [[HXSystemNoticeViewController alloc] init];
        [self.navigationController pushViewController:SNotice animated:YES];
    }
  
    
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return 80;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 0.1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    return 10;
}

@end
