//
//  SkillsTableViewCell.h
//  lol盒子
//
//  Created by 贺聪 on 15/11/20.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "HeroDetail.h"
@interface SkillsTableViewCell : UITableViewCell
@property(nonatomic,retain)UIImageView * skillsImgView;
@property(nonatomic,retain)UILabel * name;
@property(nonatomic,retain)UILabel * des;
@property(nonatomic,retain)UILabel * cost;
@property(nonatomic,retain)UILabel * cooldown;
@property(nonatomic,retain)UILabel * range;
@property(nonatomic,retain)UILabel * effect;

@end
