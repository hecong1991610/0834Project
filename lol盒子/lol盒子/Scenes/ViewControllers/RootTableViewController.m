//
//  RootTableViewController.m
//  lol盒子
//
//  Created by lanou3g on 15/11/16.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "RootTableViewController.h"
#import "ZBTableViewController.h"
#import "TFViewController.h"
#import "FWTableViewController.h"
#import "ZJZRTableViewController.h"
#import "JNCollectionViewController.h"
#import "YXViewController.h"
#import <YAScrollSegmentControl/YAScrollSegmentControl.h>
#import "ZiXun.h"
#import "ZiXunTableViewCell.h"
#import "Headerline.h"


@interface RootTableViewController ()<YAScrollSegmentControlDelegate>
@property(nonatomic,retain)NSMutableArray * dataArray;
@property(nonatomic,retain)YAScrollSegmentControl *segmentControl;
@property(nonatomic,retain)NSMutableArray * headerlineArray;
@property(nonatomic,retain)ZiXun * ziXun;
@property(nonatomic,retain)Headerline * headerline;
@property(nonatomic,retain)UIView * headView;
@property(nonatomic,retain)UIScrollView * scrollView;
@property(nonatomic,retain)UIPageControl * page;
@property(nonatomic,retain)NSTimer * timer;
@end

@implementation RootTableViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.dataArray = [NSMutableArray array];
    self.headerlineArray = [NSMutableArray array];
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
//    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName : [UIColor whiteColor]}];
    self.navigationController.navigationBar.translucent = NO;
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //实际返回文本是HTML格式的,但是数据是json格式的
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager GET:kZXUrl parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSLog(@"成功了");
        NSDictionary * dic = responseObject;
        NSArray * dataArray = dic[@"data"];
        NSArray * headerlineArray = dic[@"headerline"];
        for (NSDictionary * dic in dataArray) {
            self.ziXun = [[ZiXun alloc]init];
            [_ziXun setValuesForKeysWithDictionary:dic];
            [self.dataArray addObject:_ziXun];
        }
        for (NSDictionary * dic in headerlineArray) {
            self.headerline = [[Headerline alloc]init];
            [_headerline setValuesForKeysWithDictionary:dic];
            [self.headerlineArray addObject:_headerline.photo];
        }
        
        //添加滑动图片
        UIImageView * imgView1 = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width*0.5)];
        [imgView1 sd_setImageWithURL:[NSURL URLWithString:_headerlineArray[4]]];
        [_scrollView addSubview:imgView1];
        
        UIImageView * imgView2 = [[UIImageView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width*6, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width*0.5)];
        [imgView2 sd_setImageWithURL:[NSURL URLWithString:_headerlineArray[0]]];
        [_scrollView addSubview:imgView2];
        
        for (int i = 0; i < _headerlineArray.count; i++) {
            UIImageView * imgView = [[UIImageView alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width * (i+1), 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width*0.5)];
            [imgView sd_setImageWithURL:[NSURL URLWithString:_headerlineArray[i]]];
            [_scrollView addSubview:imgView];
        }
        
        [self.tableView reloadData];
        
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"失败了,%@",error);
    }];
    
    [self.tableView registerClass:[ZiXunTableViewCell class] forCellReuseIdentifier:@"cell"];
    [self segmentTitle];
    self.headView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width*0.5 + 40)];
    [_headView addSubview:_segmentControl];
    self.tableView.tableHeaderView =_headView;
    
    [self addScrollView];
    
    self.timer=[NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(nextImge) userInfo:nil repeats:YES];
    //当页面正在操作其他控件，继续执行当前轮换.将 NSDefaultRunLoopMode 改为 NSRunLoopCommonModes
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    [runloop addTimer:_timer forMode:NSRunLoopCommonModes];
    
}

-(void)nextImge{
    NSInteger page = self.page.currentPage;
    if (page==self.page.numberOfPages-1) {
        page = 0;
        self.scrollView.contentOffset = CGPointMake((page + 1) * self.scrollView.frame.size.width, 0);
    }
    else
    {
        page++;
    }
    //同时设置page
    self.page.currentPage = page;
    [self.scrollView setContentOffset:CGPointMake((page + 1) * self.scrollView.frame.size.width, 0) animated:YES];
    
}



-(void)addScrollView{
    _scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 40, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.width*0.5)];
    _scrollView.contentSize = CGSizeMake([UIScreen mainScreen].bounds.size.width * 7, [UIScreen mainScreen].bounds.size.width*0.5);
    _scrollView.pagingEnabled = YES;//分页滑动
    _scrollView.showsHorizontalScrollIndicator = NO;//横向条
    _scrollView.showsVerticalScrollIndicator = NO;//竖向条
    _scrollView.delegate = self;
    _scrollView.contentOffset = CGPointMake([UIScreen mainScreen].bounds.size.width, 0);//设置偏移量
    
    [_headView addSubview:_scrollView];
    
    self.page = [[UIPageControl alloc]initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 100, 40, 100, 20)];
    _page.numberOfPages = 5;//点数
    _page.currentPage = 0;//默认在哪

    [_page addTarget:self action:@selector(pageClick:) forControlEvents:UIControlEventValueChanged];
    [_headView addSubview:_page];

}

-(void)pageClick:(UIPageControl *)sender{
    self.scrollView.contentOffset = CGPointMake((sender.currentPage + 1) * [UIScreen mainScreen].bounds.size.width, 0);
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    self.page.currentPage = self.scrollView.contentOffset.x/[UIScreen mainScreen].bounds.size.width - 1;
    if (self.scrollView.contentOffset.x == 0) {
        self.scrollView.contentOffset = CGPointMake([UIScreen mainScreen].bounds.size.width * 5, 0);
        _page.currentPage = 4;
    }
    if (self.scrollView.contentOffset.x == [UIScreen mainScreen].bounds.size.width * 6) {
        self.scrollView.contentOffset = CGPointMake([UIScreen mainScreen].bounds.size.width, 0);
        _page.currentPage = 0;
    }
    for (int i = 0; i < 6; i++) {
        self.scrollView.zoomScale = 1;
    }
}


- (void)segmentTitle {
    if ([self.view viewWithTag:111]) {
        [[self.view viewWithTag:111] removeFromSuperview];
    }
    self.segmentControl = [[YAScrollSegmentControl alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 40)];
    _segmentControl.buttons = @[@"首页",@"装备",@"最佳阵容",@"召唤师技能",@"英雄"];
    _segmentControl.delegate = self;
    _segmentControl.tag = 111;
    [_segmentControl setTitleColor:[UIColor blueColor] forState:UIControlStateSelected];
    _segmentControl.gradientColor = [UIColor colorWithRed:0.158 green:0.630 blue:1.000 alpha:1.000];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return _dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ZiXunTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    _ziXun = _dataArray[indexPath.row];
    cell.ziXun = _ziXun;
    cell.selectionStyle = UITableViewCellEditingStyleNone;//让tableView被点击时不变灰

    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 95;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    

    
    
    
    
}

-(void)didSelectItemAtIndex:(NSInteger)index{
    if (index == 0) {
        [self.navigationController popViewControllerAnimated:YES];
    } else if (index == 1) {
        ZBTableViewController * ZBVC = [[ZBTableViewController alloc]initWithStyle:UITableViewStylePlain];
        [self.navigationController pushViewController:ZBVC animated:YES];
    }else if(index == 2){
        ZJZRTableViewController * ZJZRVC = [[ZJZRTableViewController alloc]initWithStyle:UITableViewStylePlain];
        [self.navigationController pushViewController:ZJZRVC animated:YES];
    }else if (index == 3){
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        JNCollectionViewController * JNVC = [[JNCollectionViewController alloc]initWithCollectionViewLayout:layout];
        JNVC.view.backgroundColor = [UIColor whiteColor];
        [self.navigationController pushViewController:JNVC animated:YES];
    }else if(index == 4){
        YXViewController * YXVC = [[YXViewController alloc]init];
        [self.navigationController pushViewController:YXVC animated:YES];
    }

}

-(void)test{
    NSLog(@"github");
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
