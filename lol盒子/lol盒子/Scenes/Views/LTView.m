//
//  LTView.m
//  UI03_LTView
//
//  Created by lanou3g on 15/9/30.
//  Copyright (c) 2015年 lanou3g. All rights reserved.
//

#import "LTView.h"
#define kWidth frame.size.width
#define kHeight frame.size.height
#define X frame.origin.x
#define Y frame.origin.y
@implementation LTView

-(id)initWithFrame:(CGRect)frame text:(NSString *)text placeholder:(NSString *)placeholder{
    self = [super initWithFrame:frame];
    if (self) {
        self.label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kWidth/3.0, kHeight)];
        _label.text = text;
        [self addSubview:_label];
        
        self.textField = [[UITextField alloc]initWithFrame:CGRectMake(_label.kWidth, 0, kWidth/3.0*2, kHeight)];
        _textField.placeholder = placeholder;
        _textField.clearButtonMode = UITextFieldViewModeAlways;//清除按钮
        _textField.borderStyle = UITextBorderStyleRoundedRect;
        [self addSubview:_textField];

    }
    return self;
}



@end
