//
//  leftItem.m
//  GlobalCloud
//
//  Created by hexuan on 16/12/23.
//  Copyright © 2016年 hexuan. All rights reserved.
//

#import "leftItem.h"

@implementation leftItem

+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{
             @"ID" : @"id",
             };
}

+ (NSDictionary *)objectClassInArray
{
    return @{ @"subcategories": @"rightCollectionModel"};
}


@end
