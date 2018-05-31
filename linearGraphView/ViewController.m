//
//  ViewController.m
//  linearGraphView
//
//  Created by IOS on 16/4/14.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "ViewController.h"
#import "LinearGraphView.h"

@interface ViewController ()

@property (strong, nonatomic) LinearGraphView *line;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    _line = [[LinearGraphView alloc]initWithFrame:CGRectMake(0, 100, 320, 200)];
    _line.lineColor = [UIColor yellowColor];
    _line.potColor = [UIColor purpleColor];
    //先设置线性图的属性、再加入他们的数组
    _line.potArrays = @[@0, @2, @5, @10, @8, @8, @0, @2, @5, @10, @8, @8, @0, @2, @5, @10, @8, @8, @0, @2, @5, @10, @8, @8, @0, @2, @5, @10, @8, @8, @0, @2, @5, @10, @8, @8, @8, @8, @0, @2, @5, @10, @8, @8, @0, @2, @5, @10, @8, @8, @0, @2, @5, @10, @8, @8];
    _line.backgroundColor = [UIColor redColor];
    [self.view addSubview:_line];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
