//
//  SupportCell.m
//  TianYuanData
//
//  Created by 天元数科 on 16/6/7.
//  Copyright © 2016年 天元数科. All rights reserved.
//

#import "SupportCell.h"

@implementation SupportCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self ==[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self UI];
    }
    return self;
}

-(void)UI
{
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
