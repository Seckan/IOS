//
//  ViewController.m
//  图片浏览器
//
//  Created by Seckan on 16/1/22.
//  Copyright (c) 2016年 Seckan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property(nonatomic,strong)UIImageView *images;
@property(nonatomic,strong)UILabel *catalog;
@property(nonatomic,strong)UILabel *disc;
@property(nonatomic,strong)UIButton *left;
@property(nonatomic,strong)UIButton *right;

@property(nonatomic,assign)int index;
@property(nonatomic,strong)NSArray *imagelist;

@end

@implementation ViewController

/**
 懒加载
 不明确何时加载的时候用懒加载
 */
-(NSArray *)imagelist{
    if(_imagelist == nil){
//        NSDictionary *dict1 = @{@"name":@"biaoqingdi",@"desc":@"表情"};
//        NSDictionary *dict2 = @{@"name":@"bingli",@"desc":@"病例"};
//        NSDictionary *dict3 = @{@"name":@"chiniupa",@"desc":@"吃牛扒"};
//        NSDictionary *dict4 = @{@"name":@"danteng",@"desc":@"蛋疼"};
//        NSDictionary *dict5 = @{@"name":@"wangba",@"desc":@"王八"};
//        _imagelist = @[dict1,dict2,dict3,dict4,dict5];

        NSString *path = [[NSBundle mainBundle] pathForResource:@"disc" ofType:@"plist"];
        _imagelist = [NSArray arrayWithContentsOfFile:path];
    }
    return _imagelist;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    //1、创建图片
    self.images = [[UIImageView alloc] initWithFrame:CGRectMake(48, 93, 281, 218)];
    self.images.image = [UIImage imageNamed:@"biaoqingdi"];
    self.images.contentMode = UIViewContentModeScaleAspectFit;
    [self.view addSubview:self.images];
    
    //2、创建目录
    self.catalog = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, self.view.bounds.size.width, 21)];
    self.catalog.text = @"1/5";
    self.catalog.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.catalog];
    
    //3、创建左右标
    self.left = [[UIButton alloc] initWithFrame:CGRectMake(16, self.images.center.y, 42, 42)];
    self.left.tag = -1;
    self.right = [[UIButton alloc] initWithFrame:CGRectMake(313, self.images.center.y, 42, 42)];
    self.right.tag = 1;
    
    [self.left setBackgroundImage:[UIImage imageNamed:@"left_normal"] forState:UIControlStateNormal];
    [self.left setBackgroundImage:[UIImage imageNamed:@"left_highlighted"] forState:UIControlStateHighlighted];
    [self.left setBackgroundImage:[UIImage imageNamed:@"left_disable"] forState:UIControlStateDisabled];
    
    [self.right setBackgroundImage:[UIImage imageNamed:@"right_normal"] forState:UIControlStateNormal];
    [self.right setBackgroundImage:[UIImage imageNamed:@"right_highlighted"] forState:UIControlStateHighlighted];
    [self.right setBackgroundImage:[UIImage imageNamed:@"right_disable"] forState:UIControlStateDisabled];

    [self.left addTarget:self action:@selector(changeImage:) forControlEvents:UIControlEventTouchDown];
    [self.right addTarget:self action:@selector(changeImage:) forControlEvents:UIControlEventTouchDown];

    [self.view addSubview:self.left];
    [self.view addSubview:self.right];
    
   // self.left.enabled = (self.index == 1);

    
    //4、创建说明
    self.disc = [[UILabel alloc] initWithFrame:CGRectMake(18, 369, self.view.bounds.size.width, 100)];
    self.disc.text = @"表情";
    self.disc.textAlignment = NSTextAlignmentCenter; //居中
    self.disc.numberOfLines = 0; //自动换行
    [self.view addSubview:self.disc];
    
    [self showPhotoInfo];
    
}

-(void)changeImage:(UIButton *)sender{
    self.index += (int)sender.tag; //通过将tag设置成－1/1，直接进行位置判断, index + (-1)/index + (1),index = 0
    [self showPhotoInfo];
}

-(void)showPhotoInfo{
    //修改目录
    self.catalog.text = [NSString stringWithFormat:@"%d/%d",self.index+1,5];
   

    
    //修改图片及文字
    self.images.image = [UIImage imageNamed:self.imagelist[self.index][@"name"]];
    self.disc.text = self.imagelist[self.index][@"desc"];
    
    
    //判断关闭左右按钮
    self.left.enabled = (self.index != 0);
    self.right.enabled = (self.index != 4);
}

@end
