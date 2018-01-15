//
//  WTBaseViewController.m
//  WoTing
//
//  Created by 赵成峰 on 2017/7/19.
//  Copyright © 2017年 chengfeng. All rights reserved.
//

#import "HYCBaseViewController.h"
#import "UIBarButtonItem+SXCreate.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "UIColor+woting.h"
#import "NSObject+SXRuntime.h"
#import "UINavigationItem+SXFixSpace.h"
#import "UIImage+woting.h"
#define IS_IPHONE_58inch ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )812 ) < DBL_EPSILON )
#define kBottomGuideHeight (IS_IPHONE_58inch ? 34 : 0)
@interface HYCBaseViewController ()

@property (strong, nonatomic) UIImageView *navBarHairLineImgView;
@property (nonatomic, strong) UILabel *customTitleLabel;
@property (strong, nonatomic) UINavigationBar *customNavigationBar;
@property (strong, nonatomic) UIView *customStatusBarView;


@end

@implementation HYCBaseViewController

- (void)setUI{
    self.navigationController.navigationBar.hidden = false;
    self.navigationItem.title = @"";
    self.navigationController.navigationBar.barTintColor = HYC__COLOR_HEX(0x173C84);
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor],NSFontAttributeName:HYC__FontSize(20)};
    self.navItemTintColor = [UIColor whiteColor];
    
}

- (void)loadSquareRequest{
    
//    NSArray *classArray = [WKProgressHUD getSubclassSetSuperVC:
//                           
//                           [LLJLCTools getViewControllerAtView:self.view WithVcClass:NSClassFromString(@"HYCBaseViewController")]
//                           
//                           ];
//    
//    for (NSString *className in classArray) {
//        NSLog(@"%@",className);
//    }
    
}
#pragma mark - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (@available(iOS 11.0, *)) {
        [UIScrollView appearance].contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        self.automaticallyAdjustsScrollViewInsets = false;
    }

    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    if (self.isCustomNavgationBar) {
        self.fd_prefersNavigationBarHidden = YES;
        [self addCustomNavgationBar];
    }
    
    self.navTranslucent = NO;
    self.navBottomLineHidden = YES;
    //去导航栏下方横线
    UINavigationBar *naviBar = self.navigationController.navigationBar;
    self.navBarHairLineImgView = [self findHaidLineImageViewUnder:naviBar];
    if (self.navigationController.viewControllers.count > 1) {
        self.leftNavImageName = @"navIconBackBlack";
    }
    
    if (self.navItemTintColor == nil) {
        self.navItemTintColor = [UIColor lightTextColor];
    }
    
//    [[NSNotificationCenter defaultCenter] addObserverForName:HYC__SetUPDataNetRequest object:nil queue:nil usingBlock:^(NSNotification * _Nonnull note) {
//        [self loadSquareRequest];
//    }];
}

-(void)dealloc{
    NSLog(@"%s",__func__);
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.translucent = self.navTranslucent;
    self.navBarHairLineImgView.hidden = self.navBottomLineHidden;
    if (self.isCustomNavgationBar) {
    } else {
        self.navigationItem.leftBarButtonItem = self.leftItem;
        self.navigationItem.rightBarButtonItem = self.rightItem;
    }
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    if (self.isCustomNavgationBar) {
        [self.view bringSubviewToFront:self.customNavigationBar];
        [self.view bringSubviewToFront:self.customStatusBarView];
    }
}

#pragma mark - privite method
- (void)addCustomNavgationBar {
    self.fd_prefersNavigationBarHidden = YES;
    if (self.customNavigationBar.superview == nil) {
        [self.view addSubview:self.customNavigationBar];
        [self.view addSubview:self.customStatusBarView];
        
        @weakify(self);
        [RACObserve(self, customNavigationBar.backgroundColor) subscribeNext:^(id x) {
            @strongify(self);
            self.customStatusBarView.backgroundColor = x;
        }];
        
        [RACObserve(self, customNavigationBar.alpha) subscribeNext:^(id x) {
            @strongify(self);
            self.customStatusBarView.alpha = self.customNavigationBar.alpha;
        }];
    } else {
        [self.view bringSubviewToFront:self.customNavigationBar];
        [self.view bringSubviewToFront:self.customStatusBarView];
    }
    CGRect statusFrame = [UIApplication sharedApplication].statusBarFrame;
    [self.customStatusBarView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.view);
        make.height.mas_equalTo(statusFrame.size.height);
    }];
    [self.customNavigationBar mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.customStatusBarView.mas_bottom);
        make.left.right.equalTo(self.view);
        make.height.mas_equalTo(44);
    }];
}

- (UIImageView *) findHaidLineImageViewUnder :(UIView *) view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1) {
        return (UIImageView *)view;
    }
    for (UIView *subView in view.subviews) {
        UIImageView *imageView = [self findHaidLineImageViewUnder:subView];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}

#pragma mark - public method
- (void)leftNavBackAction {
    NSLog(@"他的");
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)rightNavItemAction {
    
}

#pragma mark - setter
- (void)setNavItemTintColor:(UIColor *)navItemTintColor {
    _navItemTintColor = navItemTintColor;
    [self setTintColorForItem:self.leftItem];
    [self setTintColorForItem:self.rightItem];
}

- (void)setLeftNavImageName:(NSString *)leftNavImageName {
    _leftNavImageName = leftNavImageName;
    self.leftItem  = [UIBarButtonItem itemWithTarget:self action:@selector(leftNavBackAction) image:[UIImage imageNamed:self.leftNavImageName]];
    if (self.isCustomNavgationBar) {
        self.customNavigationBar.topItem.leftBarButtonItem = self.leftItem;
    } else {
        self.navigationItem.leftBarButtonItem = self.leftItem;
    }
    
    [self setTintColorForItem:self.leftItem];
}

- (void)setTintColorForItem:(UIBarButtonItem *)item {
    
    if (item.customView && [item.customView isKindOfClass:[UIButton class]]) {
        UIButton *button = (UIButton *)item.customView;
        UIImage *image = [button.currentImage imageTintedWithColor:self.navItemTintColor];

        [button setTitleColor:self.navItemTintColor forState:UIControlStateNormal];
        [button setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateNormal];
        [button setImage:[image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] forState:UIControlStateSelected];
        [button setImage:image forState:UIControlStateNormal];
        [button setImage:image forState:UIControlStateSelected];
        button.tintColor = self.navItemTintColor;
    } else {
        item.tintColor = self.navItemTintColor;
    }
}

- (void)setRightNavImageName:(NSString *)rightNavImageName {
    _rightNavImageName = rightNavImageName;
    self.rightItem = [UIBarButtonItem itemWithTarget:self action:@selector(rightNavItemAction) image:[UIImage imageNamed:self.rightNavImageName]];
    if (self.isCustomNavgationBar) {
        self.customNavigationBar.topItem.rightBarButtonItem = self.rightItem;
    } else {
        self.navigationItem.rightBarButtonItem = self.rightItem;
    }
//    self.rightItem.badgeValue = @"2";
    [self setTintColorForItem:self.rightItem];
}

- (void)setRightNavTitle:(NSString *)rightNavTitle {
    _rightNavTitle = rightNavTitle;
    self.rightItem = [UIBarButtonItem itemWithTarget:self action:@selector(rightNavItemAction) title:rightNavTitle titleEdgeInsets:UIEdgeInsetsMake(0, -12, 0, 12)];
    self.rightItem.tintColor = self.navItemTintColor;
    
    if (self.isCustomNavgationBar) {
        self.customNavigationBar.topItem.rightBarButtonItem = self.rightItem;
    } else {
        self.navigationController.navigationItem.rightBarButtonItem = self.rightItem;
    }
}

- (void)setTitle:(NSString *)title {
    [super setTitle:title];
    if (self.isCustomNavgationBar) {
        self.customTitleLabel.text = title;
        [self.customTitleLabel sizeToFit];
        self.customNavigationBar.topItem.titleView = self.customTitleLabel;
    }
}

#pragma mark - getter
- (UINavigationBar *)customNavigationBar {
    if (_customNavigationBar == nil) {
        _customNavigationBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
        _customNavigationBar.tintColor = [UIColor lightTextColor];
        [_customNavigationBar setBackgroundImage: [[UIImage alloc] init] forBarMetrics: UIBarMetricsDefault];
        _customNavigationBar.shadowImage = [UIImage new];
        UINavigationItem* navigationItem = [[UINavigationItem alloc] init];
        [_customNavigationBar pushNavigationItem: navigationItem animated: NO];
    }
    return _customNavigationBar;
}

- (UIView *)customStatusBarView {
    if (_customStatusBarView == nil) {
        CGRect statusFrame = [UIApplication sharedApplication].statusBarFrame;
        _customStatusBarView = [[UIView alloc] initWithFrame:statusFrame];
    }
    return _customStatusBarView;
}

- (UILabel *)customTitleLabel {
    if (_customTitleLabel == nil) {
        _customTitleLabel = [[UILabel alloc] init];
        _customTitleLabel.textColor = HYC__COLOR_HEX(0xbfe3ff);
    }
    return _customTitleLabel;
}

- (CGFloat)tabbarHeight {
    CGFloat height = kBottomGuideHeight;
    if (self.tabBarController.tabBar != nil) {
        CGRect tabbarFrame = self.tabBarController.tabBar.frame;
        CGFloat screenHeight = SCREEN_HEIGHT;
        height = screenHeight - CGRectGetMinY(tabbarFrame);
    }
    return height;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end

