//
//  WeChatChapters_V1Model.h
//  WanAndroid_IOS
//
//  Created by 库兹马 on 2020/10/25.
//  Copyright © 2020 kuzima. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WeChatChapters_V1Model : NSObject

@property(nonatomic,copy)NSString * name;
@property(nonatomic,assign)NSInteger courseId;
@property(nonatomic,assign)NSInteger order;
@property(nonatomic,assign)NSInteger parentChapterId;
@property(nonatomic,copy)NSString * visible;
@property (nonatomic, assign) BOOL userControlSetTop;
@end

NS_ASSUME_NONNULL_END
