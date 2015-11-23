//
//  ZBFLCollectionViewController.h
//  lol盒子
//
//  Created by lanou3g on 15/11/17.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZBFL;
#import "ZBFL.h"

@interface ZBFLCollectionViewController : UICollectionViewController
@property(nonatomic,retain)NSString * url;
@property(nonatomic,retain)ZBFL * zbfl;
@end
