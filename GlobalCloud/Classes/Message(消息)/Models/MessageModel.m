//
//  MessageModel.m
//  GlobalCloud
//
//  Created by hexuan on 16/12/24.
//  Copyright © 2016年 hexuan. All rights reserved.
//

#import "MessageModel.h"

@implementation MessageModel

+(NSArray *)demoArrays{

    MessageModel *m1 = [[MessageModel alloc] init];
    m1.title = @"系统通知";
    m1.subTitle = @"关于云购全球积分规则调整的公告";
    m1.imageStr = @"系统通知";
    
    MessageModel *m2 = [[MessageModel alloc] init];
    m2.title = @"视屏专区";
    m2.subTitle = @"云购全球，精彩视频";
    m2.imageStr = @"视频专区";

    return @[m1,m2];
}


@end
