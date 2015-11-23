//
//  MyHeroTableViewCell.m
//  lol盒子
//
//  Created by 贺聪 on 15/11/19.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "MyHeroTableViewCell.h"

@implementation MyHeroTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _heroImgView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 50, 50)];
        [self addSubview:_heroImgView];
        _title = [[UILabel alloc]initWithFrame:CGRectMake(60, 5, [UIScreen mainScreen].bounds.size.width - 60, 20)];
        [self addSubview:_title];
        _presentTimes = [[UILabel alloc]initWithFrame:CGRectMake(60, 30, [UIScreen mainScreen].bounds.size.width - 60, 20)];
        [self addSubview:_presentTimes];
        
    }
    return self;
}

-(void)setFreeHero:(FreeHero *)freeHero{
    _freeHero = freeHero;
    [_heroImgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions///%@_120x120.jpg",_freeHero.enName]]];
    _title.text = [NSString stringWithFormat:@"%@ %@",_freeHero.title,_freeHero.cnName];
    _presentTimes.text = [NSString stringWithFormat:@"场次:%@",_freeHero.presentTimes];
}


@end
