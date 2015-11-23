//
//  FreeHeroCollectionViewCell.h
//  lol盒子
//
//  Created by 贺聪 on 15/11/19.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FreeHero.h"

@interface FreeHeroCollectionViewCell : UICollectionViewCell
@property(nonatomic,retain)UIImageView * heroImg;
@property(nonatomic,retain)UILabel * cnName;
@property(nonatomic,retain)UILabel * title;
@property(nonatomic,retain)UILabel * location;
@property(nonatomic,retain)FreeHero * freeHero;
@end
