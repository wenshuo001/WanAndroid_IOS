//
//  UIFont+Extension.h
//  WanAndroid_IOS
//
//  Created by Wenshuo on 2020/10/11.
//  Copyright © 2020 kuzima. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#define IPHONE6_INCREMENT 2
#define IPHONE6PLUS_INCREMENT 3
#define IPHONE6PLUS_UP_INCREMENT 4
#define IS_IPHONEX_INCREMENT 4

@interface UIFont (Extension)
/// 自适应字体大小
+ (CGFloat)adjustFontSize:(CGFloat)fontsize;
@end

NS_ASSUME_NONNULL_END
