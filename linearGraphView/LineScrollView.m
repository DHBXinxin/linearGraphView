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

@end

@implementation LineScrollView

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
    self.contentSize = CGSizeMake(_lineView.frame.size.width, self.frame.size.height);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
