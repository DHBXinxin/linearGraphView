//
//  LineScrollView.m
//  Demo
//
//  Created by IOS on 16/4/14.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "LineScrollView.h"
#import "LineView.h"
@interface LineScrollView ()

@property (strong, nonatomic) LineView *lineView;

@property (strong, nonatomic) UIView *xView;

@property (strong, nonatomic) UIView *yView;

@end

@implementation LineScrollView
- (UIView *)xView {
    if (_xView) {
        return _xView;
    }
    _xView = [[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_lineView.frame), CGRectGetWidth(self.frame), 10)];
    _xView.backgroundColor = [UIColor clearColor];
    return _xView;
}
- (UIView *)yView {
    if (_yView) {
        return _yView;
    }
    _yView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, CGRectGetHeight(self.frame))];
    _yView.backgroundColor = [UIColor whiteColor];
    return _yView;
}
- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        
        _lineView = [[LineView alloc]initWithFrame:self.bounds];
        [self addSubview:self.lineView];
    }
    return self;
}
- (void)setPotColor:(UIColor *)potColor {
    _potColor = potColor;
    _lineView.potColor = potColor;
}
- (void)setLineColor:(UIColor *)lineColor {
    _lineColor = lineColor;
    _lineView.lineColor = lineColor;
}
- (void)setPotArrays:(NSArray *)potArrays {
    _potArrays = potArrays;
    _lineView.potArrays = potArrays;
    self.contentSize = CGSizeMake(_lineView.frame.size.width + 10, self.frame.size.height + 10);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
