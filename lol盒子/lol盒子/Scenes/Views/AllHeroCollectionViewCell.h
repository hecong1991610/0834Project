//
//  AllHeroCollectionViewCell.h
//  lol盒子
//
//  Created by 贺聪 on 15/11/19.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FreeHero.h"

@interface AllHeroCollectionViewCell : UICollectionViewCell
@property(nonatomic,retain)UILabel * title;
@property(nonatomic,retain)UIImageView * heroImgView;
@property(nonatomic,retain)FreeHero * hero;
@end
