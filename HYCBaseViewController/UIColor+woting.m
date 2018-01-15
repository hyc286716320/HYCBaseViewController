//
//  UIColor+woting.m
//  WoTing
//
//  Created by 赵成峰 on 2017/7/19.
//  Copyright © 2017年 chengfeng. All rights reserved.
//

#import "UIColor+woting.h"
#define HYC__COLOR_HEXH(s)  [UIColor colorWithRed:(((s & 0xFF0000) >> 16))/255.0 green:(((s &0xFF00) >>8))/255.0 blue:((s &0xFF))/255.0 alpha:1.0]
@implementation UIColor (woting)

+ (UIColor *)mainOriginColor {
    return HYC__COLOR_HEXH(0xFF7E42);
}

+ (UIColor *)nomalBlackColor {
    return HYC__COLOR_HEXH(0x313140);
}

+ (UIColor *)nomalGrayColor {
    return HYC__COLOR_RGBLH(132, 133, 138,1);
}

+ (UIColor *)separatorColor {
    return HYC__COLOR_RGBLH(239, 239, 239,1);
}

+ (UIColor *)backgroundColor{
    return HYC__COLOR_RGBLH(247, 247, 247,1);
}
@end
