//
//  ZRXQTableViewController.m
//  lol盒子
//
//  Created by lanou3g on 15/11/18.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "ZRXQTableViewController.h"
#import "ZRXQTableViewCell.h"
#import "ZJZRTableViewCell.h"

@interface ZRXQTableViewController ()
@property(nonatomic,retain)NSMutableArray * array;
@property(nonatomic,assign)CGFloat heroDesWidth;
@property(nonatomic,assign)CGFloat zhenRongWidth;
@end

@implementation ZRXQTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"阵容详情";
    [self.tableView registerClass:[ZJZRTableViewCell class] forCellReuseIdentifier:@"Cell"];
    [self.tableView registerClass:[ZRXQTableViewCell class] forCellReuseIdentifier:@"cell"];
    self.heroDesWidth = 246.0;
    self.zhenRongWidth = 310.0;

    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    if (section == 0) {
        return 1;
    }else if(section == 1){
        return 5;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        ZJZRTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
        cell.zuiJiaZhengRong = _zuiJiaZhengRong;
        self.zhenRongWidth = cell.des.frame.size.width;
        cell.des.frame = CGRectMake(5, [UIScreen mainScreen].bounds.size.width/5 +40, [UIScreen mainScreen].bounds.size.width - 10, [self textHeight:_zuiJiaZhengRong.des width:_zhenRongWidth]);
        NSLog(@"%f",cell.des.frame.size.width);
        return cell;
        
    }else if(indexPath.section == 1){
        ZRXQTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
        cell.heroName = [_zuiJiaZhengRong getHeros][indexPath.row];
        cell.heroDes = [_zuiJiaZhengRong getDes][indexPath.row];
        self.heroDesWidth = cell.des.frame.size.width;
        cell.des.frame = CGRectMake([UIScreen mainScreen].bounds.size.width/5 + 5, 5, [UIScreen mainScreen].bounds.size.width/5 * 4 - 10 , [self textHeight:[_zuiJiaZhengRong getDes][indexPath.row] width:_heroDesWidth]);
        NSLog(@"%f",cell.des.frame.size.width);
        return cell;
    }
    return nil;
}

//计算字符串的frame
-(CGFloat)textHeight:(NSString *)string width:(CGFloat)width{
    CGRect rect = [string boundingRectWithSize:CGSizeMake(width, 10000000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
    //第一个参数 cell的宽度 ,第二个参数用origin  第三个参数字体大小
    return rect.size.height;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return [self textHeight:_zuiJiaZhengRong.des width:_zhenRongWidth] + 15 + (_zhenRongWidth - 20) / 5 + 35;
    }else if(indexPath.section == 1){
        return [self textHeight:[_zuiJiaZhengRong getDes][indexPath.row] width:_heroDesWidth];
    }
    return 0;
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
