//
//  BaseModel.h
//  WanAndroid_IOS
//
//  Created by 库兹马 on 2020/10/24.
//  Copyright © 2020 kuzima. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN




@interface BaseModel : NSObject

@property (nonatomic, strong) NSString *errorMsg;
@property(nonatomic, assign) NSInteger errorCode;

@end

NS_ASSUME_NONNULL_END
