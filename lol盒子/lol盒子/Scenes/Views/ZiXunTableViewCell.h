//
//  ZiXunTableViewCell.h
//  lol盒子
//
//  Created by 贺聪 on 15/11/21.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZiXun.h"
@interface ZiXunTableViewCell : UITableViewCell
@property(nonatomic,retain)UIImageView * imgView;
@property(nonatomic,retain)UILabel * title;
@property(nonatomic,retain)UILabel * content;
@property(nonatomic,retain)UILabel * readCount;
@property(nonatomic,retain)UILabel * time;
@property(nonatomic,retain)UILabel * commentSum;
@property(nonatomic,retain)ZiXun * ziXun;



@end
