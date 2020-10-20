//
//  BaseViewController.m
//  WanAndroid_IOS
//
//  Created by Wenshuo on 2020/10/11.
//  Copyright © 2020 kuzima. All rights reserved.
//

#import "BaseViewController.h"
#import "GTScreen.h"
#import "UINavigationController+JZExtension.h"
#import "MainViewController.h"
#import "GankViewController.h"
#import "CenterViewController.h"
#import "BaseNavigationController.h"
#import "NSString+Calculation.h"
#import "NSString+Extension.h"
#import "BaseNavigationController+Extension.h"

#pragma mark - enum
typedef NS_ENUM(NSInteger, BarButtonItemState) {
    BarButtonItemStateLeft,     // 文字居左
    BarButtonItemStateRight,    // 文字居右
};

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.navigationController setJz_navigationBarTransitionStyle:JZNavigationBarTransitionStyleSystem];
    [self.navigationController.interactivePopGestureRecognizer setEnabled:YES];
    [self.view setBackgroundColor:kColor_BG];
    [self initUI];
    for (id obj in self.navigationController.navigationBar.subviews) {
        if ([obj isKindOfClass:NSClassFromString(@"_UINavigationBarContentView")]) {
            UIView *hook = [(BaseNavigationController *)self.navigationController hook_background];
            [self.navigationController.navigationBar insertSubview:hook belowSubview:obj];
        }
    }
}
- (void)initUI {
    [self setLeftBtn];
    [self setRightBtn];
}
- (void)setNavTitle:(NSString *)navTitle {
    _navTitle = navTitle;
    UIFont *font = [UIFont systemFontOfSize:AdjustFont(16)];
    CGSize maxSize = [navTitle sizeWithMaxSize:CGSizeMake(MAXFLOAT, 0) font:font];
    UIButton *btn = ({
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn.titleLabel setFont:font];
        [btn setFrame:CGRectMake(0, 0, maxSize.width, 40)];
        [btn setTitleColor:kColor_Text_Black forState:UIControlStateNormal];
        [btn setTitle:navTitle forState:UIControlStateNormal];
        btn;
    });
    self.navigationItem.titleView = btn;
}


#pragma mark - 点击
// 点击了返回按钮
- (void)leftButtonClick {
    if ([self.navigationController popViewControllerAnimated:YES] == nil) {
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }
}
// 点击了右侧按钮
- (void)rightButtonClick {
    
}


#pragma mark - set
// 设置返回按钮
- (void)setLeftBtn {
    UIButton *btn = ({
        UIButton *btn = [UIButton new];
        [btn setImage:[UIImage imageNamed:@"nav_back_n"] forState:UIControlStateNormal];
        [btn setImage:[UIImage imageNamed:@"nav_back_n"] forState:UIControlStateHighlighted];
        [btn.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [btn addTarget:self action:@selector(leftButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [btn setFrame:CGRectMake(0, 0, 40, 40)];
        [btn setContentMode:UIViewContentModeLeft];
        [btn setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
        [btn setContentEdgeInsets:UIEdgeInsetsMake(8, -4, 8, 16)];
        btn;
    });
    UIBarButtonItem *barBtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.leftBarButtonItem = barBtn;
    self.leftButton = btn;
    
    
    
    
    if ([self isKindOfClass:[MainViewController class]] ||
        [self isKindOfClass:[GankViewController class]] ||
        [self isKindOfClass:[CenterViewController class]] ||
        [self isKindOfClass:[CenterViewController class]]
        ) {
        self.leftButton.hidden = YES;
    } else {
        self.leftButton.hidden = NO;
    }
    
}
// 设置右侧按钮
- (void)setRightBtn {
    UIButton *btn = ({
        UIButton *btn = [UIButton new];
        [btn.imageView setContentMode:UIViewContentModeScaleAspectFit];
        [btn addTarget:self action:@selector(rightButtonClick) forControlEvents:UIControlEventTouchUpInside];
        [btn setContentEdgeInsets:UIEdgeInsetsMake(8, 16, 8, -4)];
        [btn setTitleColor:kColor_Text_Black forState:UIControlStateNormal];
        [btn setTitleColor:kColor_Text_Black forState:UIControlStateSelected];
        [btn sizeToFit];
        btn;
    });
    UIBarButtonItem *barBtn = [[UIBarButtonItem alloc] initWithCustomView:btn];
    self.navigationItem.rightBarButtonItem = barBtn;
    self.rightButton = btn;
    self.rightButton.titleLabel.font = [UIFont systemFontOfSize:AdjustFont(14)];
    self.rightButton.hidden = YES;
}



#pragma mark - 线条
- (void)hideNavigationBarLine {
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}
- (void)showNavigationBarLine {
    [self.navigationController.navigationBar setShadowImage:nil];
}


#pragma mark - 系统
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self hideNavigationBarLine];
}

- (void)dealloc {
    // 这里和EventBus 类似 在Controller 销毁的时候清除通知
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
