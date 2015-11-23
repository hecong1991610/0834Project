//
//  JNCollectionViewCell.m
//  lol盒子
//
//  Created by lanou3g on 15/11/17.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "JNCollectionViewCell.h"


@implementation JNCollectionViewCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, self.frame.size.width-10, self.frame.size.width - 10)];
        [self addSubview:_imgView];
        _label = [[UILabel alloc]initWithFrame:CGRectMake(5, self.contentView.bounds.size.width, self.contentView.bounds.size.width - 10, 20)];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.font = [UIFont systemFontOfSize:12];
        [self addSubview:_label];
    }
    return self;
}

-(void)setJiNeng:(JiNeng *)jiNeng{
    _jiNeng = jiNeng;
    _label.text = jiNeng.name;
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/spells/png/%d.png",[jiNeng.id intValue]]]];
}





@end
