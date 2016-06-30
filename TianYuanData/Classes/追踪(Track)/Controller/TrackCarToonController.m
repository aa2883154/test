//
//  TrackCarToonController.m
//  TianYuanData
//
//  Created by 天元数科 on 16/6/2.
//  Copyright © 2016年 天元数科. All rights reserved.
//

#import "TrackCarToonController.h"
#import "TrackCarToonCell.h"

@interface TrackCarToonController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic)UITableView *tableView;

@end

@implementation TrackCarToonController
- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatTableView];
}
-(void)creatTableView
{
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[TrackCarToonCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tableView];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TrackCarToonCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-30 , 1, 8, 15)];
    imageView.image = [UIImage imageNamed:@"arrow-right"];
    imageView.center = CGPointMake(SCREEN_WIDTH-21, cell.contentView.center.y);
    [cell.contentView addSubview:imageView];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 122 *SCREEN_HEIGHT/1136;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
 
}



@end
