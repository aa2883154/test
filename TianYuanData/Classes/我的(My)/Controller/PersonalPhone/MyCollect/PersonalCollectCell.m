//
//  PersonalCollectCell.m
//  TianYuanData
//
//  Created by 天元数科 on 16/5/26.
//  Copyright © 2016年 天元数科. All rights reserved.
//

#import "PersonalCollectCell.h"

@interface PersonalCollectCell()

@end
@implementation PersonalCollectCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self removeFromSuperview];
        
        UIView *delete = [[UIView alloc]init];
        [self.contentView addSubview:delete];
        [delete mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.contentView.mas_top);
            make.right.mas_equalTo(self.contentView.mas_left);
            make.bottom.mas_equalTo(self.contentView.mas_bottom);
            make.width.mas_equalTo(self.contentView);
        }];
        
        UIButton *deleteBtn = [[UIButton alloc]init];
        [deleteBtn addTarget:self action:@selector(delete) forControlEvents:UIControlEventTouchUpInside];
//        [deleteBtn setImage:[UIImage imageNamed:@"delete"] forState:UIControlStateNormal];
        [deleteBtn setBackgroundImage:[UIImage imageNamed:@"delete"] forState:UIControlStateNormal];
        [self.contentView addSubview:deleteBtn];
        [deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(delete.mas_top).offset(25);
            make.right.mas_equalTo(delete.mas_right);
            make.width.offset(34 *SCREEN_WIDTH/650);
            make.height.offset(34 *SCREEN_HEIGHT/1136);
        }];
        
        UIImageView *img = [[UIImageView alloc]initWithFrame:CGRectMake(14, 15 *SCREEN_HEIGHT/1136, 116 *SCREEN_WIDTH/650, 116 *SCREEN_HEIGHT/1136)];
        img.image = [UIImage imageNamed:@"collect-img1"];
        [self.contentView addSubview:img];
        
        
        UILabel *lbl = [[UILabel alloc]initWithFrame:CGRectMake(150 *SCREEN_WIDTH/650, 17 *SCREEN_HEIGHT/1136, 400 *SCREEN_WIDTH/650, 20)];
        lbl.text = @"娱乐列表";
        lbl.font = [UIFont systemFontOfSize:11];
        [self.contentView addSubview:lbl];
        
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(150 *SCREEN_WIDTH/650, 42 *SCREEN_HEIGHT/1136, 400 *SCREEN_WIDTH/650, 52 *SCREEN_HEIGHT/1136)];
        label.numberOfLines = 3;
       label.text = @"测试";
        label.font = [UIFont systemFontOfSize:7];
        label.textColor = Label_Color;
        [self.contentView addSubview:label];
    }
    return  self;
}
-(void)delete
{
    NSLog(@"1");
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
