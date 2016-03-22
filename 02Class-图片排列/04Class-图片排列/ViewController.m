//
//  ViewController.m
//  04Class-图片排列
//
//  Created by Seckan on 15/12/14.
//  Copyright (c) 2015年 Seckan. All rights reserved.
//

#import "ViewController.h"

#define kImgWH 60
#define kInintCount 9

@interface ViewController ()

@end

@implementation ViewController

#pragma mark 控制器的view加载完毕就调用一次，可用于调用图片表情初始化
- (void)viewDidLoad {
    [super viewDidLoad];
    [self adjustImagePosWithColumns:2 add:YES];
  }

#pragma mark 调整图片位置
-(void)adjustImagePosWithColumns:(int)columns add:(BOOL)add{
    //1、定义列数、间距
    //设置每行列数
    //int columns = 2;
    //每个表情之间的间距 ＝ （控制器view的宽度 － 列数 ＊ 表情宽度）／ （列数 ＋ 1）
    CGFloat margin = (self.view.frame.size.width - columns * kImgWH)/(columns + 1);
    
    //2、定义第一个表情的位置
    //第一个y值
    CGFloat oneY = 100;
    //第一个x值
    CGFloat oneX = margin;
    
    
    //3、创建所有的表情
    for(int i=0; i<kInintCount; i++){
        //i对应的列数
        int col = i % columns;
        //i对应的行数
        int row = i / columns;
        
        //列数（col）决定了x
        CGFloat x = oneX + col * (kImgWH + margin);
        //行数（row）决定了y
        CGFloat y = oneY + row * (kImgWH + margin);
        
        if(add){
            //新Image
        //设置越界，9个图就循环
            int no = i % kInintCount;//no == [0 8]
            NSString *imageName = [NSString stringWithFormat:@"01%d.png",no];
            //取出i位置对应的imageView，设置x、y值
            [self addImge:imageName x:x y:y];
        }else{
            //旧Image
            //取出i位置对应的imageView，设置x、y值
            //+1是为了跳过最前面的UISegmentControl
            UIView *child =  self.view.subviews[i + 1];
            // 取出frame
            CGRect tempF = child.frame;
            //修改x,y
            tempF.origin = CGPointMake(x, y);
            //重新赋值
            child.frame = tempF;
        }
    }

}

#pragma mark 添加表情 icon:表情图片名
-(void)addImge:(NSString *)icon x:(CGFloat)x y:(CGFloat)y{
    UIImageView *picture = [[UIImageView alloc] init];
    picture.image = [UIImage imageNamed:icon];
    picture.frame = CGRectMake(x, y, kImgWH, kImgWH);
    [self.view addSubview:picture];
}

#pragma mark 更改表情的列数
- (IBAction)indexChange:(UISegmentedControl *)sender {
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.5];
    
    int colums = (int)(sender.selectedSegmentIndex + 2);
    [self adjustImagePosWithColumns:colums add:NO];
    
    [UIView commitAnimations];
}
@end
