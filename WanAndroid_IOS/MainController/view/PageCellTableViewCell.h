//
//  PageCellTableViewCell.h
//  WanAndroid_IOS
//
//  Created by 库兹马 on 2020/10/26.
//  Copyright © 2020 kuzima. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WeChatChaptersModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface PageCellTableViewCell : UITableViewCell

   + (instancetype)cellWithTableview:(UITableView *)tableview WeChatChaptersModel:(WeChatChaptersModel *)model;

   @property (nonatomic, strong) WeChatChaptersModel *model;
@end

NS_ASSUME_NONNULL_END
