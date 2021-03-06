//
//  LineScrollView.m
//  Demo
//
//  Created by IOS on 16/4/14.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "LinearGraphView.h"
#import "DrawLinePot.h"
@interface LinearGraphView ()

@property (strong, nonatomic) DrawLinePot *lineView;

@property (strong, nonatomic) UIView *xView;

@property (strong, nonatomic) UIView *yView;

@end

@implementation LinearGraphView
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
        
        _lineView = [[DrawLinePot alloc]initWithFrame:self.bounds];
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
- (void)setMaxY:(CGFloat)maxY {
    _maxY = maxY;
    _lineView.maxY = maxY;
}
- (void)setSpace:(CGFloat)space {
    _space = space;
    _lineView.space = space;
}
- (void)setPotRadius:(CGFloat)potRadius {
    _potRadius = potRadius;
    _lineView.potRadius = potRadius;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
