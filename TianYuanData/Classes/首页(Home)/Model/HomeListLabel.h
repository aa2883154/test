//
//  HomeListLabel.h
//  TianYuanData
//
//  Created by 天元数科 on 16/5/24.
//  Copyright © 2016年 天元数科. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeListLabel : UILabel
//@property(nonatomic,assign)CGFloat scale;
@property (nonatomic, assign) CGFloat textWidth;

-(void)setScale:(CGFloat)scale;

+(instancetype)listLabelWithTitle:(NSString *)title;

@end
