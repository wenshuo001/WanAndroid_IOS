//
//  UIFont+Extension.m
//  WanAndroid_IOS
//
//  Created by Wenshuo on 2020/10/11.
//  Copyright © 2020 kuzima. All rights reserved.
//

#import "UIFont+Extension.h"
#import "GTScreen.h"

@implementation UIFont (Extension)

+ (CGFloat)adjustFontSize:(CGFloat)fontsize {
    CGFloat newFont;
    if (IS_IPHONE_5) {
        newFont = fontsize;
    } else if (IS_IPHONE_6) {
        newFont = fontsize + IPHONE6_INCREMENT;
    } else if (IS_IPHONE_6_PLUS) {
        newFont = fontsize + IPHONE6PLUS_INCREMENT;
    } else if (IS_IPHONE_6_PLUS_UP) {
        newFont = fontsize + IPHONE6PLUS_UP_INCREMENT;
    } else if (IS_IPHONEX) {
        newFont = fontsize + IS_IPHONEX_INCREMENT;
    } else {
        newFont = fontsize;
    }
    return newFont;
}

@end
