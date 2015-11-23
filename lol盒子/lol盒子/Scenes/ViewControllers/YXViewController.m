//
//  YXViewController.m
//  lol盒子
//
//  Created by 贺聪 on 15/11/19.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "YXViewController.h"
#import "MyHeroTableViewController.h"
#import "FreeHeroCollectionViewController.h"
#import "AllHeroCollectionViewController.h"
#import "MyHeroViewController.h"

@interface YXViewController ()

@end

@implementation YXViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
    FreeHeroCollectionViewController * freeHeroVC = [[FreeHeroCollectionViewController alloc]initWithCollectionViewLayout:layout];
    MyHeroViewController * myHero = [[MyHeroViewController alloc]init];
    
    MyHeroTableViewController * myHeroVC = [[MyHeroTableViewController alloc]initWithStyle:UITableViewStyleGrouped];
    AllHeroCollectionViewController * allHeroVC = [[AllHeroCollectionViewController alloc]initWithCollectionViewLayout:layout];
    self.viewControllers = @[freeHeroVC,myHero,allHeroVC];

   
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"首页" style:UIBarButtonItemStylePlain target:self action:@selector(pop:)];
    
}

-(void)pop:(UIBarButtonItem*)sender{
    [self.navigationController popViewControllerAnimated:YES];
    
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
