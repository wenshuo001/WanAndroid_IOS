//
//  BannerModel.h
//  WanAndroid_IOS
//
//  Created by 库兹马 on 2020/10/24.
//  Copyright © 2020 kuzima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "V1_BannerModel.h"
#import <MJExtension/MJExtension.h>
NS_ASSUME_NONNULL_BEGIN

@interface BannerModel : NSObject
@property(nonatomic,copy)NSString * errorMsg;
@property(nonatomic,assign)NSInteger errorCode;
@property(nonatomic,strong)NSArray * data;
@end

NS_ASSUME_NONNULL_END
