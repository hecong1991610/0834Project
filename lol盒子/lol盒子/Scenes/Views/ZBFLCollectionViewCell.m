//
//  ZBFLCollectionViewCell.m
//  lol盒子
//
//  Created by lanou3g on 15/11/17.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "ZBFLCollectionViewCell.h"

@implementation ZBFLCollectionViewCell
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, self.contentView.bounds.size.width - 10, self.contentView.bounds.size.width - 10)];
        [self addSubview:_imgView];
        _label = [[UILabel alloc]initWithFrame:CGRectMake(5, self.contentView.bounds.size.width, self.contentView.bounds.size.width - 10, 20)];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = [UIFont systemFontOfSize:12];
        [self addSubview:_label];
    }
    return self;
}

-(void)setZbfl:(ZBFL *)zbfl{
    _zbfl = zbfl;
    [_imgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/zb/%d_64x64.png",[_zbfl.ID intValue]]]];
    _label.text = zbfl.text;
}

@end
