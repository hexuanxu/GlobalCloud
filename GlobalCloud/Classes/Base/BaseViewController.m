//
//  BaseViewController.m
//  GlobalCloud
//
//  Created by hexuan on 16/12/26.
//  Copyright © 2016年 hexuan. All rights reserved.
//

#import "BaseViewController.h"
#import "UIImage+Image.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (void)hideNavigationBar:(BOOL)hidden animated:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:hidden animated:animated];;
}

/**导航栏LeftItem文字
 */
- (void)setLeftItemTitle:(NSString *)title action:(SEL)action {
    
    NSDictionary *attributes = @{NSFontAttributeName:SYSTEM_FONT(15)};
    CGSize size = [title sizeWithAttributes:attributes];
    _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _leftBtn.frame = CGRectMake(0, 0, size.width <= 10 ? 70 : size.width + 10, 44);
    _leftBtn.titleLabel.textAlignment = NSTextAlignmentLeft;
    _leftBtn.titleLabel.font = SYSTEM_FONT(15);
    [_leftBtn setTitleColor:UIColorFromRGBA(0x333333, 1.0) forState:UIControlStateNormal];
    [_leftBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateHighlighted];
    [_leftBtn setTitle:title forState:UIControlStateNormal];
    
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -5;
    
    [_leftBtn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:_leftBtn];
    self.navigationItem.leftBarButtonItems = @[negativeSpacer, backItem];
    
}

/**导航栏LeftItem图片
 */
- (void)setLeftImageNamed:(NSString *)name action:(SEL)action {
    
    _leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _leftBtn.frame = CGRectMake(0, 0, 24, 24);
    UIImage *image = [UIImage imageNamed:name];
    [_leftBtn setImage:image forState:UIControlStateNormal];
    [_leftBtn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    _leftBtn.imageEdgeInsets = UIEdgeInsetsMake(0, -5, 0, 5);
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:_leftBtn];
    self.navigationItem.leftBarButtonItem = backItem;
   
}

/**导航栏RightItem文字
 */
- (void)setRightItemTitle:(NSString *)title action:(SEL)action {
    [self setRightItemTitle:title titleColor:kDefaultColor action:action];
}

- (void)setRightItemTitle:(NSString *)title titleColor:(UIColor *)color action:(SEL)action {
    _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    NSDictionary *attributes = @{NSFontAttributeName: SYSTEM_FONT(15)};
    CGSize size = [title sizeWithAttributes:attributes];
    //! 这里需要根据内容大小来调整宽度
    _rightBtn.frame = CGRectMake(0, 0, size.width <= 10 ? 70 : size.width + 10, 44);
    [_rightBtn setTitleColor:color forState:UIControlStateNormal];
    [_rightBtn setTitleColor:[color colorWithAlphaComponent:0.5] forState:UIControlStateHighlighted];
    [_rightBtn setTitle:title forState:UIControlStateNormal];
    _rightBtn.titleLabel.textAlignment = NSTextAlignmentRight;
    _rightBtn.titleLabel.font =SYSTEM_FONT(15);
    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc]
                                       initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace
                                       target:nil action:nil];
    negativeSpacer.width = -5;
    
    [_rightBtn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithCustomView:_rightBtn];
    self.navigationItem.rightBarButtonItems = @[negativeSpacer, backItem];
}

/**导航栏RightItem图片
 */
- (void)setRightImageNamed:(NSString *)name action:(SEL)action {
    _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *image2=  [UIImage imageNamed:name];
    _rightBtn.frame =CGRectMake(0, 0, 50, 44);
    _rightBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 18, 0, -10);
    [_rightBtn setImage:image2 forState:UIControlStateNormal];
    [_rightBtn addTarget:self action:action forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:_rightBtn];
}

/**导航栏RightItem多个图片
 */
- (void)setupRightItems:(NSArray *)images andBlock:(RightItemBlock)block{
    
    self.block = block;
    CGFloat margin = 0.0, width = 35.0;
    UIView *container = [UIView new];
    container.origin = CGPointMake(0, 0);
    container.size = CGSizeMake(width*images.count+margin*(images.count-1), width);
    
    for (int i=0; i<images.count; i++){
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.origin = CGPointMake(margin*i+width*i, 0);
        button.size = CGSizeMake(width, width);
        button.tag = i+1;
        button.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, -10);
        [button setImage:IMAGE_NAMED(images[i]) forState:UIControlStateNormal];
        [container addSubview:button];
        [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];

    }
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithCustomView:container];
    self.navigationItem.rightBarButtonItem = item;
}

- (void)click:(UIButton *)sender {
    
    if (_block) {
        _block(sender.tag);
    }
}

/**设置titleView图片
 */
- (void)setTitleView:(NSString *)imageName {
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.0f, 0.0f, 100.0f, 40.0f)];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    UIImage *image = IMAGE_NAMED(imageName);
    imageView.image = image;
    self.navigationItem.titleView = imageView;
}


- (void)setDefaultNavigationBar {
    [self setNavigationBarBackgroundImage:nil
                                tintColor:[UIColor whiteColor]
                                textColor:[UIColor blackColor]
                           statusBarStyle:UIStatusBarStyleDefault];
}

- (void)setClearNavigationBar {
    [self setNavigationBarBackgroundImage:[UIImage imageWithColor:[UIColor clearColor]]
                                tintColor:[UIColor clearColor]
                                textColor:[UIColor clearColor]
                           statusBarStyle:UIStatusBarStyleDefault];
}


- (void)setNavigationBarBackgroundImage:(UIImage *)image
                              tintColor:(UIColor *)tintColor
                              textColor:(UIColor *)textColor
                         statusBarStyle:(UIStatusBarStyle)style {
    
    [self.navigationController.navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setBarTintColor:tintColor];
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:textColor,NSFontAttributeName:SYSTEM_FONT(18)};
    [UIApplication sharedApplication].statusBarStyle = style;
}

/**设置返回按钮
 */
- (void)setBackItem {
    [self setBackItemAction:nil];
}

- (void)setBackItemAction:(SEL)sel {
    [self setBackItem:@"返回" action:sel];
    
}

- (void)setBackItem:(NSString *)title action:(SEL)sel {
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]initWithTitle:title style:UIBarButtonItemStylePlain target:self action:sel];
    self.navigationItem.backBarButtonItem = backItem;
}

@end
