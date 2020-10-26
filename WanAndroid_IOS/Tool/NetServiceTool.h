//
//  NetServiceTool.h
//  WanAndroid_IOS
//
//  Created by 库兹马 on 2020/10/25.
//  Copyright © 2020 kuzima. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFHTTPSessionManager.h"
#import "BaseModel.h"
NS_ASSUME_NONNULL_BEGIN

typedef void(^NomalOption)(void);
typedef void(^SuccessOption)(BaseModel * baseModel);
typedef void(^FailureOption)(NSError * error);
typedef void(^ImageOption)(UIImage * image);

// 请求宏
#define httpMethod_POST @"POST"
#define httpMethod_GET @"GET"

@interface NetServiceTool : NSObject

 
  
@end

NS_ASSUME_NONNULL_END
