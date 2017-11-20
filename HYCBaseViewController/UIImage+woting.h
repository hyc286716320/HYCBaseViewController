//
//  UIImage+woting.h
//  WoTing
//
//  Created by 赵成峰 on 2017/7/20.
//  Copyright © 2017年 chengfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (woting)

+ (UIImage *)imageWithColor:(UIColor*)color size:(CGSize)size;
+ (UIImage *)drawImageWithColor:(CGColorRef)color;
- (UIImage *)imageWithRoundedCornersSize:(float)cornerRadius;
- (UIImage *)imageTintedWithColor:(UIColor *)color;
@end

