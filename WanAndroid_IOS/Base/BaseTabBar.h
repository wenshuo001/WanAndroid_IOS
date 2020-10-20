//
//  BaseTabBar.h
//  WanAndroid_IOS
//
//  Created by Wenshuo on 2020/10/11.
//  Copyright © 2020 kuzima. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#pragma mark - typedef
typedef void (^BaseTabBarClick)(NSInteger index);

@interface BaseTabBar : UITabBar
@property (nonatomic, assign) NSInteger index;
@property (nonatomic, copy) BaseTabBarClick click;
@end

NS_ASSUME_NONNULL_END
