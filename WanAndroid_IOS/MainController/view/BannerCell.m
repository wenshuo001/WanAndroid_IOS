//
//  BannerCell.m
//  WanAndroid_IOS
//
//  Created by 库兹马 on 2020/10/22.
//  Copyright © 2020 kuzima. All rights reserved.
//

#import "BannerCell.h"
#import "GTScreen.h"
#import "SDCycleScrollView.h"
#import "BannerModel.h"

@interface BannerCell()<SDCycleScrollViewDelegate>

@property (nonatomic,strong) NSArray *temp;
// 网络图片
@property (nonatomic, strong) SDCycleScrollView * webCycleScrollView;

@end


@implementation BannerCell

+ (instancetype)cellWithTableview:(UITableView *)tableview BannerModel:(BannerModel *)model
{
    static NSString *identifier = @"banner";
    BannerCell *cell = [tableview dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil)
    {
        cell = [[BannerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        //    设置model后再进行UI布局
        cell.model = model;
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    [cell webCycleScrollView];
    [cell webImage];
    return cell;
}



// 点击图片代理方法
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
{
    NSLog(@"---点击了第%ld张图片", (long)index);
    // 清理缓存
    [SDCycleScrollView clearImagesCache];
    
}


// 滚动到第几张图片的回调
-(void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index
{
    NSLog(@">>>>>> 滚动到第%ld张图", (long)index);
}

- (void)webImage
{
    
    UILabel *lable = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 200)];
    lable.backgroundColor = [UIColor redColor];
    // [self.contentView addSubview: lable];
    [self.contentView addSubview:self.webCycleScrollView];
    
}


- (SDCycleScrollView *)webCycleScrollView
{
    if (!_webCycleScrollView)
    {
        self.webCycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, countcoordinatesX(220)) delegate:self placeholderImage:[UIImage imageNamed:@"loginbackground"]];
        
        // 分页控件的位置
        self.webCycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        
        
        
        
        // 网络图片数组
        NSMutableArray *titleList = [NSMutableArray array];
        NSMutableArray *imageList = [NSMutableArray array];
        if(self.model != nil){
            for(V1_BannerModel *model in self.model.data){
                [imageList addObject:model.imagePath];
                [titleList addObject:model.title];
            }
            self.webCycleScrollView.titlesGroup =titleList;
            self.webCycleScrollView.imageURLStringsGroup = imageList;
        }else{
            NSArray *images = @[
                
                @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1579082232413&di=2775dc6e781e712d518bf1cf7a1e675e&imgtype=0&src=http%3A%2F%2Fimg3.doubanio.com%2Fview%2Fnote%2Fl%2Fpublic%2Fp41813904.jpg",
                @"http://photos.tuchong.com/285606/f/4374153.jpg",
                @"https://ss0.bdstatic.com/70cFvHSh_Q1YnxGkpoWK1HF6hhy/it/u=2791659266,2306116334&fm=26&gp=0.jpg",
                
            ];
            // 标题
             self.webCycleScrollView.titlesGroup = @[@"1",@"2",@"3"];
          
            self.webCycleScrollView.imageURLStringsGroup = images;
        }
        
        
    }
    return _webCycleScrollView;
}






#pragma mark - KJBannerViewDelegate





@end
