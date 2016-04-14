//
//  ViewController.m
//  linearGraphView
//
//  Created by IOS on 16/4/14.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "ViewController.h"
#import "LineScrollView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    LineScrollView *line = [[LineScrollView alloc]initWithFrame:CGRectMake(0, 100, 320, 200)];
    line.lineColor = [UIColor yellowColor];
    line.potColor = [UIColor purpleColor];
    line.potArrays = @[@0, @2, @5, @10, @8, @8, @0, @2, @5, @10, @8, @8, @0, @2, @5, @10, @8, @8, @0, @2, @5, @10, @8, @8, @0, @2, @5, @10, @8, @8, @0, @2, @5, @10, @8, @8, @8, @8, @0, @2, @5, @10, @8, @8, @0, @2, @5, @10, @8, @8, @0, @2, @5, @10, @8, @8];
    line.backgroundColor = [UIColor redColor];
    [self.view addSubview:line];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
