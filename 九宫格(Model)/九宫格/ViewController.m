//
//  ViewController.m
//  九宫格
//
//  Created by MichaelLi on 2016/9/30.
//  Copyright © 2016年 手持POS机. All rights reserved.
//

#import "ViewController.h"
#import "AppModel.h"
@interface ViewController ()
@property(nonatomic,strong)NSArray *dataArray;
@end

@implementation ViewController
//列
#define kColumn  4
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self yellowView];
    NSLog(@"%f %f",self.view.frame.size.width,self.view.frame.size.height);
    self.view.backgroundColor = [UIColor colorWithRed:0.537 green:0.876 blue:0.999 alpha:1.000];

    for (int i  = 0; i < self.dataArray.count; i++) {
         NSLog(@"第%d行 第%d列",i/4,i%4);
    }
}

-(NSArray *)dataArray
{
    if (nil ==_dataArray) {

        //读取文件路径
        NSString *filePath = [[NSBundle mainBundle]pathForResource:@"app.plist" ofType:nil];
        //读取文件到临时数组中
        NSArray *temp = [NSArray arrayWithContentsOfFile:filePath];

        NSMutableArray *arrayM = [NSMutableArray array];
        for (NSDictionary *dict in temp) {

//            //实例化AppModel
//            AppModel *appModel = [[AppModel alloc]init];
//            appModel.icon = dict[@"icon"];
//            appModel.name = dict[@"name"];
            //通过对象方法可以省略上文赋值
            AppModel *appModel = [[AppModel alloc]initWithDict:dict];
            //添加到可变数组
            [arrayM addObject:appModel];
        }

        _dataArray = arrayM;
        NSLog(@"%lu",(unsigned long)self.dataArray.count);
    }
    return _dataArray;
}

-(void)yellowView
{
    CGFloat margin = 33.6;
    CGFloat width = 150;
    CGFloat height = width;
    //遍历dataArray



    for (int i = 0; i <self.dataArray.count; i++) {//行数


            //行数
            NSInteger row = i/kColumn;
            //列
            NSInteger column = i%kColumn;
            //取出数组对应的字典
//             NSDictionary *dict = self.dataArray[i];
        AppModel *appModel = self.dataArray[i];
            CGFloat x = margin*(column+1) +width*column;
            CGFloat y = margin*(row+1) +height*row;
            //        CGFloat y = margin*()
            //现在View上布局一个黄色的View
            UIView *yellowView = [[UIView alloc]initWithFrame:CGRectMake(x, y, width, height)];
//            yellowView.backgroundColor = [UIColor yellowColor];
            [self.view addSubview:yellowView];

            /*
             在View上添加控件
             */
            //添加icon
            
            CGFloat redWidth = 80;
            CGFloat redX = (width - redWidth)/2;
            CGFloat kTop = 10;
            UIImageView *redView = [[UIImageView alloc]initWithFrame:CGRectMake(redX, kTop, redWidth, redWidth)];

//            redView.backgroundColor = [UIColor redColor];

//            redView.image = [UIImage imageNamed:dict[@"icon"]];
        redView.image = [UIImage imageNamed:appModel.icon];
            [yellowView addSubview:redView];

            //添加Label

            CGFloat labelX = 0;
//            CGFloat labelY = kTop +redWidth;
            CGFloat labelY = CGRectGetMaxY(redView.frame);
            CGFloat labelWidth = width;
            CGFloat labelHeight = 25;
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(labelX, labelY, labelWidth, labelHeight)];
//            label.text = dict[@"name"];
        label.text = appModel.name;
            label.textAlignment = NSTextAlignmentCenter;
            label.font = [UIFont systemFontOfSize:17];
//            label.backgroundColor = [UIColor brownColor];
            [yellowView addSubview:label];

            //添加下载进度条---button

            CGFloat buttonX = redX -kTop/2;
            CGFloat buttonY = CGRectGetMaxY(label.frame);
            CGFloat buttonWidth = redWidth + kTop;
            CGFloat buttonHeight = 25;
            UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(buttonX, buttonY, buttonWidth, buttonHeight)];
            [button setBackgroundImage:[UIImage imageNamed:@"buttongreen"] forState:UIControlStateNormal];
            [button setBackgroundImage:[UIImage imageNamed:@"buttongreen_highlighted"] forState:UIControlStateHighlighted];
            [button setTitle:@"下载" forState:UIControlStateNormal];

            [yellowView addSubview:button];

    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
