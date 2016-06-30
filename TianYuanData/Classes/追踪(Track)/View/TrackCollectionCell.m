//
//  TrackCollectionCell.m
//  TianYuanData
//
//  Created by 天元数科 on 16/6/2.
//  Copyright © 2016年 天元数科. All rights reserved.
//

#import "TrackCollectionCell.h"
@interface TrackCollectionCell()
@property (weak, nonatomic) IBOutlet UIImageView *iconImage;


@end
@implementation TrackCollectionCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.iconImage.layer.cornerRadius = 45.5;
    self.iconImage.clipsToBounds = YES;
    
}

@end
