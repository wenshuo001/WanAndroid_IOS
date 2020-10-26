//
//  V1_BannerModel.h
//  WanAndroid_IOS
//
//  Created by 库兹马 on 2020/10/24.
//  Copyright © 2020 kuzima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeChatChapters_V1Model.h"
#import <MJExtension/MJExtension.h>
NS_ASSUME_NONNULL_BEGIN

@interface V1_BannerModel : NSObject

@property(nonatomic,copy)NSString * desc;
@property(nonatomic,assign)NSInteger id;
@property(nonatomic,copy)NSString * imagePath;
@property(nonatomic,assign)NSString * isVisible;
@property(nonatomic,copy)NSString * title;
@property(nonatomic,copy)NSString * url;
@end

NS_ASSUME_NONNULL_END
