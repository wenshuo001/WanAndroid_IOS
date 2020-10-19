//
//  BaseTabBarController.m
//  WanAndroid_IOS
//
//  Created by Wenshuo on 2020/10/11.
//  Copyright © 2020 kuzima. All rights reserved.
//

#import "BaseTabBarController.h"
#import "BaseTabBar.h"
#import "MainViewController.h"
#import "GankViewController.h"
#import "CenterViewController.h"
#import "BaseNavigationController.h"
#import "BaseViewController.h"

@interface BaseTabBarController()
@property (nonatomic, strong) BaseTabBar *bar;
@end

@implementation BaseTabBarController

-(void)viewDidLoad{
    [super viewDidLoad];
    MainViewController *home = [[MainViewController alloc] init];
    [self addChildViewController:home title:@"首页" image:@"icon_menu_home_unsel" selImage:@"icon_menu_home_sel"];
    
    GankViewController *prject = [[GankViewController alloc] init];
    [self addChildViewController:prject title:@"项目" image:@"icon_menu_project_unsel" selImage:@"icon_menu_project_sel"];
    
    CenterViewController *system = [[CenterViewController alloc] init];
    [self addChildViewController:system title:@"体系" image:@"icon_menu_system_unsel" selImage:@"icon_menu_system_sel"];
    
    CenterViewController *mine = [[CenterViewController alloc] init];
    [self addChildViewController:mine title:@"我的" image:@"icon_menu_mine_unsel" selImage:@"icon_menu_mine_sel"];
}


- (void)addChildViewController:(BaseViewController *)childVc title:(NSString *)title image:(NSString *)image selImage:(NSString *)selImage {
    static NSInteger index = 0;
    childVc.tabBarItem.title = title;
    childVc.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage = [[UIImage imageNamed:selImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.tag = index;
    childVc.navTitle = title;
    
    
    index++;
    
    // 让子控制器包装一个导航控制器
    BaseNavigationController *nav = [[BaseNavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
}

#pragma mark - 系统
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
     [self bar];
}

#pragma mark - get 自定义Bar
- (BaseTabBar *)bar {
    if (!_bar) {
        
        for (UIView *view in self.tabBar.subviews) {
            [view removeFromSuperview];
        }
        _bar = [[BaseTabBar alloc] init];
        [_bar setClick:^(NSInteger index) {
            [self setSelectedIndex:index];
            [self.bar setIndex:index];
        }];
        [self setValue:_bar forKey:@"tabBar"];
    }
    return _bar;
}

@end
