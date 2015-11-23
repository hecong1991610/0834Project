//
//  YXXQViewController.m
//  lol盒子
//
//  Created by 贺聪 on 15/11/20.
//  Copyright © 2015年 lanou3g. All rights reserved.
//

#import "YXXQViewController.h"
#import "HeroDetail.h"
#import "SkillsTableViewCell.h"

@interface YXXQViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,retain)NSDictionary * dic;
@property(nonatomic,retain)HeroDetail * heroDetail;
@property(nonatomic,retain)UITableView * tableView;
@property(nonatomic,retain)NSArray * array;
@property(nonatomic,retain)NSDictionary * skillsDic;
@property(nonatomic,retain)NSString * string;
@property(nonatomic,retain)NSArray * QWER;

@end

@implementation YXXQViewController
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        self.QWER = @[@"B",@"Q",@"W",@"E",@"R"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self dataParsing];
    NSLog(@"%@",_dic);
    self.heroImgView = [[UIImageView alloc]initWithFrame:CGRectMake(5, 5, 60, 60)];
    _heroImgView.backgroundColor = [UIColor yellowColor];
    [_heroImgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/champions/%@_120x120.jpg",_enName]]];
    [self.view addSubview:_heroImgView];
    
    self.titleName = [[UILabel alloc]initWithFrame:CGRectMake(75, 5, 70, 25)];
    [self.view addSubview:_titleName];
    
    self.tags = [[UILabel alloc]initWithFrame:CGRectMake(150, 5, 50, 25)];
    _tags.textAlignment = NSTextAlignmentCenter;
    _tags.backgroundColor = [UIColor colorWithRed:0.100 green:0.275 blue:0.560 alpha:1.000]
    ;
    _tags.font = [UIFont systemFontOfSize:15];
    _tags.textColor = [UIColor whiteColor];
    _tags.layer.masksToBounds = YES;
    _tags.layer.cornerRadius = 5;
    
    self.price = [[UILabel alloc]initWithFrame:CGRectMake(75, 30, 150, 20)];
    _price.font = [UIFont systemFontOfSize:13];
    _price.textColor = [UIColor colorWithWhite:0.623 alpha:1.000];
    [self.view addSubview:_price];
    
    self.property = [[UILabel alloc]initWithFrame:CGRectMake(75, 50, 150, 20)];
    _property.font = [UIFont systemFontOfSize:13];
    _property.textColor = [UIColor colorWithWhite:0.623 alpha:1.000];
    [self.view addSubview:_property];

    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 80, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height - 80) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[SkillsTableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:_tableView];

    



}

-(void)dataParsing{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    //实际返回文本是HTML格式的,但是数据是json格式的

    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [manager GET:[NSString stringWithFormat:@"http://lolbox.duowan.com/phone/apiHeroDetail.php?OSType=iOS8.3&heroName=%@&v=108",_enName] parameters:nil success:^(AFHTTPRequestOperation * _Nonnull operation, id  _Nonnull responseObject) {
        NSLog(@"成功了");
        self.dic = responseObject;
        _titleName.text = _dic[@"title"];
        _tags.text = _dic[@"tags"];
        NSLog(@"_tags = %@",_tags.text);
        if (![_tags.text isEqualToString:@""]) {
            [self.view addSubview:_tags];
        }
        NSString * string = _dic[@"price"];
        NSArray * array = [string componentsSeparatedByString:@","];
        
        _price.text = [NSString stringWithFormat:@"金币%@ 点卷%@",array[0],array[1]];
        _property.text = [NSString stringWithFormat:@"攻%@ 防%@ 法%@ 难度%@",_dic[@"ratingAttack"],_dic[@"ratingDefense"],_dic[@"ratingMagic"],_dic[@"ratingDifficulty"]];
        
        [self.tableView reloadData];
    
    } failure:^(AFHTTPRequestOperation * _Nullable operation, NSError * _Nonnull error) {
        NSLog(@"失败了,%@",error);
    }];

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return _QWER.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
     SkillsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    NSString * string =[NSString stringWithFormat:@"%@_%@",_enName,_QWER[indexPath.row]];
    [cell.skillsImgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://img.lolbox.duowan.com/abilities/%@_64x64.png?v=10&OSType=iOS7.0.3",string]]];
    cell.name.text = _dic[string][@"name"];
    cell.des.text = _dic[string][@"description"];
//    cell.des.frame = CGRectMake(50, 50, [UIScreen mainScreen].bounds.size.width - 60, [self textHeight:_dic[string][@"description"]]);
    cell.cost.text = _dic[string][@"cost"];
    cell.effect.text = _dic[string][@"effect"];
//    cell.effect.frame = CGRectMake(50, 50+cell.des.frame.size.height + cell.cost.frame.size.height + cell.cooldown.frame.size.height + cell.range.frame.size.height, [UIScreen mainScreen].bounds.size.width - 60, [self textHeight:_dic[string][@"effectr"]]);
    cell.cooldown.text = _dic[string][@"cooldown"];
    cell.range.text = _dic[string][@"range"];
    if ([cell.name.text isEqualToString:@""]) {
        cell.name.text = @"无";
    }
    if([cell.des.text isEqualToString:@""]){
        cell.des.text = @"无";
    }
    if ([cell.cost.text isEqualToString:@""]) {
        cell.cost.text = @"无";
    }
    if ([cell.effect.text isEqualToString:@""]) {
        cell.effect.text = @"无";
    }
    if([cell.cooldown.text isEqualToString:@""]){
        cell.cooldown.text = @"无";
    }
    if ([cell.range.text isEqualToString:@""]) {
        cell.range.text = @"无";
    }

    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"技能说明";
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString * string =[NSString stringWithFormat:@"%@_%@",_enName,_QWER[indexPath.row]];
    return [self textHeight:_dic[string][@"description"]] + [self textHeight:_dic[string][@"effect"]] + [self textHeight:_dic[string][@"name"]]+ [self textHeight:_dic[string][@"cost"]]+ [self textHeight:_dic[string][@"cooldown"]] + [self textHeight:_dic[string][@"range"]] + [self textHeight:_dic[string][@"cost"]]+200;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

//计算字符串的frame
-(CGFloat)textHeight:(NSString *)string{
    CGRect rect = [string boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 10, 10000000) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]} context:nil];
    //第一个参数 cell的宽度 ,第二个参数用origin  第三个参数字体大小
    return rect.size.height;
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
