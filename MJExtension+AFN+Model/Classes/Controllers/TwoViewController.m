//
//  TwoViewController.m
//  通用框架
//
//  Created by owen on 2016/11/5.
//  Copyright © 2016年 owen. All rights reserved.
//

#import "TwoViewController.h"
#import "OneViewController.h"

@interface TwoViewController ()

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor yellowColor];
    self.title = @"测试Two";

    /*
     注意:
     1.这里的self.titleString从上个控制跳过来的时候,已经先初始化并赋值了,所以直接拿过来使用就可以;
       并不需要再次初始化OneViewController,然后self.titleString=OneViewController的某个属性,
       这样是不对的,控制器再次初始化,是新的控制器,里边空空如也,什么都没有,切记
     */
    NSLog(@"我接收到了值:===>%@",self.titleString);

}



@end
