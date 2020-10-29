//
//  MainViewController.m
//  WanAndroid_IOS
//
//  Created by 库兹马 on 2020/9/13.
//  Copyright © 2020 kuzima. All rights reserved.
//
#import <UserNotifications/UserNotifications.h>
#import "MainViewController.h"
#import "GTNotifitionManager.h"
#import "UINavigationController+JZExtension.h"
#import "JZNavigationExtension.h"
#import <UIKit/UIKit.h>
#import "MJRefresh.h"
#import "BannerCell.h"
#import "AFHTTPSessionManager.h"
#import "GTScreen.h"
#import "BannerModel.h"
#import "WeChatChaptersModel.h"
#import "PageCellTableViewCell.h"

#import <objc/message.h>

@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>
//页面内容table
@property (nonatomic, strong) UITableView *newsTableView;

@property (nonatomic, strong) BannerModel *bannerModel;
@property (nonatomic, strong) WeChatChaptersModel *weChatChaptersModel;

@property(nonatomic, assign) NSUInteger pageCount; //分页数
@end

@implementation MainViewController



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //使用GCD获取一个非主线程的线程用于发送通知
    [GTNotifitionManager.notificationManager checkNotificationAuthorization];
    //   [self addLocalNotice];
    self.navigationController.jz_navigationBarHidden = true; //隐藏标题栏和状态栏
    [self setupView];
    
    NSArray *indexpaths = @[[NSIndexPath indexPathForRow:0 inSection:0]];
    
    [[AFHTTPSessionManager manager] GET:@"https://www.wanandroid.com/banner/json" parameters:nil  headers:nil  progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self.bannerModel = [BannerModel mj_objectWithKeyValues: responseObject];
        [self.newsTableView reloadRowsAtIndexPaths:indexpaths withRowAnimation:UITableViewRowAnimationNone];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"");
    }];
    //公众号列表
    [[AFHTTPSessionManager manager] GET:@"https://wanandroid.com/wxarticle/chapters/json" parameters:nil  headers:nil  progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self.weChatChaptersModel = [WeChatChaptersModel mj_objectWithKeyValues: responseObject];
        _pageCount = self.weChatChaptersModel.data.count;
        NSArray *indexpaths = @[[NSIndexPath indexPathForRow:1 inSection:0]];
        [self.newsTableView reloadRowsAtIndexPaths:indexpaths withRowAnimation:UITableViewRowAnimationNone];
        [self initPageView];
        NSLog(@"");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"");
    }];
}

-(void) initPageView{
    
}

-(void) setupView{
    if (NSFoundationVersionNumber>=NSFoundationVersionNumber_iOS_8_0) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        
        self.extendedLayoutIncludesOpaqueBars = NO;
        
        self.modalPresentationCapturesStatusBarAppearance = NO;
        
        self.automaticallyAdjustsScrollViewInsets=NO;
    }
    //初始化TableView
    UITableView *news = [[UITableView alloc] initWithFrame:CGRectMake(0, -44, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    news.delegate = self;
    news.dataSource = self;
    news.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:news];
    //设置 cell 的分割线
    news.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.newsTableView = news;
    
    //初始化下拉刷新
    // 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
    __weak __typeof(self) weakSelf = self;
    self.newsTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        //进行数据刷新操作
    }];
    
    //初始化上拉加载
    // 设置回调（一旦进入刷新状态就会调用这个refreshingBlock）
    self.newsTableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
    }];
}

#pragma mark - UItableView

//设置表格视图有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

// 设置有几组
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

// 设置行高
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0)
    {
        return countcoordinatesX(220);
    }
    if (indexPath.row == 1)
    {
        return countcoordinatesX(220);
    }
    return 100;
}

//设置 cell 视图
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.row == 0)
    {
        // AdsModel *model = [self.adsData objectAtIndex:0];
        BannerCell *cell = [BannerCell cellWithTableview:tableView BannerModel:self.bannerModel];
        return cell;
    }
    if (indexPath.row == 1)
    {
        // AdsModel *model = [self.adsData objectAtIndex:0];
        PageCellTableViewCell *cell = [PageCellTableViewCell cellWithTableview:tableView WeChatChaptersModel:self.weChatChaptersModel];
        
        return cell;
    }
    UITableViewCell * cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"id"];
    }
    
    cell.textLabel.text = @"主标题";
    cell.detailTextLabel.text = @"副标题";
    
    return cell;
}

#pragma mark - 发送通知
- (void)addLocalNotice {
    if (@available(iOS 10.0, *)) {
        UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
        UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
        // 标题
        content.title = @"测试标题";
        content.subtitle = @"测试通知副标题";
        // 内容
        content.body = @"测试通知的具体内容";
        // 声音
        // 默认声音
        //    content.sound = [UNNotificationSound defaultSound];
        // 添加自定义声音
        content.sound = [UNNotificationSound soundNamed:@"Alert_ActivityGoalAttained_Salient_Haptic.caf"];
        // 角标 （我这里测试的角标无效，暂时没找到原因）
        content.badge = @1;
        // 多少秒后发送,可以将固定的日期转化为时间
        NSTimeInterval time = [[NSDate dateWithTimeIntervalSinceNow:10] timeIntervalSinceNow];
        //        NSTimeInterval time = 10;
        // repeats，是否重复，如果重复的话时间必须大于60s，要不会报错
        UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:time repeats:NO];
        
        /*
         //如果想重复可以使用这个,按日期
         // 周一早上 8：00 上班
         NSDateComponents *components = [[NSDateComponents alloc] init];
         // 注意，weekday默认是从周日开始
         components.weekday = 2;
         components.hour = 8;
         UNCalendarNotificationTrigger *calendarTrigger = [UNCalendarNotificationTrigger triggerWithDateMatchingComponents:components repeats:YES];
         */
        // 添加通知的标识符，可以用于移除，更新等操作
        NSString *identifier = @"noticeId";
        UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:identifier content:content trigger:trigger];
        
        [center addNotificationRequest:request withCompletionHandler:^(NSError *_Nullable error) {
            NSLog(@"成功添加推送");
        }];
    }else {
        UILocalNotification *notif = [[UILocalNotification alloc] init];
        // 发出推送的日期
        notif.fireDate = [NSDate dateWithTimeIntervalSinceNow:10];
        // 推送的内容
        notif.alertBody = @"你已经10秒没出现了";
        // 可以添加特定信息
        notif.userInfo = @{@"noticeId":@"00001"};
        // 角标
        notif.applicationIconBadgeNumber = 1;
        // 提示音
        notif.soundName = UILocalNotificationDefaultSoundName;
        // 每周循环提醒
        notif.repeatInterval = NSCalendarUnitWeekOfYear;
        
        [[UIApplication sharedApplication] scheduleLocalNotification:notif];
    }
}


@end
