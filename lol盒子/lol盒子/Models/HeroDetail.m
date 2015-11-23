//
//  HeroDetail.m
//  lol盒子
//
//  Created by 贺聪 on 15/11/20.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "HeroDetail.h"

@implementation HeroDetail
-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"description"]) {
        _des = value;
    }
    if ([key isEqualToString:[NSString stringWithFormat:@"%@_Q",_name]]) {
        _Q = value;
    }
    if ([key isEqualToString:[NSString stringWithFormat:@"%@_B",_name]]) {
        _B = value;
    }
    if ([key isEqualToString:[NSString stringWithFormat:@"%@_W",_name]]) {
        _W = value;
    }
    if ([key isEqualToString:[NSString stringWithFormat:@"%@_E",_name]]) {
        _E = value;
    }
    if ([key isEqualToString:[NSString stringWithFormat:@"%@_R",_name]]) {
        _R = value;
    }
    
}
@end
