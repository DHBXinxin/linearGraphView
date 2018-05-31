//
//  LineView.m
//  Demo
//
//  Created by IOS on 16/4/14.
//  Copyright © 2016年 IOS. All rights reserved.
//

#import "DrawLinePot.h"
#import "LinearGraphView.h"
#define PotR 5//点的半径linearGraphView

#define ViewHeight 10//有10个维度｜最高为10、最低为0

#define PotSpace    30

@interface DrawLinePot ()

@property (strong, nonatomic) NSArray *drawArray;

@end
@implementation DrawLinePot

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
    [super drawRect:rect];
    [self drawPot:self.drawArray];
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
                UIColor *color = nil;
                if (self.lineColor) {
                    color = self.lineColor;
                } else {
                    color = [UIColor whiteColor];
                }
                [self drawLine:lineArray withColor:color];
            }
        }
    }
    for (NSInteger i = 0; i < pointArray.count; i++) {
        CGPoint point = [pointArray[i] CGPointValue];
        UIColor *color = nil;
        if (self.potColor) {
            color = self.potColor;
        } else {
            color = [UIColor whiteColor];
        }
        [self drawEllipse:point withColor:color withRad:PotR];

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
        potX += self.space ? self.space : PotSpace;
        [pointArray addObject:[NSValue valueWithCGPoint:point]];
    }
    CGRect rect = self.frame;
    rect.size.width = [pointArray.lastObject CGPointValue].x + PotR;
    self.frame = rect;
    self.drawArray = pointArray;
    
    [self setNeedsLayout];
}

@end