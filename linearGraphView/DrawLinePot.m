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
//左右边距
#define LeftMargin 30

#define RightMargin 30

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
        id value = self.potArrays[i];
        UIColor *color = nil;
        if (self.potColor) {
            color = self.potColor;
        } else {
            color = [UIColor whiteColor];
        }
        [self drawEllipse:point withColor:color withValue:value];

    }
}
- (void)drawLine:(NSArray *)pointArray withColor:(UIColor *)color {
    CGPoint firstPoint = [pointArray[0] CGPointValue];
    CGPoint secondPoint = [pointArray[1] CGPointValue];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetStrokeColorWithColor(context, color.CGColor);
    CGContextSetLineWidth(context, 0.5);
    CGContextMoveToPoint(context, firstPoint.x, firstPoint.y);
    CGContextAddLineToPoint(context, secondPoint.x,secondPoint.y);
    CGContextStrokePath(context);
}
- (void)drawEllipse:(CGPoint)point withColor:(UIColor*)color withValue:(id)value
{
    CGFloat r = self.potRadius ? self.potRadius : PotR;
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(ctx, [color CGColor]);
    CGContextFillEllipseInRect(ctx, CGRectMake(point.x-r, point.y-r, 2*r, 2*r));
//    CGContextSetStrokeColorWithColor(ctx, color.CGColor);
//    CGContextStrokeEllipseInRect(ctx, CGRectMake(point.x-r, point.y-r, 2*r, 2*r));
    NSString *string = [NSString stringWithFormat:@"%@",value];
    CGRect rect = CGRectMake(point.x - 20, point.y - 20, 40, 20);
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.alignment = NSTextAlignmentCenter;
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    [string drawInRect:rect withAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:color, NSParagraphStyleAttributeName: paragraphStyle}];
    
}
- (void)setPotArrays:(NSArray *)potArrays {
    //设置点
    _potArrays = potArrays;
    CGFloat potX = LeftMargin;
    CGFloat potY;
   
    NSMutableArray *pointArray = [NSMutableArray array];
    for (NSInteger i = 0; i < potArrays.count; i++) {
        CGFloat height = CGRectGetHeight(self.frame) - PotR * 2;
        NSInteger tag = [potArrays[i] integerValue];
        potY = height / (self.maxY ? self.maxY : ViewHeight) * ((self.maxY ? self.maxY : ViewHeight) - tag) + PotR;
        CGPoint point = CGPointMake(potX, potY);
        potX += self.space ? self.space : PotSpace;
        [pointArray addObject:[NSValue valueWithCGPoint:point]];
    }
    CGRect rect = self.frame;
    rect.size.width = [pointArray.lastObject CGPointValue].x + RightMargin;
    self.frame = rect;
    self.drawArray = pointArray;
    
    [self setNeedsLayout];
}

@end
