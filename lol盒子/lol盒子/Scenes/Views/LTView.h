//
//  LTView.h
//  UI03_LTView
//
//  Created by lanou3g on 15/9/30.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LTView : UIView
@property(nonatomic,retain)UILabel * label;
@property(nonatomic,retain)UITextField * textField;

-(id)initWithFrame:(CGRect)frame text:(NSString *)text placeholder:(NSString *)placeholder;
@end
