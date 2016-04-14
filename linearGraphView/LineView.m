//
//  LineView.m
//  Demo
//
//  Created by IOS on 16/4/14.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "LineView.h"
#import "LineScrollView.h"
#define PotR 5//点的半径

#define ViewHeight 10//有10个维度｜最高为10、最低为0

@interface LineView ()

@property (strong, nonatomic) NSArray *pointArray;

@end
@implementation LineView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    [self drawPot:self.pointArray];
}
- (void)drawPot:(NSArray *)pointArray {
    
    if (pointArray.count > 2) {
        NSMutableArray *lineArray = [NSMutableArray array];
        for (NSInteger i = 0; i < pointArray.count; i++) {
            [lineArray addObject:pointArray[i]];
            if (lineArray.count > 2) {
                [lineArray removeObjectAtIndex:0];
            }
            if (lineArray.count == 2) {
                [self drawLine:lineArray withColor:_lineColor];
            }
        }
    }
    for (NSInteger i = 0; i < pointArray.count; i++) {
        CGPoint point = [pointArray[i] CGPointValue];
        [self drawEllipse:point withColor:_potColor withRad:PotR];

    }
}
- (void)drawLine:(NSArray *)pointArray withColor:(UIColor *)color {
    CGPoint firstPoint = [pointArray[0] CGPointValue];
    CGPoint secondPoint = [pointArray[1] CGPointValue];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGContextMoveToPoint(context, firstPoint.x, firstPoint.y);
    CGContextAddLineToPoint(context, secondPoint.x,secondPoint.y);
    CGContextStrokePath(context);
}
- (void)drawEllipse:(CGPoint)point withColor:(UIColor*)color withRad:(float)rad
{
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctx, [color CGColor]);
    CGContextFillEllipseInRect(ctx, CGRectMake(point.x-rad, point.y-rad, 2*rad, 2*rad));
}
- (void)setPotArrays:(NSArray *)potArrays {
    _potArrays = potArrays;
    CGFloat potX = PotR;
    CGFloat potY;
    NSMutableArray *pointArray = [NSMutableArray array];
    for (NSInteger i = 0; i < potArrays.count; i++) {
        CGFloat height = CGRectGetHeight(self.frame) - PotR * 2;
        NSInteger tag = [potArrays[i] integerValue];
        potY = height / (ViewHeight) * (ViewHeight - tag) + PotR;
        CGPoint point = CGPointMake(potX, potY);
        potX += 20;
        [pointArray addObject:[NSValue valueWithCGPoint:point]];
    }
    CGRect rect = self.frame;
    rect.size.width = [pointArray.lastObject CGPointValue].x + PotR;
    self.frame = rect;
    self.pointArray = pointArray;
    
    [self setNeedsLayout];
}
@end
