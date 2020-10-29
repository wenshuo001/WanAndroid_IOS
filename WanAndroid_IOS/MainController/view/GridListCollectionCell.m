//
//  GridListCollectionCell.m
//  WanAndroid_IOS
//
//  Created by 库兹马 on 2020/10/28.
//  Copyright © 2020 kuzima. All rights reserved.
//

#import "GridListCollectionCell.h"
#import "Masonry.h"
#import "GTScreen.h"

@interface GridListCollectionCell()

    @property (nonatomic, strong) UIView *coverImageView;
    @property (nonatomic, strong) UILabel *titleLabelBgView;
     @property (nonatomic, strong) UILabel *nameLabelBgView;
@end

@implementation GridListCollectionCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    [self.contentView addSubview:self.coverImageView];
    [self.contentView addSubview:self.titleLabelView];
    [self.coverImageView addSubview:self.nameLabelView];
    
    [self.coverImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(20);
        make.width.mas_equalTo(countcoordinatesX(40));
        make.height.mas_equalTo(countcoordinatesX(40));
        make.centerX.mas_equalTo(self.contentView);
        //圆的半径是view宽的一半
        self.coverImageView.layer.cornerRadius = countcoordinatesX(40)/2;
        //是否进行剪切
        self.coverImageView.clipsToBounds = YES;
    }];
    
    [self.nameLabelBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.coverImageView);
    }];
    
    [self.titleLabelView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.coverImageView.mas_bottom).offset(countcoordinatesX(10));
        make.width.mas_equalTo(self.contentView.mas_width);
        make.height.mas_equalTo(countcoordinatesX(20));
        make.centerX.mas_equalTo(self.contentView);
    }];
}

- (void)setupData:(WeChatChapters_V1Model *)data {
    self.nameLabelBgView.text = [data.name substringWithRange:NSMakeRange(0,1)];
    self.titleLabelView.text = data.name;
}

// MARK: - Getter

- (UIView *)coverImageView {
    if (!_coverImageView) {
        _coverImageView = [UIView new];
        _coverImageView.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    }
    return _coverImageView;
}

- (UILabel *)nameLabelView {
    if (!_nameLabelBgView) {
        _nameLabelBgView = [UILabel new];
        _nameLabelBgView.textColor = [UIColor whiteColor];
    
        _nameLabelBgView.textAlignment = NSTextAlignmentCenter; //文本居中
    }
    return _nameLabelBgView;
}

- (UILabel *)titleLabelView {
    if (!_titleLabelBgView) {
        _titleLabelBgView = [UILabel new];
        _titleLabelBgView.backgroundColor = [UIColor whiteColor];
        _titleLabelBgView.textColor = [UIColor blackColor];
        _titleLabelBgView.textAlignment = NSTextAlignmentCenter; //文本居中
    }
    return _titleLabelBgView;
}
@end
