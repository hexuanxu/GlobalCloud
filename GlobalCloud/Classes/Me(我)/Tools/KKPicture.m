//
//  KKPicture.m
//  KaKong611
//
//  Created by hexuan on 15/7/10.
//  Copyright (c) 2015年 YangYi. All rights reserved.
//

#import "KKPicture.h"

@interface KKPicture()<UINavigationControllerDelegate,UIImagePickerControllerDelegate,UIActionSheetDelegate>{
    PictureBlock _returnBlock;
    UIViewController *_controller;
}

@end

@implementation KKPicture

+ (instancetype)allocWithZone:(struct _NSZone *)zone{
    static KKPicture *instance;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        instance = [super allocWithZone:zone];
    });
    return instance;
}

+ (instancetype)sharePicture{
    return [[self alloc]init];
}

- (void)initDataWithImage:(PictureBlock)image{
    _controller = [UIApplication sharedApplication].keyWindow.rootViewController;
    _returnBlock = image;
}

- (void)getImageWithView:(id)view returnImage:(PictureBlock)image{
    
    [self initDataWithImage:image];
    
    UIAlertController *alertView = [UIAlertController alertControllerWithTitle:@"" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
    
    UIAlertAction *a = [UIAlertAction actionWithTitle:@"选取现有的照片" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self openPhotoLibrary];
    }];
    
    UIAlertAction *okAlert = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        [self openCamera];
    }];
    
    [alertView addAction:okAlert];
    [alertView addAction:a];
    [alertView addAction:cancel];
    alertView.title = nil;
  
    [_controller presentViewController:alertView animated:YES completion:nil];
}

- (void)getPhotoImageWithView:(id)view returnImage:(PictureBlock)image{
    [self initDataWithImage:image];
    [self openPhotoLibrary];
}

- (void)getCameraImageWithView:(id)view returnImage:(PictureBlock)image{
    [self initDataWithImage:image];
    [self openCamera];
}

/**
 *  打开相机
 */
- (void)openCamera
{
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
        ipc.sourceType = UIImagePickerControllerSourceTypeCamera;
        ipc.delegate = self;
        ipc.showsCameraControls = YES;
        [_controller presentViewController:ipc animated:YES completion:nil];
        
    }
}

/**
 *  打开相册
 */
- (void)openPhotoLibrary
{
    UIImagePickerController *ipc = [[UIImagePickerController alloc] init];
    ipc.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    ipc.delegate = self;
    [_controller presentViewController:ipc animated:YES completion:nil];
}

#pragma mark - 图片选择控制器的代理
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    // 1.销毁picker控制器
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    // 2.获得的图片
    UIImage *image = info[UIImagePickerControllerOriginalImage];
    _returnBlock(image);
}


@end
