//
//  MyHeroViewController.m
//  lol盒子
//
//  Created by 贺聪 on 15/11/23.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "MyHeroViewController.h"
#import "MyHeroTableViewController.h"

@interface MyHeroViewController ()

@end

@implementation MyHeroViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.image = [[UIImage imageNamed:@"3"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        self.title = @"我的英雄";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.regional = [[LTView alloc]initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width-200)/2, 150, 200, 40) text:@"分区名" placeholder:@"请输入分区名"];
    [self.view addSubview:_regional];
    self.name = [[LTView alloc]initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width-200)/2, 200, 200, 40) text:@"游戏名" placeholder:@"请输入游戏名"];
    [self.view addSubview:_name];
    UIButton * seek = [UIButton buttonWithType:UIButtonTypeCustom];
    seek.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - 200)/2, 270,200, 40);
    [seek setTitle:@"查看我的英雄" forState:UIControlStateNormal];
    [seek setTitleColor:[UIColor colorWithRed:0.110 green:0.623 blue:1.000 alpha:1.000] forState:UIControlStateNormal];
    [seek addTarget:self action:@selector(presentView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:seek];
    
    
}

-(void)presentView:(UIButton *)sender{
    MyHeroTableViewController * myHeroVC = [[MyHeroTableViewController alloc]init];
    myHeroVC.regional = _regional.textField.text;
    myHeroVC.name = _name.textField.text;
    [self.navigationController pushViewController:myHeroVC animated:YES];
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
