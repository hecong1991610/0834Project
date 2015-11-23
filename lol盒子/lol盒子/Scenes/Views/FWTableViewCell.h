//
//  FWTableViewCell.h
//  lol盒子
//
//  Created by lanou3g on 15/11/17.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FuWen.h"

@interface FWTableViewCell : UITableViewCell

@property(nonatomic,retain)FuWen * fuWen;
@property(nonatomic,retain)UIImageView * imgView;
@property(nonatomic,retain)UILabel * name;
@property(nonatomic,retain)UILabel * iplev;
@property(nonatomic,retain)UILabel * prop;






@end
