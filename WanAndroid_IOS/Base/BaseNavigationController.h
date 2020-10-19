//
//  BaseNavigationController.h
//  WanAndroid_IOS
//
//  Created by Wenshuo on 2020/10/11.
//  Copyright © 2020 kuzima. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseNavigationController : UINavigationController
#pragma mark - 初始化
+ (instancetype)initWithRootViewController:(UIViewController *)vc;
@end

NS_ASSUME_NONNULL_END
