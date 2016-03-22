//
//  ViewController.m
//  01class
//
//  Created by Seckan on 15/12/9.
//  Copyright (c) 2015年 Seckan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark 监听按钮点击
-(IBAction) btnClick{
    //1、获得文本输入框内容
    NSString *text1 = self.num1.text;
    NSString *text2 = self.num2.text;
    
    //2、将字符串转为整数
    int i1 = [text1 intValue];
    int i2 = [text2 intValue];
    
    //3、将结果显示到右边的标签
    self.num.text = [NSString stringWithFormat:@"%d", i1+i2];
}

@end
