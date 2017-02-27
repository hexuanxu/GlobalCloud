//
//  HXChangeNameViewController.h
//  GlobalCloud
//
//  Created by hexuan on 16/12/28.
//  Copyright © 2016年 hexuan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HXChangeNameViewController : UIViewController


typedef void(^returnBlock)(NSString *nameStr);

//回调block
@property(nonatomic,strong)returnBlock block;

-(void)saveName:(returnBlock)block;

@end
