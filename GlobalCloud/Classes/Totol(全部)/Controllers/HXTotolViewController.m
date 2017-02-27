//
//  HXTotolViewController.m
//  GlobalCloud
//
//  Created by hexuan on 16/12/22.
//  Copyright © 2016年 hexuan. All rights reserved.
//

#import "HXTotolViewController.h"
#import "MJExtension.h"
#import "leftItem.h"
#import "rightCollectionModel.h"
#import "HXRightCollectionViewController.h"
#import "HXLeftTableViewCell.h"

@interface HXTotolViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *leftTableView;
@property (nonatomic, strong) NSMutableArray *dataSource;
@property (nonatomic, strong) NSMutableArray *collectionDatas;
@property(nonatomic,strong)UIView *rightContentView;
@property (nonatomic, strong) NSArray *listVCsArr;//存放右边列表控制器对象

@end

static NSString * const LeftTableCellId = @"LeftTableCellId";
@implementation HXTotolViewController

- (NSMutableArray *)dataSource
{
    if (!_dataSource)
    {
        _dataSource = [NSMutableArray array];
    }
    return _dataSource;
}

- (NSMutableArray *)collectionDatas
{
    if (!_collectionDatas)
    {
        _collectionDatas = [NSMutableArray array];
    }
    return _collectionDatas;
}

- (UITableView *)leftTableView
{
    if (!_leftTableView)
    {
        _leftTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 100, kDeviceHeight)];
        _leftTableView.delegate = self;
        _leftTableView.dataSource = self;
        _leftTableView.tableFooterView = [UIView new];
//        _leftTableView.rowHeight = 55;
        _leftTableView.showsVerticalScrollIndicator = NO;
       // _leftTableView.separatorColor = [UIColor clearColor];
        [_leftTableView registerClass:[HXLeftTableViewCell class] forCellReuseIdentifier:LeftTableCellId];
        
    }
    return _leftTableView;
}


-(UIView *)rightContentView{

    if (!_rightContentView) {
        _rightContentView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.leftTableView.frame), 0, kDeviceWidth-self.leftTableView.width, kDeviceHeight-64-49)];
        _rightContentView.backgroundColor = [UIColor redColor];
    }return _rightContentView;
}


- (NSArray *)listVCsArr{
    if (!_listVCsArr) {
        NSMutableArray *listVCMutableArr = [NSMutableArray array];
        /* 创建与栏目数相同的软文列表视图控制器，并添加到listVCsArr */
        for (int index = 0; index < self.dataSource.count; index ++) {
            
            UICollectionViewFlowLayout *layout=[[UICollectionViewFlowLayout alloc]init];
            layout.minimumLineSpacing=10; //设置每一行的间距
            layout.itemSize=CGSizeMake((self.rightContentView.width-10*6)/3, 90);  //设置每个单元格的大小
            layout.sectionInset=UIEdgeInsetsMake(15, 10,0 , 10);
            
            HXRightCollectionViewController *listVC = [[HXRightCollectionViewController alloc] initWithCollectionViewLayout:layout];
            listVC.view.frame = self.rightContentView.bounds;

            leftItem *item = self.dataSource[index];
            listVC.dataSouce =item.subcategories;
            [listVCMutableArr addObject:listVC];
        }
        _listVCsArr = [listVCMutableArr copy];
    }
    return _listVCsArr;
}


-(void)setSelectIndex:(NSInteger)selectIndex{

    _selectIndex = selectIndex;
    
    
    [self loadData];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //加载数据
    [self loadData];
    
    self.leftTableView.separatorColor = UIColorFromRGBA(0xf3f3f3, 1.0);
    
//    [self.leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:self.selectIndex inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
    
    
}

//创建表格
- (void)createTable {
 
     [self.leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:self.selectIndex inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
    
    [self.view addSubview:self.leftTableView];
    
    [self.view addSubview:self.rightContentView];
    
    for (UIView *subView in self.rightContentView.subviews) {
        
        [subView removeFromSuperview];
    }
    
    HXRightCollectionViewController *rightVC = self.listVCsArr[self.selectIndex];
    [self addChildViewController:rightVC];
    [self.rightContentView addSubview:rightVC.view];

}

//加载数据
-(void)loadData{

    NSString *path = [[NSBundle mainBundle] pathForResource:@"liwushuo.json" ofType:nil];
    
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSArray *categories = dict[@"data"][@"categories"];
    
    NSMutableArray *tempArrays = [[NSMutableArray alloc] init];
    for (NSDictionary *dict in categories) {
        
        leftItem *model = [leftItem mj_objectWithKeyValues:dict];
        
        [tempArrays addObject:model];
      
        
        NSMutableArray *datas = [NSMutableArray array];
        for (rightCollectionModel *s_model in model.subcategories) {
            
            [datas addObject:s_model];
        }
        self.collectionDatas = datas;
    }
    
    self.dataSource = tempArrays;
    
    //创建表格
    [self createTable];

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;

}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.dataSource.count;

}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    leftItem *item = self.dataSource[indexPath.row];
    
    HXLeftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:LeftTableCellId forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.textLabel.text = item.name;
    cell.textLabel.font = [UIFont systemFontOfSize:13];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    /* 移除不需要显示的文章列表 */
    for (HXRightCollectionViewController *listVC in self.listVCsArr) {
        
        [listVC.view removeFromSuperview];
    }
    
    /* 添加需要显示的文章列表 */
    HXRightCollectionViewController *listVC = (HXRightCollectionViewController *)self.listVCsArr[indexPath.row];
   [self.rightContentView addSubview:listVC.view];

  }

#pragma mark -- 设置tableview分割线
-(void)viewDidLayoutSubviews
{
    if ([self.leftTableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [self.leftTableView setSeparatorInset:UIEdgeInsetsMake(0,0,0,0)];
    }
    
    if ([self.leftTableView respondsToSelector:@selector(setLayoutMargins:)]) {
        [self.leftTableView setLayoutMargins:UIEdgeInsetsMake(0,0,0,0)];
    }
}



-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}


@end
