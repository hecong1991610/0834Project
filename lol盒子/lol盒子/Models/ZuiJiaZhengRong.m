//
//  ZuiJiaZhengRong.m
//  lol盒子
//
//  Created by lanou3g on 15/11/17.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "ZuiJiaZhengRong.h"

@implementation ZuiJiaZhengRong

-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
}
- (NSArray *)getHeros{
    NSArray *array = @[_hero1,_hero2,_hero3,_hero4,_hero5];
    return array;
}

- (NSArray *)getDes{
    NSArray *array = @[_des1,_des2,_des3,_des4,_des5];
    return array;
}
@end
