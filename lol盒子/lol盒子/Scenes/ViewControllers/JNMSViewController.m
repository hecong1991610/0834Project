//
//  JNMSViewController.m
//  lol盒子
//
//  Created by 贺聪 on 15/11/19.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "JNMSViewController.h"

@interface JNMSViewController ()

@end

@implementation JNMSViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"召唤师技能";
    _imgView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 70, 70)];
    [_imgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/spells/png/%d.png",[_jineng.id intValue]]]];
    [self.view addSubview:_imgView];
    _name = [[UILabel alloc]initWithFrame:CGRectMake(80, 5, 200, 20)];
    _name.text = _jineng.name;
    [self.view addSubview:_name];
    _level = [[UILabel alloc]initWithFrame:CGRectMake(80, 30, 200, 15)];
    _level.font = [UIFont systemFontOfSize:13];
    _level.textColor = [UIColor colorWithWhite:0.599 alpha:1.000];
    _level.text = [NSString stringWithFormat:@"需要等级:%@级",_jineng.level];
    [self.view addSubview:_level];
    _cooldown = [[UILabel alloc]initWithFrame:CGRectMake(80, 50, 200, 15)];
    _cooldown.font = [UIFont systemFontOfSize:13];
    _cooldown.textColor = [UIColor colorWithWhite:0.586 alpha:1.000];
    _cooldown.text = [NSString stringWithFormat:@"冷却时间:%@秒",_jineng.cooldown];
    [self.view addSubview:_cooldown];
    UILabel * des = [[UILabel alloc]initWithFrame:CGRectMake(5, 100, 50, 15)];
    des.text = @"描述";
    des.textColor = [UIColor colorWithWhite:0.599 alpha:1.000];
    des.font = [UIFont systemFontOfSize:13];
    [self.view addSubview:des];
    _des = [[UILabel alloc]initWithFrame:CGRectMake(5, 115, [UIScreen mainScreen].bounds.size.width-10, 1000)];
    _des.numberOfLines = 0;
    _des.font = [UIFont systemFontOfSize:15];
    _des.text = _jineng.des;
    CGSize desSize = [_des.text sizeWithFont:_des.font constrainedToSize:_des.frame.size lineBreakMode:_des.lineBreakMode];
    _des.frame = CGRectMake(5, 115, [UIScreen mainScreen].bounds.size.width-10, desSize.height);
    [self.view addSubview:_des];
    UILabel * strong = [[UILabel alloc]initWithFrame:CGRectMake(5, 120+_des.frame.size.height, 80, 15)];
    strong.textColor = [UIColor colorWithWhite:0.599 alpha:1.000];
    strong.font = [UIFont systemFontOfSize:13];
    strong.text = @"天赋强化";
    [self.view addSubview:strong];
    _strong = [[UILabel alloc]initWithFrame:CGRectMake(5, 120+_des.frame.size.height+15, [UIScreen mainScreen].bounds.size.width-10, 20)];
    _strong.font = [UIFont systemFontOfSize:15];
    _strong.numberOfLines = 0;
    _strong.text = _jineng.strong;
    CGSize strongSize = [_strong.text sizeWithFont:_strong.font constrainedToSize:_strong.frame.size lineBreakMode:_strong.lineBreakMode];
    _strong.frame = CGRectMake(5, 120+_des.frame.size.height+15, [UIScreen mainScreen].bounds.size.width-10, strongSize.height);
    [self.view addSubview:_strong];
    UILabel * tips = [[UILabel alloc]initWithFrame:CGRectMake(5, 135+_des.frame.size.height+_strong.frame.size.height, 80, 20)];
    tips.textColor = [UIColor colorWithWhite:0.599 alpha:1.000];
    tips.font = [UIFont systemFontOfSize:13];
    tips.text = @"提示";
    [self.view addSubview:tips];
    _tips = [[UILabel alloc]initWithFrame:CGRectMake(5, 155+_des.frame.size.height+_strong.frame.size.height, [UIScreen mainScreen].bounds.size.width-10, 130)];
    _tips.numberOfLines = 0;
    _tips.font = [UIFont systemFontOfSize:15];
    _tips.text = _jineng.tips;
    CGSize tipsSize = [_tips.text sizeWithFont:_tips.font constrainedToSize:_tips.frame.size lineBreakMode:_tips.lineBreakMode];
    _tips.frame = CGRectMake(5, 155+_des.frame.size.height+_strong.frame.size.height, [UIScreen mainScreen].bounds.size.width-10, tipsSize.height);
    [self.view addSubview:_tips];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
