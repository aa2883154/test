//
//  HomeListCell.m
//  TianYuanData
//
//  Created by 天元数科 on 16/5/24.
//  Copyright © 2016年 天元数科. All rights reserved.
//

#import "HomeListCell.h"
#import "HomeNewsTVC.h"

@implementation HomeListCell

//-(instancetype)initWithFrame:(CGRect)frame
//{
//    self = [super initWithFrame:frame];
//    if (self) {
//     
//    }
//    return self;
//}
-(void)setUrlString:(NSString *)urlString
{
    _urlString = urlString;
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"HomeNewsTVC" bundle:nil];
    _homeNewsTVC = [sb instantiateInitialViewController];
    _homeNewsTVC.view.frame = self.bounds;
    _homeNewsTVC.urlString = urlString;
    
    [self addSubview:_homeNewsTVC.view];
    
}
@end
