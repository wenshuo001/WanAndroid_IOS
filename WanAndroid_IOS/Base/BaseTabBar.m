//
//  BaseTabBar.m
//  WanAndroid_IOS
//
//  Created by Wenshuo on 2020/10/11.
//  Copyright © 2020 kuzima. All rights reserved.
//

#import "BaseTabBar.h"
#import "GTScreen.h"
#import "UIFont+Extension.h"
#import "UIView+BorderLine.h"
#import "UIView+BlockGesture.h"
@interface BaseTabBar()

@property (strong, nonatomic) UIButton *composeButton;
@property (nonatomic, strong) NSMutableArray *views;

@end

@implementation BaseTabBar

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}

-(void)setupUI{
       [self setBackgroundColor:kColor_White]; //设置背景颜色
       [self setShadowLine:[kColor_Text_Gary colorWithAlphaComponent:0.1]];
}

- (void)setShadowLine:(UIColor *)color {
    // 改变tabbar 线条颜色
    [self setShadowImage:({
        CGRect rect = CGRectMake(0, 0, SCREEN_WIDTH, 1);
        UIGraphicsBeginImageContext(rect.size);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, color.CGColor);
        CGContextFillRect(context, rect);
        UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        img;
    })];
    [self setBackgroundImage:[[UIImage alloc] init]];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self views];
    
    for (id obj in self.subviews) {
        if ([obj isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [(UIView *)obj setAlpha:0];
            [(UIView *)obj setUserInteractionEnabled:NO];
        }
    }
}


#pragma mark - 点击
- (void)setIndex:(NSInteger)index {
    _index = index;
    [self click:index];
}


- (void)click:(NSInteger)index {
    NSArray<NSArray *> *image = @[
                                         @[@"首页",@"项目",@"体系",@"我的"],
                                         @[@"icon_menu_home_unsel",
                                           @"icon_menu_project_unsel",
                                           @"icon_menu_system_unsel",
                                           @"icon_menu_mine_unsel"
                                           ],
                                         @[@"icon_menu_home_sel",
                                           @"icon_menu_project_sel",
                                           @"icon_menu_system_sel",
                                           @"icon_menu_mine_sel"
                                          ]
                                         ];
    for (int y=0; y<self.views.count; y++) {
        UIView *subview = self.views[y];
        UIImageView *subicon = [subview viewWithTag:10];
        subicon.image = [UIImage imageNamed:y == index ? image[2][y] : image[1][y]];
        UILabel *sublab = [subview viewWithTag:11];
        sublab.textColor = y == index ? kColor_Text_Gary : kColor_Text_Gary;
        sublab.text = image[0][y];
    }
    
    
    UIImageView *icn = [_views[index] viewWithTag:10];
    [UIView animateWithDuration:0.1f delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        icn.transform = CGAffineTransformMakeScale(1.1, 1.1);
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.8f delay:0 usingSpringWithDamping:0.2 initialSpringVelocity:10.0 options:UIViewAnimationOptionTransitionFlipFromTop animations:^{
            icn.transform = CGAffineTransformMakeScale(1.0, 1.0);
        } completion:^(BOOL finished) {
            
        }];
    }];
    
}

#pragma mark - get
- (NSMutableArray *)views {
    if (!_views) {
        _views = [[NSMutableArray alloc] init];
    
        NSArray<NSArray *> *image = @[
                                      @[@"首页",@"项目",@"体系",@"我的"],
                                      @[@"icon_menu_home_unsel",
                                        @"icon_menu_project_unsel",
                                        @"icon_menu_system_unsel",
                                        @"icon_menu_mine_unsel"
                                        ],
                                      @[@"icon_menu_home_sel",
                                        @"icon_menu_project_sel",
                                        @"icon_menu_system_sel",
                                        @"icon_menu_mine_sel"
                                       ]
                                      ];
        NSInteger current = 0;
        NSInteger count = [image[0] count];
        for (int i=0; i<count; i++) {
            CGFloat width = SCREEN_WIDTH / count;
            UIImageView *icon = ({
                UIImageView *icon = [[UIImageView alloc] initWithFrame:({
                    CGRect frame;
          
                    frame = CGRectMake((width - 23) / 2, 7, 23, 23);
//                    if (i != 2) {
//                        frame = CGRectMake((width - 23) / 2, 7, 23, 23);
//                    }
//                    else {
//                        frame = CGRectMake(0, 0, width, 60);
//                    }
                    frame;
                })];
                icon.image = [UIImage imageNamed:current == i ? image[2][i] : image[1][i]];
                icon.contentMode = UIViewContentModeScaleAspectFit;
                icon.tag = 10;
                icon;
            });
            
            UILabel *lab = ({
                UILabel *lab = [[UILabel alloc] initWithFrame:({
                    CGRectMake(0, CGRectGetMaxY(icon.frame) + 1, width, 15);
                })];
                lab.text = image[0][i];
                lab.font = [UIFont boldSystemFontOfSize:AdjustFont(8)];
                lab.textColor = current == i ? kColor_Text_Gary : kColor_Text_Gary;
                lab.textAlignment = NSTextAlignmentCenter;
                lab.tag = 11;
                lab;
            });
            
            UIView *itemView = ({
                UIView *itemView = [[UIView alloc] initWithFrame:({
                    CGFloat left = width * i;
                    CGRect frame;
                    frame = CGRectMake(left, 0, width, TabbarHeight);

//                    if (i != 2) {
//                        frame = CGRectMake(left, 0, width, TabbarHeight);
//                    }
//                    else {
//                        frame = CGRectMake(left, -30, width, TabbarHeight + 30);
//                    }
                    frame;
                })];
                [itemView addSubview:icon];
                [itemView addSubview:lab];
                itemView;
            });
            [self addSubview:itemView];
            [_views addObject:itemView];
            
            __weak typeof(self) weak = self;
            [itemView addTapActionWithBlock:^(UIGestureRecognizer *gestureRecoginzer) {
                if (weak.click) {
                    weak.click(i);
                }
            }];
        }
    }
    return _views;
}


//移除通知
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

@end
