//
//  ZJZRTableViewCell.h
//  lol盒子
//
//  Created by lanou3g on 15/11/18.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZuiJiaZhengRong.h"

@interface ZJZRTableViewCell : UITableViewCell
@property(nonatomic,retain)UILabel * title;
@property(nonatomic,retain)UILabel * des;
@property(nonatomic,retain)UIImageView * imgView1;
@property(nonatomic,retain)UIImageView * imgView2;
@property(nonatomic,retain)UIImageView * imgView3;
@property(nonatomic,retain)UIImageView * imgView4;
@property(nonatomic,retain)UIImageView * imgView5;
@property(nonatomic,retain)ZuiJiaZhengRong * zuiJiaZhengRong;
@end
