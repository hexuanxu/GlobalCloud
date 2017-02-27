//
//  SettingCellModel.m
//  GlobalCloud
//
//  Created by hexuan on 16/12/27.
//  Copyright © 2016年 hexuan. All rights reserved.
//

#import "SettingCellModel.h"

@implementation SettingCellModel

-(instancetype)initWithTitle:(NSString *)title andPhoneText:(NSString *)phoneText andImageStr:(NSString *)imageStr{

    self = [super init];
    if (self) {
        
        self.title = title;
        self.phoneText = phoneText;
        self.imageStr = imageStr;
        
    }return self;

}


+(instancetype)SettingCellModelWithTitle:(NSString *)title andPhoneText:(NSString *)phoneText andImageStr:(NSString *)imageStr{

    return [[self alloc] initWithTitle:title andPhoneText:phoneText andImageStr:imageStr];
}



@end
