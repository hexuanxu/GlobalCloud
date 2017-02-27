//
//  SettingSecModel.m
//  GlobalCloud
//
//  Created by hexuan on 16/12/27.
//  Copyright © 2016年 hexuan. All rights reserved.
//

#import "SettingSecModel.h"
#import "SettingCellModel.h"

@implementation SettingSecModel


+(NSArray *)allSecArrays{

    SettingCellModel *m1 = [SettingCellModel SettingCellModelWithTitle:@"修改密码" andPhoneText:@"" andImageStr:@"icon_1"];
    SettingCellModel *m2 = [SettingCellModel SettingCellModelWithTitle:@"解除绑定" andPhoneText:@"" andImageStr:@"icon_2"];
    SettingCellModel *m3 = [SettingCellModel SettingCellModelWithTitle:@"最新公告" andPhoneText:@"" andImageStr:@"icon_3"];
    SettingCellModel *m4 = [SettingCellModel SettingCellModelWithTitle:@"常见问题" andPhoneText:@"" andImageStr:@"icon_4"];
    SettingCellModel *m5 = [SettingCellModel SettingCellModelWithTitle:@"联系客服" andPhoneText:@"15827040118" andImageStr:@"icon_5"];
    SettingCellModel *m6 = [SettingCellModel SettingCellModelWithTitle:@"关于我们" andPhoneText:@"" andImageStr:@"icon_6"];
    SettingCellModel *m7 = [SettingCellModel SettingCellModelWithTitle:@"意见反馈" andPhoneText:@"" andImageStr:@"icon_7"];
    SettingCellModel *m8 = [SettingCellModel SettingCellModelWithTitle:@"扫一扫" andPhoneText:@"" andImageStr:@"icon_8"];
    SettingCellModel *m9 = [SettingCellModel SettingCellModelWithTitle:@"清除缓存" andPhoneText:@"" andImageStr:@"icon_9"];

    SettingSecModel *sec1 = [[SettingSecModel alloc] init];
    SettingSecModel *sec2 = [[SettingSecModel alloc] init];
    SettingSecModel *sec3 = [[SettingSecModel alloc] init];
    sec1.secArrays = @[m1,m2];
    sec1.secTitle = @"  安全中心";
    sec2.secArrays = @[m3,m4];
    sec2.secTitle = @"  服务";
    sec3.secArrays = @[m5,m6,m7,m8,m9];
    sec3.secTitle = @"  关于";
    return @[sec1,sec2,sec3];
    
}


@end
