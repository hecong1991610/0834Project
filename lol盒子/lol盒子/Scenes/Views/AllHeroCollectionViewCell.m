//
//  AllHeroCollectionViewCell.m
//  lol盒子
//
//  Created by 贺聪 on 15/11/19.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "AllHeroCollectionViewCell.h"

@implementation AllHeroCollectionViewCell

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _heroImgView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, frame.size.width - 10, frame.size.width - 10)];
        [self addSubview:_heroImgView];
        _title = [[UILabel alloc]initWithFrame:CGRectMake(5, frame.size.width, frame.size.width - 10, 20)];
        _title.font = [UIFont systemFontOfSize:13];
        _title.textAlignment = NSTextAlignmentCenter;
        [self addSubview:_title];
    }
    return self;
}

-(void)setHero:(FreeHero *)hero{
    _hero = hero;
    [_heroImgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",_hero.enName]]];
    _title.text = _hero.title;
}


@end
