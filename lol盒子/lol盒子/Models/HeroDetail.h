//
//  HeroDetail.h
//  lol盒子
//
//  Created by 贺聪 on 15/11/20.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HeroDetail : NSObject
@property(nonatomic,retain)NSString * id;
@property(nonatomic,retain)NSString * name;
@property(nonatomic,retain)NSString * desplayName;
@property(nonatomic,retain)NSString * title;
@property(nonatomic,retain)NSString * iconPath;
@property(nonatomic,retain)NSString * portraitPath;
@property(nonatomic,retain)NSString * danceVideoPath;
@property(nonatomic,retain)NSString * tags;
@property(nonatomic,retain)NSString * des;
@property(nonatomic,retain)NSString * quote;
@property(nonatomic,retain)NSString * quoteAuthor;
@property(nonatomic,retain)NSString * range;
@property(nonatomic,retain)NSString * moveSpeed;
@property(nonatomic,retain)NSString * armorBase;
@property(nonatomic,retain)NSString * armorLevel;
@property(nonatomic,retain)NSString * manaBase;
@property(nonatomic,retain)NSString * manaLevel;
@property(nonatomic,retain)NSString * criticalChanceBase;
@property(nonatomic,retain)NSString * criticalChanceLevel;
@property(nonatomic,retain)NSString * manaRegenBase;
@property(nonatomic,retain)NSString * manaRegenLevel;
@property(nonatomic,retain)NSString * healthRegenBase;
@property(nonatomic,retain)NSString * healthRegenLevel;
@property(nonatomic,retain)NSString * magicResistBase;
@property(nonatomic,retain)NSString * magicResistLevel;
@property(nonatomic,retain)NSString * healthBase;
@property(nonatomic,retain)NSString * healthLevel;
@property(nonatomic,retain)NSString * attackBase;
@property(nonatomic,retain)NSString * attackLevel;
@property(nonatomic,retain)NSString * ratingDefense;
@property(nonatomic,retain)NSString * ratingMagic;
@property(nonatomic,retain)NSString * ratingDifficulty;
@property(nonatomic,retain)NSString * ratingAttack;
@property(nonatomic,retain)NSString * tips;
@property(nonatomic,retain)NSString * opponentTips;
@property(nonatomic,retain)NSString * selectSoundPath;
@property(nonatomic,retain)NSString * price;
@property(nonatomic,retain)NSArray * like;
@property(nonatomic,retain)NSArray * hate;
@property(nonatomic,retain)NSDictionary * B;
@property(nonatomic,retain)NSDictionary * Q;
@property(nonatomic,retain)NSDictionary * W;
@property(nonatomic,retain)NSDictionary * E;
@property(nonatomic,retain)NSDictionary * R;

@end
