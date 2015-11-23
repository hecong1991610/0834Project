//
//  ZRXQTableViewCell.m
//  lol盒子
//
//  Created by lanou3g on 15/11/18.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "ZRXQTableViewCell.h"
#define WINDOWWIDTH [UIScreen mainScreen].bounds.size.width
@implementation ZRXQTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, WINDOWWIDTH/5 - 10, WINDOWWIDTH/5 - 10)];
        [self addSubview:_imgView];
        _des = [[UILabel alloc]initWithFrame:CGRectMake(WINDOWWIDTH/5+5, 5, WINDOWWIDTH/5 * 4 - 10, 30)];
        _des.font = [UIFont systemFontOfSize:15];
        _des.numberOfLines = 0;
        [self addSubview:_des];
    }
    return self;
}


- (void)setHeroName:(NSString *)heroName{
    [_imgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",heroName]]];
}
- (void)setHeroDes:(NSString *)heroDes{
    _des.text = heroDes;
}


@end
