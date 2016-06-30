//
//  HomeNewsTVC.m
//  TianYuanData
//
//  Created by 天元数科 on 16/5/24.
//  Copyright © 2016年 天元数科. All rights reserved.
//

#import "HomeNewsTVC.h"
#import "HomeNewsCell.h"
#import "HomeNewsModel.h"
#import "HomeNewsCache.h"

//#import "HomePhotoDetailViewController.h"
//#import "HomeNewsDetailViewController.h"

#import "MJRefresh.h"
#import "UIView+Extension.h"

#import "NewsDetailController.h"

@interface HomeNewsTVC ()
@property(nonatomic)NSMutableArray *dataList;
@end

@implementation HomeNewsTVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // 把小菊花漏出来
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 50, 0);
    __weak typeof(self) weakSelf = self;
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf refreshData];
    }];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [weakSelf loadMoreData];
    }];
    // 去除刷新前的横线
    UIView*view = [UIView new];
    view.backgroundColor= [UIColor clearColor];
    [self.tableView setTableFooterView:view];
    //通知
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(enterBackGround)
                                                 name:UIApplicationDidEnterBackgroundNotification
                                               object:nil];
}

-(void)setUrlString:(NSString *)urlString
{
    _urlString = urlString;
    
    [HomeNewsModel newsDataListWithUrlString:urlString complection:^(NSMutableArray *array) {
        _dataList  = array;
        [self.tableView reloadData];
    }];
    
    if ([[HomeNewsCache sharedInstance] containsObject:urlString]) {
        return;
    }else {
        [[HomeNewsCache sharedInstance]addObject:urlString];
        [self.tableView.mj_header beginRefreshing];
    }
}

//上拉加载更多
-(void)loadMoreData
{
    // 获取tid来拼接urlString
    NSString *tid = [self.urlString substringWithRange:NSMakeRange(17, 14)];
    // 让前面的数字是20的整数倍，多出来的 减去 模剩下的，正好是20的整数倍。
    NSString *urlString = [NSString stringWithFormat:@"article/headline/%@/%zd-20.html" ,tid, self.dataList.count - self.dataList.count % 20];
    //		NSLog(@"```%zd", self.dataList.count - self.dataList.count % 20);
    [HomeNewsModel newsDataListWithUrlString:urlString complection:^(NSArray *array) {
        [self.dataList addObjectsFromArray:array];
        [self.tableView reloadData];
        [self.tableView.mj_footer endRefreshing];
    }];
}

//下拉刷新
-(void)refreshData
{
    // 获取tid来拼接urlString
    NSString *tid = [self.urlString substringWithRange:NSMakeRange(17, 14)];
    NSString *urlString = [NSString stringWithFormat:@"article/headline/%@/0-20.html" ,tid];
    [HomeNewsModel newsDataListWithUrlString:urlString complection:^(NSMutableArray *array) {
        self.dataList = array;
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
    }];
}

-(void)enterBackGround
{
    [[HomeNewsCache sharedInstance] removeAllObjects];
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//
//    return 0;
//}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _dataList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HomeNewsModel *newsModel = self.dataList[indexPath.row];
    HomeNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:[HomeNewsCell cellReuseID:newsModel] forIndexPath:indexPath];
    cell.newsModel = newsModel;
//   [self setupCycleImageClickWithCell:cell newsModel:newsModel];
    return cell;
}

//点击轮播图片事件
//-(void)setupCycleImageClickWithCell:(HomeNewsCell *)cell newsModel:(HomeNewsModel *)newsModel
//{
//    cell.cycleImageClickBlock = ^(NSInteger idx){
//        // 进入后是图片详情："tag": "photoset", "url": "00AJ0003|591287"
//        // 进入后是新闻详情："tag": "doc",      "url": "BH7H123N00094P0U"
//        
//        NSString *tag = newsModel.ads[idx][@"tag"];
//        NSString *url = newsModel.ads[idx][@"url"];
//        
//        if ([tag isEqualToString:@"photoset"]) {
//            HomePhotoDetailViewController *photoVC = [[HomePhotoDetailViewController alloc] initWithPhotosetID:url];
//            
//            photoVC.replyCount = newsModel.replyCount;
//            photoVC.wantsNavigationBarVisible = NO;
//            photoVC.hidesBottomBarWhenPushed = YES;
//            
//            [self.navigationController pushViewController:photoVC animated:YES];
//        } else {
//            // newsModel.url -> "url": "http://3g.163.com/tech/16/0317/05/BIBB5271000915BD.html",
//            // newsModel.ads[idx][@"url"] -> "url": "BH7H123N00094P0U"
//            // 以上原因，newsModel.ads[idx][@"url"]返回的不是完整url，所以需要截取替换。
//            //			NSLog(@"url = %@", url);
//            //			NSLog(@"full url = %@", newsModel.url);
//            // 栗子：newsModel.ads[idx][@"url"] =					   	   BI3LFDEL00253B0H
//            // 栗子：newsModel.url = http://3g.163.com/money/16/0317/17/BICJ2C5P002534NU.html
//            // 16位 + ".html" = 21位，将newsModel.url总长度-21，获取直到/及前面的所有字符
//            NSString *str = [newsModel.url substringToIndex:newsModel.url.length - 21];
//            //			NSLog(@"str = %@", str); // 成功获取到http://3g.163.com/money/16/0317/17/
//            NSString *finalStr = [NSString stringWithFormat:@"%@%@.html", str, url]; // 拼接完成
//            
//            DDNewsDetailController *NewsDetailC = [[DDNewsDetailController alloc] initWithUrlString:finalStr];
//            NewsDetailC.hidesBottomBarWhenPushed = YES;
//            [self.navigationController pushViewController:NewsDetailC animated:YES];
//        }
//    };
//
//}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeNewsModel *newsModel = self.dataList[indexPath.row
                                             ];
    return [HomeNewsCell cellForHeight:newsModel];
}

#pragma mark - 新闻的点击事件
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeNewsCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.title.textColor = [UIColor redColor];
    [[HomeNewsCache sharedInstance] addObject:cell.title.text];
    
//    HomeNewsModel *newsModel = self.dataList[indexPath.row];
//    NewsDetailController *news = [[NewsDetailController alloc]initWithUrlString:newsModel.url];
    NewsDetailController *news = [[NewsDetailController alloc]init];
    news.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:news animated:YES];
}

//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    HomeNewsCell *cell = [tableView cellForRowAtIndexPath:indexPath];
//    cell.title.textColor = [UIColor lightGrayColor];
//    [[HomeNewsCache sharedInstance] addObject:cell.title.text];
//    
//    HomeNewsModel *newsModel = self.dataList[indexPath.row];
//    
//    if (newsModel.photosetID) {
//        DDPhotoDetailController *photoVC = [[DDPhotoDetailController alloc] initWithPhotosetID:newsModel.photosetID];
//        photoVC.replyCount = newsModel.replyCount;
//        photoVC.wantsNavigationBarVisible = NO;
//        photoVC.hidesBottomBarWhenPushed = YES;
//        [self.navigationController pushViewController:photoVC animated:YES];
//    } else {
//        // NSLog(@"newsModel.url = %@", newsModel.url); // http://3g.163.com/ntes/16/0315/21/BI7TE54L00963VRO.html
//        // NSLog(@"newsModel.docid = %@", newsModel.docid); // BI7TE54L00963VRO
//        DDNewsDetailController *NewsDetailC = [[DDNewsDetailController alloc] initWithUrlString:newsModel.url];
//        NewsDetailC.hidesBottomBarWhenPushed = YES;
//        [self.navigationController pushViewController:NewsDetailC animated:YES];
//    }
//
//}



@end
