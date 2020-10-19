//
//  GTNotifitionManager.m
//  WanAndroid_IOS
//
//  Created by Wenshuo on 2020/9/26.
//  Copyright © 2020 kuzima. All rights reserved.
//
#import <UserNotifications/UserNotifications.h>
#import <UIKit/UIKit.h>
#import "GTNotifitionManager.h"

@interface GTNotifitionManager()<UNUserNotificationCenterDelegate>

@end


//static 修饰局部变量
//1.只会初始化一次
//2.全局只会存在一份内存
//3.不会改变自身的作用域，比如原来是局部变量现在的话依然是局部变量
//4.生命周期延长(直到程序结束，这个局部变量才会被销毁
@implementation GTNotifitionManager

+ (GTNotifitionManager *)notificationManager{
    static GTNotifitionManager *manager;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[GTNotifitionManager alloc] init];
    });
    return manager;
}

- (void)checkNotificationAuthorization{
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    center.delegate = self;
    [center requestAuthorizationWithOptions:UNAuthorizationOptionBadge | UNAuthorizationOptionSound completionHandler:^(BOOL granted, NSError * _Nullable error) {
        if(granted){
            [self _pushLocalNotification];
            
            //远程推送
            dispatch_async(dispatch_get_main_queue(), ^{
               // [[UIApplication sharedApplication] registerForRemoteNotifications];
            });
        }
    }];
}

- (void)_pushLocalNotification{
    
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    content.badge = @(1);
    content.title = @"this is title";
    content.body = @"push message";
    content.sound = [UNNotificationSound defaultSound];
    
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:2.0f repeats:NO];
    
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:@"_pushLocalNotification" content:content trigger:trigger];
    
    
    [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        //
    }];
}


- (void)userNotificationCenter:(UNUserNotificationCenter *)center willPresentNotification:(UNNotification *)notification withCompletionHandler:(void (^)(UNNotificationPresentationOptions options))completionHandler{
    completionHandler(UNNotificationPresentationOptionAlert);
}


- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void(^)(void))completionHandler {
    
    //处理badge展示逻辑
    //点击之后根据业务逻辑处理
    //[UIApplication sharedApplication].applicationIconBadgeNumber = 100;
    
    //处理业务逻辑
    //completionHandler();
}

@end
