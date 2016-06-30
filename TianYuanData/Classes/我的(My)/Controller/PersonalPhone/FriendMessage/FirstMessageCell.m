//
//  FirstMessageCell.m
//  TianYuanData
//
//  Created by 天元数科 on 16/6/7.
//  Copyright © 2016年 天元数科. All rights reserved.
//

#import "FirstMessageCell.h"

@implementation FirstMessageCell

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
    //
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
    //评论的正文label
    UILabel *titleLabel = [UILabel new];
    [self.contentView addSubview:titleLabel];
    titleLabel.text = @"我很喜欢他呀~~~~";
    titleLabel.font = [UIFont systemFontOfSize:8];
    titleLabel.textColor = [UIColor blackColor];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(timelbl.mas_bottom).offset(16 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(self.contentView.mas_left).offset(14);
        make.height.mas_offset(12);
    }];
////
    UIView *whiteView = [UIView new];
    [self.contentView addSubview:whiteView];
    whiteView.backgroundColor = [UIColor whiteColor];
    whiteView.layer.borderWidth = 1;
    whiteView.layer.borderColor = LINE_GRAY.CGColor;
    whiteView.layer.cornerRadius = 5;
    [whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(titleLabel.mas_bottom).offset(16 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(self.contentView.mas_left).offset(14);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-14);
        make.height.mas_offset(124 *SCREEN_HEIGHT/1136);
    }];
//
//    //新闻标题图片
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
    detailLabel.text = @"Label的首行缩进一直是个很头疼的问题，现在IOS6只有有一个attributedText的属性值得我们深究，可以达到我们自定义的行高，还有首行缩进，各种行距和间隔问题Label的首行缩进一直是个很头疼的问题，现在IOS6只有有一个attributedText的属性值得我们深究，可以达到我们自定义的行高，还有首行缩进，各种行距和间隔问题Label的首行缩进一直是个很头疼的问题，现在IOS6只有有一个attributedText的属性值得我们深究，可以达到我们自定义的行高，还有首行缩进，各种行距和间隔问题";
    detailLabel.font = [UIFont systemFontOfSize:5];
    detailLabel.numberOfLines = 4;
    detailLabel.textColor = Label_Color;
    [detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(title.mas_bottom).offset(10 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(newicon.mas_right).offset(5);
        make.right.mas_equalTo(whiteView.mas_right).offset(-10);
        make.bottom.mas_equalTo(whiteView.mas_bottom).offset(-26 *SCREEN_HEIGHT/1136);
    }];
    //点赞按钮
    UIButton *goodbtn = [UIButton new];
    [self.contentView addSubview:goodbtn];
    [goodbtn setImage:[UIImage imageNamed:@"praise"] forState:UIControlStateNormal];
    [goodbtn setTitle:@"128" forState:UIControlStateNormal];
    goodbtn.titleLabel.font = [UIFont systemFontOfSize:5];
    [goodbtn setTitleColor:LINE_GRAY forState:UIControlStateNormal];
    
    [goodbtn setImageEdgeInsets:UIEdgeInsetsMake(15, 0, 15, 20)];
    [goodbtn setTitleEdgeInsets:UIEdgeInsetsMake(3, -12, 0,0)];
    
    [goodbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(whiteView.mas_bottom).offset(10 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(self.contentView.mas_left).offset(14);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-10*SCREEN_HEIGHT/1136);
        make.width.mas_offset(55 *SCREEN_WIDTH/650);
    }];
    //鄙视按钮
    UIButton *lowbtn = [UIButton new];
    [self.contentView addSubview:lowbtn];
    [lowbtn setImage:[UIImage imageNamed:@"oppose"] forState:UIControlStateNormal];
    [lowbtn setTitle:@"10" forState:UIControlStateNormal];
    lowbtn.titleLabel.font = [UIFont systemFontOfSize:5];
    [lowbtn setTitleColor:LINE_GRAY forState:UIControlStateNormal];
    [lowbtn setImageEdgeInsets:UIEdgeInsetsMake(3, 0, 3, 20)];
    [lowbtn setTitleEdgeInsets:UIEdgeInsetsMake(3, -15, 3, 0)];
    [lowbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(whiteView.mas_bottom).offset(10 *SCREEN_HEIGHT/1136);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-10*SCREEN_HEIGHT/1136);
        make.centerX.mas_equalTo(whiteView);
    }];
    
    //评论按钮
    UIButton *commentbtn = [UIButton new];
    [self.contentView addSubview:commentbtn];
    [commentbtn setImage:[UIImage imageNamed:@"reply"] forState:UIControlStateNormal];
    [commentbtn setTitle:@"6" forState:UIControlStateNormal];
    commentbtn.titleLabel.font = [UIFont systemFontOfSize:5
                                  ];
    [commentbtn setTitleColor:LINE_GRAY forState:UIControlStateNormal];
    [commentbtn setImageEdgeInsets:UIEdgeInsetsMake(3, 0, 3, 20)];
    [commentbtn setTitleEdgeInsets:UIEdgeInsetsMake(3, -15, 3, 0)];
    [commentbtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(whiteView.mas_bottom).offset(10 *SCREEN_HEIGHT/1136);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-14);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-10*SCREEN_HEIGHT/1136);
    }];
    
}

@end
