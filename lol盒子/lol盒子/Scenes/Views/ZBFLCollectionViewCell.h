//
//  ZBFLCollectionViewCell.h
//  lol盒子
//
//  Created by lanou3g on 15/11/17.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBFL.h"
@class ZBFL;

@interface ZBFLCollectionViewCell : UICollectionViewCell
@property(nonatomic,retain)UIImageView * imgView;
@property(nonatomic,retain)UILabel * label;
@property(nonatomic,retain)ZBFL * zbfl;
@end
