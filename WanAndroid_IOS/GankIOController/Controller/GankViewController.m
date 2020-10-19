//
//  GankViewController.m
//  WanAndroid_IOS
//
//  Created by 库兹马 on 2020/9/13.
//  Copyright © 2020 kuzima. All rights reserved.
//

#import "GankViewController.h"

@interface GankViewController ()

@end

@implementation GankViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"新闻";
        self.tabBarItem.image = [UIImage imageNamed:@"首页1-1"];
        self.tabBarItem.selectedImage = [UIImage imageNamed:@"首页1"];
        self.navigationController.navigationBar.hidden = YES; 
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
