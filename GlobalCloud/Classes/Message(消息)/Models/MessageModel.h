//
//  MessageModel.h
//  GlobalCloud
//
//  Created by hexuan on 16/12/24.
//  Copyright © 2016年 hexuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MessageModel : NSObject


@property(nonatomic,strong)NSString *title;

@property(nonatomic,strong)NSString *subTitle;

@property(nonatomic,strong)NSString *imageStr;

+(NSArray *)demoArrays;

@end
