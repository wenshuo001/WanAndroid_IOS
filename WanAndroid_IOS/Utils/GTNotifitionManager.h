//
//  GTNotifitionManager.h
//  WanAndroid_IOS
//
//  Created by Wenshuo on 2020/9/26.
//  Copyright © 2020 kuzima. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


/**
 APP 推送管理
 */
@interface GTNotifitionManager : NSObject

+ (GTNotifitionManager *)notificationManager;

- (void)checkNotificationAuthorization;

@end

NS_ASSUME_NONNULL_END
