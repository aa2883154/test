//
//  HomeNewsCell.m
//  TianYuanData
//
//  Created by 天元数科 on 16/5/24.
//  Copyright © 2016年 天元数科. All rights reserved.
//

#import "HomeNewsCell.h"
#import "HomeNewsModel.h"
#import "HomeNewsCache.h"

#import "UIImageView+WebCache.h"
#import "SDCycleScrollView.h"

@interface HomeNewsCell()<SDCycleScrollViewDelegate>

//轮播图片
//@property (weak, nonatomic) IBOutlet UIView *cycleImageView;
////摘要信息
//@property (weak, nonatomic) IBOutlet UILabel *digestLabel;
////回复数量
//@property (weak, nonatomic) IBOutlet UILabel *replyLabel;
//图片所在位置
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;
//大图
//@property (weak, nonatomic) IBOutlet UIImageView *bigImage;
//二张图片 三张图片
@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *imgextras;

@end

@implementation HomeNewsCell
-(void)setNewsModel:(HomeNewsModel *)newsModel
{
   _newsModel = newsModel;
    //设置图片轮播
//  [self setupCycleImageCell:newsModel];
    //标题
    self.title.text = newsModel.title;
    
    if ([[HomeNewsCache sharedInstance] containsObject:self.title.text]) {
        self.title.textColor = [UIColor redColor];
    } else {
        self.title.textColor = [UIColor redColor];
    }
    //回复次数
//    self.digestLabel.text = newsModel.digest;
//    //跟帖数
//    CGFloat count = newsModel.replyCount;
//    if (count > 10000) {self.replyLabel.text = [NSString stringWithFormat:@"%.1f万跟帖", count/10000.f];
//    }else{
//        self.replyLabel.text = [NSString stringWithFormat:@"%.0f跟帖", count];
//    }
    
    //单张图片 左图 右字的第一张
//    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:newsModel.imgsrc]
//                      placeholderImage:[UIImage imageNamed:@""]];
    [self.iconImage sd_setImageWithURL:[NSURL URLWithString:newsModel.imgsrc]
                      placeholderImage:[UIImage imageNamed:@"tabbar_home_selected"]
                               options:SDWebImageDelayPlaceholder
                             completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                 if (cacheType == 1 || cacheType == 2) {return;} // 0新下载，1磁盘缓存，2内存缓存
                                 self.iconImage.alpha = 0;
                                 [UIView animateWithDuration:0.5 animations:^{
                                     self.iconImage.alpha = 1;
                                 }];
                             }
     ];

    if (newsModel.imgextra.count == 2) {
        for (int i = 0; i < 2; i++) {
            UIImageView *imageView = self.imgextras[i];
            [imageView sd_setImageWithURL:[NSURL URLWithString:newsModel.imgextra[i][@"imgsrc"]]
                         placeholderImage:[UIImage imageNamed:@"tabbar_home_selected"]
                                  options:SDWebImageDelayPlaceholder
                                completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
                                    if (cacheType == 1 || cacheType == 2) {return;} // 0新下载，1磁盘缓存，2内存缓存
                                    imageView.alpha = 0;
                                    [UIView animateWithDuration:0.5 animations:^{
                                        imageView.alpha = 1;
                                    }];
                                }];
        }
    }
    
//    [self.bigImage sd_setImageWithURL:[NSURL URLWithString:newsModel.imgsrc]
//                     placeholderImage:[UIImage imageNamed:@"tabbar_home_selected"]
//                              options:SDWebImageDelayPlaceholder
//                            completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
//                                if (cacheType == 1 || cacheType == 2) {return;} // 0新下载，1磁盘缓存，2内存缓存
//                                self.bigImage.alpha = 0;
//                                [UIView animateWithDuration:0.5 animations:^{
//                                    self.bigImage.alpha = 1;
//                                }];
//                            }
//     ];

}

//设置图片轮播
//-(void)setupCycleImageCell:(HomeNewsModel *)newsModel
//{
//    // 网络加载 --- 创建带标题的图片轮播器
//    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:self.cycleImageView.bounds delegate:nil placeholderImage:[UIImage imageNamed:@""]];
//    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
//    cycleScrollView.currentPageDotColor = [UIColor whiteColor];
//    
//    cycleScrollView.titlesGroup = ({
//        NSMutableArray *titleArrayM = [NSMutableArray array];
//        for (int i = 0; i < newsModel.ads.count; i++) {
//            [titleArrayM addObject:newsModel.ads[i][@"title"]];
//        }
//        titleArrayM;
//    });
//    
//    cycleScrollView.imageURLStringsGroup = ({
//        NSMutableArray *urlArrayM = [NSMutableArray array];
//        for (int i = 0; i < newsModel.ads.count; i++) {
//            [urlArrayM addObject:newsModel.ads[i][@"imgsrc"]];
//        }
//        urlArrayM;
//    });
//    
//    [self.cycleImageView addSubview:cycleScrollView];
//    cycleScrollView.delegate = self;
//}

/** SDCycleScrollView轮播点击事件代理 */
//- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index
//{
//    NSAssert(self.cycleImageClickBlock, @"必须传入self.cycleImageClickBlock");
//    self.cycleImageClickBlock(index);
//}

#pragma mark - cell相关
+(NSString *)cellReuseID:(HomeNewsModel *)newsModel
{
    // 接口中，ads 和 imgextra 可能共同出现，所以有ads的就直接弄成轮播。
//    if (newsModel.ads) {
//        return @"NewsCycleImageCell"; // 轮播
//    } else
        if (newsModel.imgextra.count == 2) { //	if (newsModel.photosetID) {
        return @"News3imageCell"; // 三图
    }
//        else if (newsModel.imgType) {
//        return @"NewsBigImageCell"; // 大图
//    }
    else {
        return @"News_L_img_R_text_Cell"; // 左图右字
    }
}

+(CGFloat)cellForHeight:(HomeNewsModel *)newsModel
{
//    if (newsModel.ads) {
//        return 200;
//    } else
        if (newsModel.imgextra.count == 2) { //	if (newsModel.photosetID) {
        return 140;
    }
//        else if (newsModel.imgType) {
//        return 180;
//    }
    else {
        return 80;
    }

}
@end
