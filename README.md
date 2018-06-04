# linearGraphView
线性图
现在只是把点、线加上了、如果需要别的东西再自己添加吧
实现的方式是
1）把数组转化成view上的每个点DrawLinePot.m
- (void)setPotArrays:(NSArray *)potArrays

2）画点和线DrawLinePot.m
- (void)drawLine:(NSArray *)pointArray withColor:(UIColor *)color

- (void)drawEllipse:(CGPoint)point withColor:(UIColor*)color withValue:(id)value

