//
//  LineScrollView.h
//  Demo
//
//  Created by IOS on 16/4/14.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import <UIKit/UIKit.h>
//界面
@interface LinearGraphView : UIScrollView

@property (strong, nonatomic) NSArray *potArrays;

@property (strong, nonatomic) UIColor *potColor;

@property (strong, nonatomic) UIColor *lineColor;

@property (assign, nonatomic) CGFloat maxY;

@property (assign, nonatomic) CGFloat space;

@property (assign, nonatomic) CGFloat potRadius;

@end
