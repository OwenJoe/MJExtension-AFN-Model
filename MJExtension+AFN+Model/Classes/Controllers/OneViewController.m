//
//  OneViewController.m
//  通用框架
//
//  Created by owen on 2016/11/5.
//  Copyright © 2016年 owen. All rights reserved.
//

#import "OneViewController.h"
#import "HttpRequestManager.h"
#import "OneModel.h"
#import "OneTableViewCell.h"
#import "TwoViewController.h"
#import "MJExtension.h"

@interface OneViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *wbTableView;
@property (nonatomic,strong) OneTableViewCell *oneCell;
@property (nonatomic,strong) OneModel *model;
@property (nonatomic,strong) NSMutableArray *cityArry;
@end

@implementation OneViewController

-(OneModel *)model{

    if (!_model) {
        _model = [[OneModel alloc]init];
    }
    return _model;
}

-(NSMutableArray *)cityArry{

    if (!_cityArry) {
        _cityArry = [NSMutableArray array];
    }
    return _cityArry;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"测试One";
    [self requestDataFromServer];
    
    [self addTableViewMethod];
}

#pragma mark -- 初始化一个TableView
-(void)addTableViewMethod{

    self.wbTableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    self.wbTableView.delegate = self;
    self.wbTableView.dataSource =self;
    [self.view addSubview:self.wbTableView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return self.cityArry.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString *iDs = @"cell";
    OneTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:iDs];
    if (!cell) {
        cell = [[OneTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:iDs];
    }
    
    //将模型进行赋值
    self.model =self.cityArry[indexPath.row];
    cell.cellModel = self.model;
    return cell;
}


#pragma mark -- 点击传模型到下个控制器
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

  
    TwoViewController *twoVc = [[TwoViewController alloc]init];

    /*
     注意:
     1.这里有两点,直接用NSString类型=模型的某个属性值,是没有问题的,
       如果用的是UILable的值= 模型的某个属性值,要先记得将UILable初始化,否则值为空,很容易忘记这一点
     
     */
    self.model = self.cityArry[indexPath.row];
    twoVc.titleString = [NSString stringWithFormat:@"%@",self.model.city_name];
    [self.navigationController pushViewController:twoVc animated:YES];
   
}


#pragma mark - 数据请求
- (void)requestDataFromServer
{
    NSString *urlStr = [NSString stringWithFormat:@"http://apis.baidu.com/baidunuomi/openapi/cities"];
    NSMutableDictionary *headDict = [[NSMutableDictionary alloc] init];
    [headDict setObject:@"2304cdaee07aa52690475edf3776cce6" forKey:@"apikey"];
    [HttpRequestManager HttpGetCallack:urlStr Parameters:nil headers:headDict success:^(id responseObject) {
        
//        NSLog(@"成功回调:==>%@",responseObject);
        
        //拿到字典数组
        NSArray *arry = responseObject[@"cities"];
        //字典数组变成模型数组
        NSArray *brry = [OneModel objectArrayWithKeyValuesArray:arry];
        //添加到数组
        [self.cityArry addObjectsFromArray:brry];
        //刷新
        [self.wbTableView reloadData];
        
    } failure:^(NSError *error) {
        NSLog(@"网络不给力");
    }];
    
}

















@end
