//
//  JNMSViewController.h
//  lol盒子
//
//  Created by 贺聪 on 15/11/19.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JiNeng.h"

@interface JNMSViewController : UIViewController
@property(nonatomic,retain)UIImageView * imgView;
@property(nonatomic,retain)UILabel * name;
@property(nonatomic,retain)UILabel * level;
@property(nonatomic,retain)UILabel * cooldown;
@property(nonatomic,retain)UILabel * des;
@property(nonatomic,retain)UILabel * tips;
@property(nonatomic,retain)UILabel * strong;
@property(nonatomic,retain)JiNeng * jineng;
@end
