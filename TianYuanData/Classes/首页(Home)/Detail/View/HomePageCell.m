//
//  HomePageCell.m
//  TianYuanData
//
//  Created by 天元数科 on 16/6/2.
//  Copyright © 2016年 天元数科. All rights reserved.
//

#import "HomePageCell.h"

@implementation HomePageCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self ==[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self tableView];
    }
    return self;
}

-(void)tableView
{
    //头像
    UIImageView *icon = [[UIImageView alloc]init];
    [self.contentView addSubview:icon];
    [icon setImage:[UIImage imageNamed:@"discuss-details-head2"]];
    [icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).offset(20 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(self.contentView.mas_left).offset(14);
        make.width.mas_equalTo(25);
        make.height.mas_equalTo(25);
    }];
    
    //姓名
    UILabel *name = [UILabel new];
    name.text = @"张三丰";
    name.textColor = Yellow_Color;
    name.font = [UIFont systemFontOfSize:8];
    [self.contentView addSubview:name];
    [name mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.contentView.mas_top).offset(25 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(icon.mas_right).offset(5 *SCREEN_WIDTH/650);
    }];
    //发表了评论
    UILabel *lbl = [UILabel new];
    lbl.text = @"发表了评论";
    lbl.textColor = [UIColor colorWithRed:51/255.0f green:51/255.0f blue:51/255.0f alpha:1];
    lbl.font = [UIFont systemFontOfSize:8];
    [self.contentView addSubview:lbl];
    [lbl mas_makeConstraints:^(MASConstraintMaker *make) {
          make.top.mas_equalTo(self.contentView.mas_top).offset(25 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(name.mas_right).offset(2);
    }];
    //时间
    UILabel *time = [UILabel new];
    time.text = @"2016-6-13 11:05";
    time.font = [UIFont systemFontOfSize:6];
    time.textColor = LINE_GRAY;
    [self.contentView addSubview:time];
    [time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(name.mas_bottom).offset(10 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(icon.mas_right).offset(5 *SCREEN_WIDTH/650);
    }];
    //评论内容
    UILabel *title = [UILabel new];
    title.text = @"我是评论的内容~~~~~~~~~~我是评论的内容~~~~~~~~~~我是评论的内容~~~~~~~~~~我是评论的内容~~~~~~~~~~我是评论的内容~~~~~~~~~~我是评论的内容~~~~~~~~~~我是评论的内容~~~~~~~~~~我是评论的内容~~~~~~~~~~我是评论的内容~~~~~~~~~~我是评论的内容~~~~~~~~~~我是评论的内容~~~~~~~~~~我是评论的内容~~~~~~~~~~我是评论的内容~~~~~~~~~~我是评论的内容~~~~~~~~~~";
    title.numberOfLines = 0;
    title.font = [UIFont systemFontOfSize:8];
    title.textColor = Black_Color;
    [self.contentView addSubview:title];
    [title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(icon.mas_bottom).offset(16 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(self.contentView.mas_left).offset(14);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-14);
    }];
    
    //
    UIView *whiteView = [UIView new];
    whiteView.backgroundColor = [UIColor whiteColor];
    whiteView.layer.cornerRadius =5;
    whiteView.layer.borderWidth = 1;
    whiteView.layer.borderColor = LINE_GRAY.CGColor;
    [self.contentView addSubview:whiteView];
    [whiteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(title.mas_bottom).offset(16 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(self.contentView.mas_left).offset(14);
        make.right.mas_equalTo(self.contentView.mas_right).offset(-14);
        make.bottom.mas_equalTo(self.contentView.mas_bottom).offset(-16 *SCREEN_HEIGHT/1136);
        make.height.mas_offset(124 *SCREEN_HEIGHT/1136);
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
    UILabel *newstitle = [UILabel new];
    [whiteView addSubview:newstitle];
    newstitle.text = @"娱乐详情";
    newstitle.font = [UIFont systemFontOfSize:6];
    newstitle.textColor = Black_Color;
    [newstitle mas_makeConstraints:^(MASConstraintMaker *make) {
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
        make.top.mas_equalTo(newstitle.mas_bottom).offset(10 *SCREEN_HEIGHT/1136);
        make.left.mas_equalTo(newicon.mas_right).offset(5);
        make.right.mas_equalTo(whiteView.mas_right).offset(-10);
        make.bottom.mas_equalTo(whiteView.mas_bottom).offset(-26 *SCREEN_HEIGHT/1136);
    }];

    
    
}
- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
