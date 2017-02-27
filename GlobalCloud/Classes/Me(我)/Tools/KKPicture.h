//
//  KKPicture.h
//  KaKong611
//
//  Created by hexuan on 15/7/10.
//  Copyright (c) 2015年 YangYi. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^PictureBlock)(UIImage *returnImage);

@interface KKPicture : NSObject

+ (instancetype)sharePicture;

- (void)getImageWithView:(id)view returnImage:(PictureBlock)image;

- (void)getPhotoImageWithView:(id)view returnImage:(PictureBlock)image;

- (void)getCameraImageWithView:(id)view returnImage:(PictureBlock)image;

@end
