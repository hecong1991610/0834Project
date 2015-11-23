//
//  ZuiJiaZhengRong.h
//  lol盒子
//
//  Created by lanou3g on 15/11/17.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZuiJiaZhengRong : NSObject
@property(nonatomic,retain)NSString * title;
@property(nonatomic,retain)NSString * hero1;
@property(nonatomic,retain)NSString * hero2;
@property(nonatomic,retain)NSString * hero3;
@property(nonatomic,retain)NSString * hero4;
@property(nonatomic,retain)NSString * hero5;
@property(nonatomic,retain)NSString * des1;
@property(nonatomic,retain)NSString * des2;
@property(nonatomic,retain)NSString * des3;
@property(nonatomic,retain)NSString * des4;
@property(nonatomic,retain)NSString * des5;
@property(nonatomic,retain)NSString * des;
@property(nonatomic,retain)NSMutableArray * heroArray;
@property(nonatomic,retain)NSMutableArray * desArray;
- (NSArray *)getHeros;
- (NSArray *)getDes;
@end
