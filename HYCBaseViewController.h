//
//  WTBaseViewController.h
//  WoTing
//
//  Created by 赵成峰 on 2017/7/19.
//  Copyright © 2017年 chengfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYCBaseViewController : UIViewController

//左导航图片
@property (nonatomic, copy) NSString *leftNavImageName;
//右导航图片
@property (nonatomic, copy) NSString *rightNavImageName;
@property (nonatomic, copy) NSString *rightNavTitle;

//导航条是否半透明
@property (nonatomic, assign) BOOL navTranslucent;
//导航条底部的线是否隐藏
@property (nonatomic, assign) BOOL navBottomLineHidden;
//导航条的按钮颜色
@property (nonatomic, weak) UIColor *navItemTintColor;

//自定义导航条 （isCustomNavgationBar = YES 时下面三个生效
@property (nonatomic, assign, readonly) BOOL isCustomNavgationBar;
@property (strong, nonatomic, readonly) UINavigationBar *customNavigationBar;
@property (nonatomic, strong, readonly) UILabel *customTitleLabel;

@property (nonatomic, assign) CGFloat topViewEdge;

@property (nonatomic, assign, readonly) CGFloat tabbarHeight;

//左右导航点击动作
- (void)leftNavBackAction;
- (void)rightNavItemAction;
- (void)setUI;
- (void)loadSquareRequest;

@end
