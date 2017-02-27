//
//  SettingSecModel.h
//  GlobalCloud
//
//  Created by hexuan on 16/12/27.
//  Copyright © 2016年 hexuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingSecModel : NSObject

@property(nonatomic,strong)NSString *secTitle;
@property(nonatomic,strong)NSArray *secArrays;

+(NSArray *)allSecArrays;

@end
