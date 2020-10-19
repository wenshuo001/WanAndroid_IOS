//
//  BaseTabBarController.h
//  WanAndroid_IOS
//
//  Created by Wenshuo on 2020/10/11.
//  Copyright © 2020 kuzima. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseTabBarController : UITabBarController

@property (nonatomic, assign) NSInteger index;

- (void)hideTabbar:(BOOL)hidden;

@end

NS_ASSUME_NONNULL_END
