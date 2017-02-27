//
//  HXPostViewController.m
//  GlobalCloud
//
//  Created by hexuan on 16/12/24.
//  Copyright © 2016年 hexuan. All rights reserved.
//

#import "HXPostViewController.h"
#import "LBTabBar.h"
#import "HXMainTabBarController.h"
@interface HXPostViewController ()

@end

@implementation HXPostViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor greenColor];
    
    
    [self creatNavView];
}

-(void)creatNavView{

    UIView *nav = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kDeviceWidth, 64)];
    nav.backgroundColor = [UIColor redColor];
    UIButton *backBtn = [[UIButton alloc] init];
    [backBtn setBackgroundImage:[UIImage imageNamed:@"btn_navigation_close"] forState:UIControlStateNormal];
    backBtn.size =CGSizeMake(backBtn.currentBackgroundImage.size.width, backBtn.currentBackgroundImage.size.height);
    backBtn.x = 5;
    backBtn.y = (nav.height-backBtn.height)/2+10;
   
    [backBtn addTarget:self action:@selector(clickBackBtn:) forControlEvents:UIControlEventTouchUpInside];
    [nav addSubview:backBtn];
    [self.view addSubview:nav];
    
}


-(void)clickBackBtn:(UIButton *)sender{
 
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    [self dismissViewControllerAnimated:YES completion:^{
        HXMainTabBarController *tabbarVC = (HXMainTabBarController *)appDelegate.window.rootViewController;
        LBTabBar *tabbar = (LBTabBar *)tabbarVC.tabBar;
        [tabbar.redView.layer removeAllAnimations];
        [tabbar startAnimation:tabbar.redView];
    }];
}


@end
