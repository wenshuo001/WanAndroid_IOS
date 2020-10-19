//
//  NSString+Calculation.h
//  WanAndroid_IOS
//
//  Created by Wenshuo on 2020/10/11.
//  Copyright © 2020 kuzima. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface  NSString (Calculation)
// 复杂计算公式计算,接口主方法
+ (NSString *)calcComplexFormulaString:(NSString *)formula;
// 利用替换先把重复元素替换掉,再根据length长度做判断
+ (NSInteger )getDuplicateSubStrCountInCompleteStr:(NSString *)completeStr withSubStr:(NSString *)subStr;
@end

NS_ASSUME_NONNULL_END
