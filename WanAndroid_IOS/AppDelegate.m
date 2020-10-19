//
//  AppDelegate.m
//  WanAndroid_IOS
//
//  Created by 库兹马 on 2020/9/12.
//  Copyright © 2020 kuzima. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "GankViewController.h"
#import "CenterViewController.h"
#import "GTScreen.h"
#import "BaseTabBarController.h"

// 在AppDelegate.m中
// iOS10.0 需要导入
#import <UserNotifications/UserNotifications.h>

@interface AppDelegate ()<UITabBarControllerDelegate>

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
         //设置 UIWindow
       self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds] ];
       // 底部tabbar
       UITabBarController *tabbar = [[UITabBarController alloc] init];
       // 管理 UIViewController 的跳转
       UINavigationController *uinavigatController =[[UINavigationController alloc] initWithRootViewController:tabbar];
       
       MainViewController  *mainViewController =[[MainViewController alloc] init];
       
       GankViewController  *gankViewController =[[GankViewController alloc] init];
       
       CenterViewController  *centerViewController = [[CenterViewController alloc] init];
     
       [tabbar setViewControllers:@[mainViewController,gankViewController,centerViewController]];
       // 可以理解为 tabbar 选项卡的监听
       tabbar.delegate = self;
       //如果要底部不出现 tabbar 必须设置 rootViewController 为 uinavigatController
       [self setWindow:[[UIWindow alloc] initWithFrame:SCREEN_BOUNDS]];
       [self.window setBackgroundColor:[UIColor whiteColor]];
       [self.window setRootViewController:[[BaseTabBarController alloc] init]];
       [self.window makeKeyAndVisible];
    [self registerAPN];
    return YES;
}

// 配合tabbar.delegate = self;  当点击tabbar 会回调此方法
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    NSLog(@"did select");
}

 
- (void)registerAPN {

      if (@available(iOS 10.0, *)) { // iOS10 以上
          UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
          [center requestAuthorizationWithOptions:(UNAuthorizationOptionAlert + UNAuthorizationOptionSound) completionHandler:^(BOOL granted, NSError * _Nullable error) {
              
          }];
      } else {// iOS8.0 以上
          UIUserNotificationSettings *setting = [UIUserNotificationSettings settingsForTypes:UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert categories:nil];
          [[UIApplication sharedApplication] registerUserNotificationSettings:setting];
      }
  }

@end
