//
//  SkillsTableViewCell.m
//  lol盒子
//
//  Created by 贺聪 on 15/11/20.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "SkillsTableViewCell.h"

@implementation SkillsTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.skillsImgView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 40, 40)];
        [self addSubview:_skillsImgView];
        self.name = [[UILabel alloc]initWithFrame:CGRectMake(50, 5, 200, 40)];
        _name.font = [UIFont systemFontOfSize:16];
        [self addSubview:_name];
        self.des = [[UILabel alloc]initWithFrame:CGRectMake(50, 50, [UIScreen mainScreen].bounds.size.width - 60, 100)];
        _des.numberOfLines = 0;
        _des.font = [UIFont systemFontOfSize:15];
        [self addSubview:_des];
        
        UILabel * des = [[UILabel alloc]initWithFrame:CGRectMake(5, 50, 40, _des.frame.size.height)];
        des.text = @"描述";
        des.textColor = [UIColor colorWithWhite:0.608 alpha:1.000];
        des.font = [UIFont systemFontOfSize:15];
        [self addSubview:des];
        
        self.cost = [[UILabel alloc]initWithFrame:CGRectMake(50, 50+_des.frame.size.height, [UIScreen mainScreen].bounds.size.width - 60, 30)];
        _cost.numberOfLines = 0;
        _cost.font = [UIFont systemFontOfSize:15];
        [self addSubview:_cost];
        
        UILabel * cost = [[UILabel alloc]initWithFrame:CGRectMake(5, 50+_des.frame.size.height, 40, _cost.frame.size.height)];
        cost.text = @"消耗";
        cost.font = [UIFont systemFontOfSize:15];
        cost.textColor = [UIColor colorWithWhite:0.608 alpha:1.000];
        [self addSubview:cost];
        
        self.cooldown = [[UILabel alloc]initWithFrame:CGRectMake(50, 50+_des.frame.size.height+_cost.frame.size.height, [UIScreen mainScreen].bounds.size.width - 60, 30)];
        _cooldown.numberOfLines = 0;
        _cooldown.font = [UIFont systemFontOfSize:15];
        [self addSubview:_cooldown];
        
        UILabel * cooldown = [[UILabel alloc]initWithFrame:CGRectMake(5, 50+_des.frame.size.height+_cost.frame.size.height,40, _cooldown.frame.size.height)];
        cooldown.text = @"冷却";
        cooldown.numberOfLines = 0;
        cooldown.font = [UIFont systemFontOfSize:15];
        cooldown.textColor = [UIColor colorWithWhite:0.608 alpha:1.000];
        [self addSubview:cooldown];
        
        self.range = [[UILabel alloc]initWithFrame:CGRectMake(50, 50+_des.frame.size.height+_cost.frame.size.height+_cooldown.frame.size.height, [UIScreen mainScreen].bounds.size.width - 60, 30)];
        _range.numberOfLines = 0;
        _range.font = [UIFont systemFontOfSize:15];
        [self addSubview:_range];
       
        UILabel * range = [[UILabel alloc]initWithFrame:CGRectMake(5, 50+_des.frame.size.height+_cost.frame.size.height+_cooldown.frame.size.height, 40, _range.frame.size.height)];
        range.text = @"范围";
        range.font = [UIFont systemFontOfSize:15];
        range.textColor = [UIColor colorWithWhite:0.608 alpha:1.000];
        [self addSubview:range];
        
        self.effect = [[UILabel alloc]initWithFrame:CGRectMake(50, 50+_des.frame.size.height + _cost.frame.size.height + _cooldown.frame.size.height + _range.frame.size.height, [UIScreen mainScreen].bounds.size.width - 60, 200)];
        _effect.numberOfLines = 0;
        _effect.font = [UIFont systemFontOfSize:15];
        [self addSubview:_effect];
        
        UILabel * effect = [[UILabel alloc]initWithFrame:CGRectMake(5, 50+_des.frame.size.height + _cost.frame.size.height + _cooldown.frame.size.height + _range.frame.size.height, 40, _effect.frame.size.height)];
        effect.text = @"效果";
        effect.font = [UIFont systemFontOfSize:15];
        effect.textColor = [UIColor colorWithWhite:0.608 alpha:1.000];
        [self addSubview:effect];
        
    }
    return self;
}







@end
