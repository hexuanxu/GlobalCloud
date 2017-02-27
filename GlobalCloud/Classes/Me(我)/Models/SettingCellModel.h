//
//  SettingCellModel.h
//  GlobalCloud
//
//  Created by hexuan on 16/12/27.
//  Copyright © 2016年 hexuan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingCellModel : NSObject

@property(nonatomic,strong)NSString *title;
@property(nonatomic,strong)NSString *phoneText;
@property(nonatomic,strong)NSString *imageStr;

-(instancetype)initWithTitle:(NSString *)title andPhoneText:(NSString *)phoneText andImageStr:(NSString *)imageStr;
+(instancetype)SettingCellModelWithTitle:(NSString *)title andPhoneText:(NSString *)phoneText andImageStr:(NSString *)imageStr;

@end
