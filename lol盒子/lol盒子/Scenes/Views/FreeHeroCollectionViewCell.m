//
//  FreeHeroCollectionViewCell.m
//  lol盒子
//
//  Created by 贺聪 on 15/11/19.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "FreeHeroCollectionViewCell.h"

@implementation FreeHeroCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _heroImg = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, frame.size.height-10, frame.size.height - 10)];
        [self addSubview:_heroImg];
        _title = [[UILabel alloc]initWithFrame:CGRectMake(frame.size.height, 5, frame.size.width - frame.size.height-10, 20)];
        _title.font = [UIFont systemFontOfSize:15];
        [self addSubview:_title];
        _cnName = [[UILabel alloc]initWithFrame:CGRectMake(frame.size.height, 25, frame.size.width - frame.size.height-10, 15)];
        _cnName.font = [UIFont systemFontOfSize:12];
        _cnName.textColor = [UIColor colorWithWhite:0.574 alpha:1.000];
        [self addSubview:_cnName];
        _location = [[UILabel alloc]initWithFrame:CGRectMake(frame.size.height, 40, frame.size.width - frame.size.height -10, 15)];
        _location.font = [UIFont systemFontOfSize:12];
        _location.textColor = [UIColor colorWithRed:0.222 green:0.541 blue:0.758 alpha:1.000];
        [self addSubview:_location];
    }
    return self;
}

-(void)setFreeHero:(FreeHero *)freeHero{
    _freeHero = freeHero;
    _cnName.text = freeHero.cnName;
    _location.text = freeHero.location;
    _title.text = freeHero.title;
    [_heroImg sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",freeHero.enName]]];
}


@end
