//
//  HXChangeNameViewController.m
//  GlobalCloud
//
//  Created by hexuan on 16/12/28.
//  Copyright © 2016年 hexuan. All rights reserved.
//

#import "HXChangeNameViewController.h"

@interface HXChangeNameViewController ()
@property (weak, nonatomic) IBOutlet UITextField *namexTextField;

@end

@implementation HXChangeNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"修改昵称";
}

-(void)saveName:(returnBlock)block{
    self.block = block;
}

- (IBAction)clickSaveButton:(UIButton *)sender {
    self.block(self.namexTextField.text);
    [self.navigationController popViewControllerAnimated:YES];
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{

    [self.view endEditing:YES];

}



@end
