//
//  ZiXunTableViewCell.m
//  lol盒子
//
//  Created by 贺聪 on 15/11/21.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "ZiXunTableViewCell.h"

@implementation ZiXunTableViewCell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.imgView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 10, [UIScreen mainScreen].bounds.size.width/5, [UIScreen mainScreen].bounds.size.width/5*0.75)];
        [self addSubview:_imgView];
        
        self.title = [[UILabel alloc]initWithFrame:CGRectMake(10 + [UIScreen mainScreen].bounds.size.width/5 , 5, [UIScreen mainScreen].bounds.size.width - _imgView.frame.size.width - 10, 20)];
        _title.font = [UIFont systemFontOfSize:15];
        [self addSubview:_title];
        
        self.content = [[UILabel alloc]initWithFrame:CGRectMake(10 + [UIScreen mainScreen].bounds.size.width/5 , 25, [UIScreen mainScreen].bounds.size.width - _imgView.frame.size.width - 10, 20)];
        _content.textColor = [UIColor grayColor];
        _content.font = [UIFont systemFontOfSize:13];
        [self addSubview:_content];
        
        self.time = [[UILabel alloc]initWithFrame:CGRectMake(10 + [UIScreen mainScreen].bounds.size.width/5, 45, [UIScreen mainScreen].bounds.size.width - _imgView.frame.size.width - 10, 15)];
        _time.textColor = [UIColor grayColor];
        _time.font = [UIFont systemFontOfSize:12];
        [self addSubview:_time];
        
        self.readCount = [[UILabel alloc]initWithFrame:CGRectMake(5, _imgView.frame.size.height+15, 100, 15)];
        _readCount.textColor = [UIColor grayColor];
        _readCount.font = [UIFont systemFontOfSize:12];
        [self addSubview:_readCount];
        
        self.commentSum = [[UILabel alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width-80, _imgView.frame.size.height+15, 100, 15)];
        _commentSum.textColor = [UIColor grayColor];
        _commentSum.font = [UIFont systemFontOfSize:12];
        
        [self addSubview:_commentSum];
        
        
    }
    return self;
}

-(void)setZiXun:(ZiXun *)ziXun{
    _ziXun = ziXun;
    [_imgView sd_setImageWithURL:[NSURL URLWithString:_ziXun.photo]];
    _title.text = _ziXun.title;
    _content.text = _ziXun.content;
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy年MM月dd日 HH:mm:ss"];
    NSString *dateLoca = [NSString stringWithFormat:@"%@",_ziXun.time];
    NSTimeInterval time=[dateLoca doubleValue];
    NSDate *detaildate=[NSDate dateWithTimeIntervalSince1970:time];
    NSString *timestr = [formatter stringFromDate:detaildate];
    _time.text = [NSString stringWithFormat:@"发布时间:%@",timestr];
    _readCount.text = [NSString stringWithFormat:@"观看人数:%@",ziXun.readCount];
    if ([_readCount.text isEqualToString:@""]) {
        _readCount.text = @"无";
    }
    _commentSum.text = [NSString stringWithFormat:@"评论:%@",ziXun.commentSum];

    if ([_commentSum.text isEqualToString:@""]) {
        _commentSum.text = @"无";
    }

}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
