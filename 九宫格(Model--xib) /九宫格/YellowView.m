//
//  YellowView.m
//  九宫格
//
//  Created by MichaelLi on 2016/10/9.
//  Copyright © 2016年 手持POS机. All rights reserved.
//

#import "YellowView.h"
#import "AppModel.h"
@interface YellowView()
@property (weak, nonatomic) IBOutlet UIImageView *ImageView;

@property (weak, nonatomic) IBOutlet UILabel *labelName;
@property (weak, nonatomic) IBOutlet UIButton *button;
@end
@implementation YellowView

-(void)setAppModel:(AppModel *)appModel 
{
    _appModel = appModel;
    _ImageView.image = [UIImage imageNamed:appModel.icon];
    _labelName.text = appModel.name;

}
- (IBAction)downLoad:(UIButton *)sender {
    //拿到控制器的view
    UIView *view = self.superview;
    //创建一个coverView,点击时,coverView覆盖界面
    UIView *coverView = [[UIView alloc]initWithFrame:view.frame];
    coverView.alpha = 0;
    [view addSubview:coverView];
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, view.frame.size.width, 20)];
    label.center = view.center;
    [coverView setBackgroundColor:[UIColor blackColor]];
    NSString *string = _appModel.name;
    label.text = [string stringByAppendingString:@",正在下载..."];
    NSLog(@"%@",_appModel.name);
//    label.text = [NSString stringWithFormat:@"_appModel.name +正在现在"];
    label.textColor = [UIColor whiteColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.font = [UIFont systemFontOfSize:30];
    //Label一定要添加到coverView上(coverView消失,Label也跟着消失)
    [coverView addSubview:label];

    [UIView animateWithDuration:2 animations:^{
        coverView.alpha = 0.7;

    } completion:^(BOOL finished) {
//        label.text = nil;
        [UIView animateWithDuration:1 delay:1 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
            coverView.alpha = 0;

        } completion:^(BOOL finished) {
            self.button.enabled = NO;
            //要把coverView移除(会增加内存,虽然看不见,但还是存在的)
            [coverView removeFromSuperview];
        }];
    }];

}
-(void)down
{

}

@end
