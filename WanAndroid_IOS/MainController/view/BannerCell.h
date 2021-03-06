//
//  BannerCell.h
//  WanAndroid_IOS
//
//  Created by 库兹马 on 2020/10/22.
//  Copyright © 2020 kuzima. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "BannerModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface BannerCell : UITableViewCell

 + (instancetype)cellWithTableview:(UITableView *)tableview BannerModel:(BannerModel *)model;

@property (nonatomic, strong) BannerModel *model;
@end

NS_ASSUME_NONNULL_END
