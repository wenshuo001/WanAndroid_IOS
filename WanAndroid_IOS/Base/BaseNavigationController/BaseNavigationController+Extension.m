//
//  BaseNavigationController+Extension.m
//  WanAndroid_IOS
//
//  Created by Wenshuo on 2020/10/12.
//  Copyright © 2020 kuzima. All rights reserved.
// 

#import "BaseNavigationController+Extension.h"
#import "GTScreen.h"
#import "BaseNavigationController.h"
#import <JGProgressHUD/JGProgressHUD.h>
#import <UIKit/UIKit.h>
#import <objc/runtime.h>
 


static NSString *hookSetGetKey = @"hookSetGetKey";

@implementation BaseNavigationController (Extension)


- (void)setHook_background:(UIView *)hook_background {
    objc_setAssociatedObject(self, &hookSetGetKey, hook_background, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (UIView *)hook_background {
    UIView *view = objc_getAssociatedObject(self, &hookSetGetKey);
    if (!view) {
        view = [[UIView alloc] initWithFrame:CGRectMake(0, -StatusBarHeight, SCREEN_WIDTH, NavigationBarHeight)];
        [view setBackgroundColor:kColor_Main_Color];
        [self.navigationBar addSubview:view];
        [self setHook_background:view];
    }
    return view;
}


+ (void)load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
//        [self swizzleInstanceMethodWithOriginSel:@selector(initWithRootViewController:)
//                                     swizzledSel:@selector(hook_initWithRootViewController:)];
    });
}
- (instancetype)hook_initWithRootViewController:(UIViewController *)rootViewController {
    [self hook_initWithRootViewController:rootViewController];
    [self hook_background];
    return self;
}



@end
