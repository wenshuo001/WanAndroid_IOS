//
//  PageCellTableViewCell.m
//  WanAndroid_IOS
//
//  Created by 库兹马 on 2020/10/26.
//  Copyright © 2020 kuzima. All rights reserved.
//
#import "PageCellTableViewCell.h"
#import "BCCollectionViewHorizontalLayout.h"
#import "GTScreen.h"
#import "GridListCollectionCell.h"
#import "Masonry.h"

@interface PageCellTableViewCell()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *mianCollView;
@property (nonatomic, strong) UIPageControl *page;
@property (nonatomic, strong) BCCollectionViewHorizontalLayout *layout2;
@property(nonatomic, assign) NSUInteger pageCount;
@property (nonatomic,strong) NSArray *weCahtData;

@end

@implementation PageCellTableViewCell

+ (instancetype)cellWithTableview:(UITableView *)tableview WeChatChaptersModel:(WeChatChaptersModel *)model{
    static NSString *identifier = @"WeChatChaptersModel";
    PageCellTableViewCell *cell = [tableview dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[PageCellTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        //设置model后再进行UI布局
        cell.model = model;
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell layoutViews];
    return cell;
}

-(void) layoutViews{
    
    _pageCount = self.model.data.count;
    self.page = [UIPageControl new];
    //一排显示3个,3排就是9个
     while (_pageCount % 10 != 0) {
           ++_pageCount;
           NSLog(@"66666=====%zd", _pageCount);
    }
    self.page.numberOfPages = _pageCount / 10.0; //获取点
    _page.currentPage = 0;
    _page.pageIndicatorTintColor = [UIColor lightGrayColor];
    _page.currentPageIndicatorTintColor = [UIColor orangeColor];
     
    [_page addTarget:self action:@selector(scrollViewDidScroll) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview: _page];
    
    _layout2  = [[BCCollectionViewHorizontalLayout alloc ] init];
    
    _layout2.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    _layout2.itemSize = CGSizeMake(SCREEN_WIDTH/5, countcoordinatesX(200)/2);
    _layout2.minimumInteritemSpacing = 0 ;
    _layout2.minimumLineSpacing = 0;
    _layout2.headerReferenceSize = CGSizeMake(0, 0);
    
    _mianCollView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, countcoordinatesX(200)) collectionViewLayout:_layout2];
    _mianCollView.backgroundColor = [UIColor whiteColor];
    _mianCollView.pagingEnabled = YES;
     
    _mianCollView.delegate = self;
    _mianCollView.dataSource = self;
    
    [_mianCollView registerClass:[GridListCollectionCell class] forCellWithReuseIdentifier:@"GridListCell"];
    [self.contentView addSubview: _mianCollView];
    //指示点
    [self.page mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(countcoordinatesX(100));
        make.height.mas_equalTo(countcoordinatesX(10));
        make.top.mas_equalTo(countcoordinatesX(201));
        make.centerX.mas_equalTo(self.contentView);
        
    }];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.model.data.count;
}

// 设置流式具体布局
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    GridListCollectionCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GridListCell" forIndexPath:indexPath];
    [cell setupData:self.model.data[indexPath.row]];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView*)scrollView
{
    
    //获得页码
    CGFloat doublePage = _mianCollView.contentOffset.x/SCREEN_WIDTH;
    int intPage = (int)(doublePage +0.5);
    //设置页码
    self.page.currentPage= intPage;
}

// 设置 item 大小  如果一行放的下俩个会放俩个 ，放不下则换行
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    if(indexPath.item %3 == 0){
//        return CGSizeMake(self.view.frame.size.width, 100);
//    }else{
//        return CGSizeMake((self.view.frame.size.width-10)/2 , 200);
//    }
//}

@end
