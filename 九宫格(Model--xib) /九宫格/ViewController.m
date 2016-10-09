//
//  ViewController.m
//  九宫格
//
//  Created by MichaelLi on 2016/9/30.
//  Copyright © 2016年 手持POS机. All rights reserved.
//

#import "ViewController.h"
#import "AppModel.h"
#import "YellowView.h"
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
            CGFloat x = margin*(column+1) +width*column;
            CGFloat y = margin*(row+1) +height*row;

        /*
         通过xib设置yellowView
         */
            //现在View上布局一个黄色的View
        //加载nib
        YellowView *yellowView = [[[NSBundle mainBundle] loadNibNamed:@"YellowView" owner:nil options:nil]lastObject];
        [yellowView setFrame:CGRectMake(x, y, width, height)];
            [self.view addSubview:yellowView];

        AppModel *appModel = self.dataArray[i];

        yellowView.appModel = appModel;
//        UIImageView *imageView = (UIImageView *)[yellowView viewWithTag:10];
//        imageView.image = [UIImage imageNamed:appModel.icon];
//        UILabel *label = (UILabel *)[yellowView viewWithTag:11];
//        label.text = appModel.name;

    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
