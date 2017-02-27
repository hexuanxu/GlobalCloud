//
//  BaseViewController.h
//  GlobalCloud
//
//  Created by hexuan on 16/12/26.
//  Copyright © 2016年 hexuan. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^RightItemBlock)(NSInteger index);

@interface BaseViewController : UIViewController

@property (nonatomic, strong) UIButton *rightBtn;

@property (nonatomic, strong) UIButton *leftBtn;

@property (nonatomic, copy) RightItemBlock block;

/**隐藏导航栏
 */
- (void)hideNavigationBar:(BOOL)hidden
                 animated:(BOOL)animated;


/**导航栏LeftItem文字
 */
- (void)setLeftItemTitle:(NSString *)title
                  action:(SEL)action;

/**导航栏LeftItem图片
 */
- (void)setLeftImageNamed:(NSString *)name
                   action:(SEL)action;


/**导航栏RightItem文字
 */
- (void)setRightItemTitle:(NSString *)title
                   action:(SEL)action;


- (void)setRightItemTitle:(NSString *)title
               titleColor:(UIColor *)color
                   action:(SEL)action;

/**导航栏RightItem图片
 */
- (void)setRightImageNamed:(NSString *)name
                    action:(SEL)action;

/**导航栏RightItem多个图片
 */
- (void)setupRightItems:(NSArray *)images andBlock:(RightItemBlock) block;

/**设置titleView图片
 */
- (void)setTitleView:(NSString *)imageName;


/**设置默认navigationbar status bar 黑色
 */
- (void)setDefaultNavigationBar;

/**设置透明navigationbar status bar 黑色
 */
- (void)setClearNavigationBar;


/**设置返回按钮
 */
- (void)setBackItem;
- (void)setBackItemAction:(SEL)sel;
- (void)setBackItem:(NSString *)title
             action:(SEL)sel;


@end
