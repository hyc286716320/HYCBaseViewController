//
//  LLNavigationController.m
//  JLCSteelProject
//
//  Created by 周尊贤 on 2017/7/20.
//  Copyright © 2017年 周尊贤. All rights reserved.
//

#import "LLNavigationController.h"
#import "LLTabBarViewController.h"
#import "LLTabBarView.h"

@interface LLNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation LLNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.interactivePopGestureRecognizer.delegate = self;

}
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    NSLog(@"1111");
    LLTabBarViewController * tabBarVc = (LLTabBarViewController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    
    for (UIView * itemView in tabBarVc.tabBar.subviews) {
        if ([itemView isKindOfClass:[LLTabBarView class]]) {
            continue;
        }
        [itemView removeFromSuperview];
    }
   }

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if (self.childViewControllers.count > 0) {
  
            // 隐藏底部的 TabBar
        viewController.hidesBottomBarWhenPushed = YES;
        
        }
    
    [super pushViewController:viewController animated:animated];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    
   
    
    // 如果是根视图控制器，则不支持手势返回
    return self.childViewControllers.count > 1;
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
