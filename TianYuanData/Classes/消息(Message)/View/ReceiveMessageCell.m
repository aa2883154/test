//
//  ReceiveMessageCell.m
//  TianYuanData
//
//  Created by 天元数科 on 16/6/7.
//  Copyright © 2016年 天元数科. All rights reserved.
//

#import "ReceiveMessageCell.h"

@implementation ReceiveMessageCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setUI];
    }
    return self;
}

-(void)setUI
{
    //头像
    UIImageView *icon = [[UIImageView alloc]init];
    [icon setImage:[UIImage imageNamed:@"message-head-portrait"]];
    [self.contentView addSubview:icon];
    [icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).offset(15 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(self.contentView.mas_left).offset(30 *SCREEN_WIDTH/650);
        make.width.mas_offset(33);
        make.height.mas_offset(34);
    }];
    //姓名label
    UILabel *namelabel = [UILabel new];
    [self.contentView addSubview:namelabel];
    namelabel.text = @"张三丰";
    namelabel.font = [UIFont systemFontOfSize:9
                      ];
    namelabel.textColor = [UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1];
    [self.contentView addSubview:namelabel];
    [namelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(icon.mas_top);
        make.left.mas_equalTo(icon.mas_right).offset(5);
    }];
    //时间label
    UILabel *timelbl = [UILabel new];
    [self.contentView addSubview:timelbl];
    timelbl.text = @"2015-5-18 20:21";
    timelbl.textColor = Label_Color;
    timelbl.font = [UIFont systemFontOfSize:8];
    [timelbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(namelabel.mas_bottom).offset(16 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(icon.mas_right).offset(5);
    }];
    
    UILabel *lbl = [UILabel new];
    [self.contentView addSubview:lbl];
    lbl.text = @"回复";
    lbl.textColor = [UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1];
    lbl.font =[UIFont systemFontOfSize:9];
    [lbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(icon.mas_bottom).offset(16 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(self.contentView.mas_left).offset(30 *SCREEN_WIDTH/650);
    }];
    
    //赋值的时候 拼接一下
    UILabel *nametext = [UILabel new];
    [self.contentView addSubview:nametext];
    nametext.text = @"@SSSS-111:";
    nametext.textColor = BLUE_Color;
    nametext.font = [UIFont systemFontOfSize:9];
    [nametext mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lbl.mas_top);
        make.left.mas_equalTo(lbl.mas_right).offset(1);

        make.bottom.mas_equalTo(lbl.mas_bottom);
    }];
    
    UILabel *contentlbl = [UILabel new];
    [self.contentView addSubview:contentlbl];
    contentlbl.text = @"谢谢你";
    contentlbl.textColor =[UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1];
    contentlbl.font = [UIFont systemFontOfSize:9];
    contentlbl.numberOfLines = 0;
    [contentlbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(nametext.mas_top);
        make.left.mas_equalTo(nametext.mas_right);
//        make.right.mas_equalTo(self.contentView.mas_right).offset(-14);
    }];
    
    UIView *grayView = [UIView new];
    [self.contentView addSubview:grayView];
    grayView.backgroundColor = Gray_Color;
    [grayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(nametext.mas_bottom).offset(16 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(self.contentView
                              .mas_left);
        make.right.mas_equalTo(self.contentView.mas_right);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-16 *SCREEN_HEIGHT/1136);
    }];
    
    //赋值的时候拼接
    UILabel *nametext2 = [UILabel new];
    [grayView addSubview:nametext2];
    nametext2.text = @"@SSSS-111回复@张三丰:你的评论很有意思";
    nametext2.font = [UIFont systemFontOfSize:9];
    nametext2.textColor = BLUE_Color;
    [nametext2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(grayView.mas_top).offset(10 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(grayView.mas_left).offset(30 *SCREEN_WIDTH/650);
    }];
    
    //title 图片
    UIImageView *titleimage = [UIImageView new];
    [titleimage setImage:[UIImage imageNamed:@"sbscription-img"]];
    [grayView addSubview:titleimage];
    [titleimage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(nametext2.mas_bottom).offset(10 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(grayView.mas_left).offset(30 *SCREEN_WIDTH/650);
        make.width.mas_equalTo(88 *SCREEN_WIDTH/650);
        make.height.mas_equalTo(88 *SCREEN_HEIGHT/1136);
        make.bottom.mas_equalTo(grayView.mas_bottom).offset(-10 *SCREEN_HEIGHT/1136);
    }];
//
    UIView *whiteView = [UIView new];
    whiteView.backgroundColor = [UIColor whiteColor];
    [grayView addSubview:whiteView];
    [whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(nametext2.mas_bottom).offset(10 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(titleimage.mas_right);
        make.right.mas_equalTo(grayView.mas_right).offset(-30 *SCREEN_WIDTH/650);
        make.bottom.mas_equalTo(titleimage.mas_bottom);
    }];
    
    UILabel *title = [UILabel new];
    [whiteView addSubview:title];
    title.text = @"娱乐详情";
    title.textColor = Black_Color;
    title.font = [UIFont systemFontOfSize:6];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(whiteView.mas_top).offset(8*SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(whiteView.mas_left).offset(8 *SCREEN_WIDTH/650);
    }];
    
    UILabel *newslabel = [UILabel new];
    [whiteView addSubview:newslabel];
    newslabel.text = @"将计数器的repeats设置为YES的时候，self的引用计数会加1。因此可能会导致self（即viewController）不能release，所以，必须在viewWillAppear的时候，将计数器timer停止，否则可能会导致内存泄露。";
    newslabel.numberOfLines = 4;
    newslabel.font = [UIFont systemFontOfSize:5];
    newslabel.textColor = Label_Color;
    [newslabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(title.mas_bottom).offset(8 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(whiteView.mas_left).offset(12 *SCREEN_WIDTH/650);
        make.right.mas_equalTo(whiteView.mas_right).offset(-10 *SCREEN_WIDTH/650);
        
    }];
    
    
    
    
    
    
    
    
}

- (void)awakeFromNib {
    [super awakeFromNib];
   
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
