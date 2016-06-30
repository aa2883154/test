//
//  TrackCarToonCell.m
//  TianYuanData
//
//  Created by 天元数科 on 16/6/12.
//  Copyright © 2016年 天元数科. All rights reserved.
//

#import "TrackCarToonCell.h"

@implementation TrackCarToonCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self UI];
    }
    return self;
}
//
-(void)UI
{
    //头像
    UIImageView *icon = [[UIImageView alloc]init];
    icon.backgroundColor = Yellow_Color;
    icon.layer.cornerRadius=5;
    [self.contentView addSubview:icon];
    [icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).offset(16 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(self.contentView.mas_left).offset(30 *SCREEN_WIDTH/650);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-16 *SCREEN_HEIGHT/1136);
        make.width.mas_offset(88 *SCREEN_WIDTH/650);
    }];
    
    //标题
    UILabel *title = [[UILabel alloc]init];
    title.text = @"火影忍者";
    title.textColor = Black_Color;
    title.font = [UIFont systemFontOfSize:9];
    [self.contentView addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(icon.mas_top);
        make.left.mas_equalTo(icon.mas_right).offset(16 *SCREEN_WIDTH/650);
    }];
    
    UILabel *auth = [[UILabel alloc]init];
    auth.font = [UIFont systemFontOfSize:7];
    [self.contentView addSubview:auth];
    auth.textColor = LINE_GRAY;
    auth.text = @"作者:";
    [auth mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(title.mas_bottom).offset(20 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(icon.mas_right).offset(16 *SCREEN_WIDTH/650);
    }];
    
    UILabel *author = [UILabel new];
    [self.contentView addSubview:author];
    author.textColor = LINE_GRAY;
    author.font = [UIFont systemFontOfSize:7];
    author.text = @"岸本七实";
    [author mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(auth.mas_top);
        make.left.mas_equalTo(auth.mas_right);
    }];
    
    UILabel *time = [UILabel new];
    time.text = @"上映日期:";
    time.textColor = LINE_GRAY;
    time.font = [UIFont systemFontOfSize:7];
    [self.contentView addSubview:time];
    [time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(icon.mas_right).offset(16 *SCREEN_WIDTH/650);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-16 *SCREEN_HEIGHT/1136);
    }];
    UILabel *timelbl = [UILabel new];
    timelbl.text = @"2002年";
    timelbl.font = [UIFont systemFontOfSize:7];
    timelbl.textColor = LINE_GRAY;
    [self.contentView addSubview:timelbl];
    [timelbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(time.mas_top);
        make.left.mas_equalTo(time.mas_right);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-16 *SCREEN_HEIGHT/1136);
    }];
    
    
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
