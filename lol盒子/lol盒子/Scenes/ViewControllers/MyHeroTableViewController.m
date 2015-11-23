//
//  MyHeroTableViewController.m
//  lol盒子
//
//  Created by 贺聪 on 15/11/19.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "MyHeroTableViewController.h"
#import "MyHeroTableViewCell.h"
#import "YXXQViewController.h"

@interface MyHeroTableViewController ()
@property(nonatomic,retain)NSMutableDictionary * dic;
@property(nonatomic,retain)NSMutableArray * array;
@property(nonatomic,retain)NSString * string;
@property(nonatomic,retain)FreeHero * freeHero;
@end

@implementation MyHeroTableViewController

-(instancetype)initWithStyle:(UITableViewStyle)style{
    if ([super initWithStyle:style]) {
        self.title = @"我的英雄";
        self.tabBarItem.image = [[UIImage imageNamed:@"3"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"我的英雄";
    
    [self.tableView registerClass:[MyHeroTableViewCell class] forCellReuseIdentifier:@"cell"];
    NSString * urlString =[NSString stringWithFormat:@"http://lolbox.duowan.com/phone/apiMyHeroes.php?serverName=%@&OSType=iOS8.3&target=%@&v=108",_regional,_name];
    NSString* encodedString = [urlString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];//网址中有中文 必须进行UTF8转码
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //实际返回文本是HTML格式的,但是数据是json格式的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager GET:encodedString parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSLog(@"成功了");
        self.dic = responseObject;
        _string = _dic[@"serverName"];
        NSArray * array = [NSArray arrayWithArray:_dic[@"myHeroes"]];
        _array = [NSMutableArray array];
        for (NSDictionary * dic in array) {
            self.freeHero = [[FreeHero alloc]init];
            [_freeHero setValuesForKeysWithDictionary:dic];
            [_array addObject:_freeHero];
            [self.tableView reloadData];
        }
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"失败了");
        UIAlertController * alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"大区或角色名不正确" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction * alertAciton1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            [self.navigationController popViewControllerAnimated:YES];
        }];
        [alert addAction:alertAciton1];
        [self presentViewController:alert animated:YES completion:^{
            
        }];

        
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    NSLog(@"%ld",_array.count);
    return _array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MyHeroTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    _freeHero = _array[indexPath.row];
    cell.freeHero = _freeHero;
    
    
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    YXXQViewController * YXXQVC = [[YXXQViewController alloc]init];
    _freeHero = _array[indexPath.row];
    YXXQVC.title = _freeHero.title;
    YXXQVC.enName = _freeHero.enName;
    [self.navigationController pushViewController:YXXQVC animated:YES];
    
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"*胜率为最近90次的胜率";
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
