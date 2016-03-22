//
//  ViewController.h
//  01class
//
//  Created by Seckan on 15/12/9.
//  Copyright (c) 2015年 Seckan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
//声明一个方法来监听按钮点击
-(IBAction) btnClick;

//声明两个属性保存两个文本框
@property(nonatomic) IBOutlet UITextField *num1;
@property(nonatomic) IBOutlet UITextField *num2;

@property(nonatomic) IBOutlet UILabel *num;

@end

