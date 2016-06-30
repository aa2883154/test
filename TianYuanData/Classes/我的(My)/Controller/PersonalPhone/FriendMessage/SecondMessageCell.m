//
//  SecondMessageCell.m
//  TianYuanData
//
//  Created by 天元数科 on 16/6/7.
//  Copyright © 2016年 天元数科. All rights reserved.
//

#import "SecondMessageCell.h"

@implementation SecondMessageCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self == [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self ui];
    }
    return self;
}

-(void)ui
{
    //头像
    UIImageView *icon = [[UIImageView alloc]init];
    [self.contentView addSubview:icon];
    [icon setImage:[UIImage imageNamed:@"dynamic-head-img"]];
    [icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).offset(16 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(self.contentView.mas_left).offset(14);
        make.width.mas_equalTo(25);
        make.height.mas_equalTo(25);
    }];
    
    //姓名
    UILabel *namelabel = [UILabel new];
    [self.contentView addSubview:namelabel];
    namelabel.text = @"张三丰";
    namelabel.font = [UIFont systemFontOfSize:8];
    namelabel.textColor = [UIColor colorWithRed:153/255.0f green:153/255.0f blue:153/255.0f alpha:1];
    [namelabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).offset(20 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(icon.mas_right).offset(5);
        make.height.mas_offset(8);
    }];
    
    //
    UILabel *label = [UILabel new];
    [self.contentView addSubview:label];
    label.text = @"发表了评论";
    label.textColor = Black_Color;
    label.font  = [UIFont systemFontOfSize:8];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(namelabel.mas_top);
        make.left.mas_equalTo(namelabel.mas_right).offset(5);
        make.height.mas_offset(8);
        make.width.mas_offset(50);
    }];
    
    //时间label
    UILabel *timelbl = [UILabel new];
    [self.contentView addSubview:timelbl];
    timelbl.text = @"2015-05-22 19:21";
    timelbl.textColor = LINE_GRAY;
    timelbl.font = [UIFont systemFontOfSize:6];
    [timelbl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(label.mas_bottom).offset(14 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(icon.mas_right).offset(5);
        make.height.mas_offset(8);
        make.width.mas_offset(80);
    }];
    
   //正文label
    UILabel *titleLabel = [UILabel new];
    [self.contentView addSubview:titleLabel];
    titleLabel.text = @"赞了这条评论";
    titleLabel.font = [UIFont systemFontOfSize:8];
    titleLabel.textColor = [UIColor blackColor];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(timelbl.mas_bottom).offset(16 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(self.contentView.mas_left).offset(14);
        make.height.mas_offset(12);
    }];
    
    //分隔线
    UIView *line = [UIView new];
    [self.contentView addSubview:line];
    line.backgroundColor = LINE_GRAY;
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(titleLabel.mas_bottom).offset(16 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(self.contentView.mas_left).offset(14);
        make.right.mas_equalTo(self.contentView.mas_right);
        make.height.mas_equalTo(0.5);
    }];
    
    // 赞或者反对了某个的label
    UILabel *asslabel = [UILabel new];
    asslabel.text = @"我很喜欢他呀~~~~";
    asslabel.font = [UIFont systemFontOfSize:8];
    asslabel.textColor = LINE_GRAY;
    [self.contentView addSubview:asslabel];
    [asslabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(line.mas_bottom).offset(16 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(self.contentView.mas_left).offset(14);
    }];
    //新闻显示框
    UIView *whiteView = [UIView new];
    [self.contentView addSubview:whiteView];
    whiteView.backgroundColor = [UIColor whiteColor];
    whiteView.layer.borderWidth = 1;
    whiteView.layer.borderColor = LINE_GRAY.CGColor;
    whiteView.layer.cornerRadius = 5;
    [whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(asslabel.mas_bottom).offset(16 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(self.contentView.mas_left).offset(14);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-14);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-16 *SCREEN_HEIGHT/1136);
    }];
    //新闻标题图片
    UIImageView *newicon = [UIImageView new];
    [whiteView addSubview:newicon];
    [newicon setImage:[UIImage imageNamed:@"collect-img2"]];
    [newicon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(whiteView.mas_top).offset(16 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(whiteView.mas_left).offset(16 *SCREEN_WIDTH/650);
        make.bottom.mas_equalTo(whiteView.mas_bottom).offset(-16 *SCREEN_HEIGHT/1136);
        make.width.mas_offset(88 *SCREEN_WIDTH/650);
    }];
    
    //新闻标题
    UILabel *title = [UILabel new];
    [whiteView addSubview:title];
    title.text = @"娱乐详情";
    title.font = [UIFont systemFontOfSize:8];
    title.textColor = Black_Color;
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(whiteView.mas_top).offset(26 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(newicon.mas_right).offset(5);
    }];
    
    //新闻详情
    UILabel *detailLabel = [UILabel new];
    [whiteView addSubview:detailLabel];
    detailLabel.text = @" Label的首行缩进一直是个很头疼的问题，现在IOS6只有有一个attributedText的属性值得我们深究，可以达到我们自定义的行高，还有首行缩进，各种行距和间隔问题Label的首行缩进一直是个很头疼的问题，现在IOS6只有有一个attributedText的属性值得我们深究，可以达到我们自定义的行高，还有首行缩进，各种行距和间隔问题Label的首行缩进一直是个很头疼的问题，现在IOS6只有有一个attributedText的属性值得我们深究，可以达到我们自定义的行高，还有首行缩进，各种行距和间隔问题";
    detailLabel.font = [UIFont systemFontOfSize:5];
    detailLabel.numberOfLines = 4;
    detailLabel.textColor = Label_Color;
    [detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(title.mas_bottom).offset(10 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(newicon.mas_right).offset(5);
        make.right.mas_equalTo(whiteView.mas_right).offset(-10);
        make.bottom.mas_equalTo(whiteView.mas_bottom).offset(-26 *SCREEN_HEIGHT/1136);
    }];
}

@end
