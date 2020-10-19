//
//  BaseNavigationController.m
//  WanAndroid_IOS
//
//  Created by Wenshuo on 2020/10/11.
//  Copyright © 2020 kuzima. All rights reserved.
//

#import "BaseNavigationController.h"
#import "UINavigationController+JZExtension.h"


#pragma mark - 声明
@interface BaseNavigationController ()

@end

@implementation BaseNavigationController

#pragma mark - 初始化
+ (instancetype)initWithRootViewController:(UIViewController *)vc {
    BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:vc];
    nav.jz_navigationBarTransitionStyle = JZNavigationBarTransitionStyleSystem;
    return nav;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
   [super pushViewController:viewController animated:animated];
}
@end
