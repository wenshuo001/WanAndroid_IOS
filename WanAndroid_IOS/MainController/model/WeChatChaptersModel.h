//
//  WeChatChaptersModel.h
//  WanAndroid_IOS
//
//  Created by 库兹马 on 2020/10/25.
//  Copyright © 2020 kuzima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WeChatChapters_V1Model.h"
#import <MJExtension/MJExtension.h>
 
NS_ASSUME_NONNULL_BEGIN

@interface WeChatChaptersModel : NSObject
@property(nonatomic,copy)NSString * errorMsg;
@property(nonatomic,assign)NSInteger errorCode;
@property(nonatomic,strong)NSArray * data;
@end

NS_ASSUME_NONNULL_END
