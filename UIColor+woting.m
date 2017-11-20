//
//  UIColor+woting.m
//  WoTing
//
//  Created by 赵成峰 on 2017/7/19.
//  Copyright © 2017年 chengfeng. All rights reserved.
//

#import "UIColor+woting.h"

@implementation UIColor (woting)

+ (UIColor *)mainOriginColor {
    return HYC__COLOR_HEX(0xFF7E42);
}

+ (UIColor *)nomalBlackColor {
    return HYC__COLOR_HEX(0x313140);
}

+ (UIColor *)nomalGrayColor {
    return HYC__COLOR_RGBL(132, 133, 138,1);
}

+ (UIColor *)separatorColor {
    return HYC__COLOR_RGBL(239, 239, 239,1);
}

+ (UIColor *)backgroundColor{
    return HYC__COLOR_RGBL(247, 247, 247,1);
}
@end
