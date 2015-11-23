//
//  ZJZRTableViewCell.m
//  lol盒子
//
//  Created by lanou3g on 15/11/18.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "ZJZRTableViewCell.h"
#define WINDOWWIDTH [UIScreen mainScreen].bounds.size.width
@implementation ZJZRTableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _title = [[UILabel alloc]initWithFrame:CGRectMake(5, 5, WINDOWWIDTH - 10, 30)];
        
        [self addSubview:_title];
        _imgView1 = [[UIImageView alloc]initWithFrame:CGRectMake(5, 40, WINDOWWIDTH/5-10, WINDOWWIDTH/5-10)];
        [self addSubview:_imgView1];
        _imgView2 = [[UIImageView alloc]initWithFrame:CGRectMake(WINDOWWIDTH/5 + 5, 40,WINDOWWIDTH/5-10, WINDOWWIDTH/5-10)];
        [self addSubview:_imgView2];
        _imgView3 = [[UIImageView alloc]initWithFrame:CGRectMake(WINDOWWIDTH/5*2 + 5, 40,WINDOWWIDTH/5-10, WINDOWWIDTH/5-10)];
        [self addSubview:_imgView3];
        _imgView4 = [[UIImageView alloc]initWithFrame:CGRectMake(WINDOWWIDTH/5*3 + 5, 40,WINDOWWIDTH/5-10, WINDOWWIDTH/5-10)];
        [self addSubview:_imgView4];
        _imgView5 = [[UIImageView alloc]initWithFrame:CGRectMake(WINDOWWIDTH/5*4 + 5, 40,WINDOWWIDTH/5-10, WINDOWWIDTH/5-10)];
        [self addSubview:_imgView5];
        _des = [[UILabel alloc]initWithFrame:CGRectMake(5, WINDOWWIDTH/5+40, WINDOWWIDTH - 10, 50)];
        _des.font = [UIFont systemFontOfSize:15];
        [_des setTextColor:[UIColor colorWithRed:0.429 green:0.410 blue:0.416 alpha:1.000]];
        _des.numberOfLines = 0;
        [self addSubview:_des];
    }
    return self;
}

-(void)setZuiJiaZhengRong:(ZuiJiaZhengRong *)zuiJiaZhengRong{
    _zuiJiaZhengRong = zuiJiaZhengRong;
    _title.text = zuiJiaZhengRong.title;
    [_imgView1 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",zuiJiaZhengRong.hero1]]];
    [_imgView2 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",zuiJiaZhengRong.hero2]]];
    [_imgView3 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",zuiJiaZhengRong.hero3]]];
    [_imgView4 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",zuiJiaZhengRong.hero4]]];
    [_imgView5 sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",zuiJiaZhengRong.hero5]]];
    _des.text = zuiJiaZhengRong.des;
}


@end
