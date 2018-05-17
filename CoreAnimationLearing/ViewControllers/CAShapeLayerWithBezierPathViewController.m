//
//  CAShapeLayerWithBezierPathViewController.m
//  CoreAnimationLearing
//
//  Created by 远路蒋 on 2018/5/11.
//  Copyright © 2018年 远路蒋. All rights reserved.
//

/*
 CAShapeLayer：是一个通过矢量图形 而不是bitmap（位图）来绘制的CALayer子类。使用了硬件加速、高效使用内存
 */

/*
 strokeStart：表示描线开始的地方占总路径的百分比，默认是0，取值范围是[0,1]
 strokeEnd：表示结束的地方占总路径的百分比，默认是1，取值范围是[0,1]。如果strokeEnd<=strokeStart，则不会绘制任何内容
 */

#import "CAShapeLayerWithBezierPathViewController.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface CAShapeLayerWithBezierPathViewController ()

@end

@implementation CAShapeLayerWithBezierPathViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.lineWidth = 5;
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    UIBezierPath *path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, 40, 40)];
    // 矩形内切圆
    path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 140, 100)];
    // 圆角矩形
    path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 140, 100) cornerRadius:30];
    // 圆角矩形  并指定哪几个角是圆角 第三个参数size，它的width就是圆角的大小
    path = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(30, 30, 140, 100) byRoundingCorners:UIRectCornerTopRight | UIRectCornerBottomLeft cornerRadii:CGSizeMake(50, 0)];
    
    // clockwise 是否以顺时针的方向连接起始点和终止点
    path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 200) radius:100 startAngle:0 endAngle:M_PI clockwise:YES];
    
    path = [self getPath3];
    shapeLayer.path = path.CGPath;
    
    [self.view.layer addSublayer:shapeLayer];
    */
    
//    [self shapeLayerAnimatableAttr];
    
//    [self pathAnimation];
    
    [self animationWithStrokEnd];
}

-(void)animationWithStrokStart{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.strokeColor = [UIColor orangeColor].CGColor;
    shapeLayer.lineWidth = 1.5f;
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 200) radius:100 startAngle:M_PI_2 endAngle:0 clockwise:YES];
    shapeLayer.path = path.CGPath;

    [self.view.layer addSublayer:shapeLayer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeStart"];
    animation.duration = 3;
    animation.fromValue = @0;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        shapeLayer.strokeStart = 1;
        [shapeLayer addAnimation:animation forKey:nil];
    });
   
}

-(void)animationWithStrokEnd{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.strokeColor = [UIColor orangeColor].CGColor;
    shapeLayer.lineWidth = 1.5f;
    shapeLayer.strokeEnd = 0;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 200) radius:100 startAngle:M_PI_2 endAngle:0 clockwise:YES];
    shapeLayer.path = path.CGPath;
    
    [self.view.layer addSublayer:shapeLayer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.duration = 3;
    animation.fromValue = @0;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        shapeLayer.strokeEnd = 0.5;
        [shapeLayer addAnimation:animation forKey:nil];
    });
    
}


-(UIBezierPath *)getPath{
    // 空的曲线
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    // 一旦调用了moveToPoint就相当于当前绘制点移动到了这个方法的参数指定的点
    [path moveToPoint:CGPointMake(10, 10)];
    // 移动到100，100 路过的地方将会留下一条路径
    [path addLineToPoint:CGPointMake(100, 10)];
    [path addLineToPoint:CGPointMake(100, 100)];

    return path;
}

-(UIBezierPath *)getPath1{
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(30, 30, 200, 200)];
    
    // 一旦调用了moveToPoint就相当于当前绘制点移动到了这个方法的参数指定的点
    [path moveToPoint:CGPointMake(30, 130)];
    [path addLineToPoint:CGPointMake(230, 130)];
    
    return path;
}

-(UIBezierPath *)getPath2{
    UIBezierPath *path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(30, 30, 200, 200)];
    UIBezierPath *subPath = [UIBezierPath bezierPath];
    // 一旦调用了moveToPoint就相当于当前绘制点移动到了这个方法的参数指定的点
    [subPath moveToPoint:CGPointMake(30, 130)];
    [subPath addLineToPoint:CGPointMake(230, 130)];
    [path appendPath:subPath];
    return path;
}

-(UIBezierPath *)getPath3{
    UIBezierPath *path = [UIBezierPath bezierPath];
//    [path addArcWithCenter:CGPointMake(200, 200) radius:100 startAngle:0 endAngle:M_PI clockwise:YES];
//    [path addLineToPoint:CGPointMake(150, 50)];
    
    [path moveToPoint:CGPointMake(40, 40)];
//    [path addQuadCurveToPoint:CGPointMake(350, 100) controlPoint:CGPointMake(260, 260)];
    [path addCurveToPoint:CGPointMake(kScreenWidth - 40, kScreenHeight - 40) controlPoint1:CGPointMake(10, 220) controlPoint2:CGPointMake(380, 380)];
    return path;
}

// 函数（sin）图像构造
-(void)getPath4{
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.fillColor = [UIColor clearColor].CGColor;
    layer.lineWidth = 5.0;
    layer.strokeColor = [UIColor redColor].CGColor;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
//    path.lineWidth = 1.0;
    [path moveToPoint:CGPointMake(0, kScreenHeight * 0.5)];
    
    for (NSInteger i = 0; i < kScreenWidth; i++) {
        CGFloat y = sin(i);
        // 对sinx图像进行形变
        y = kScreenHeight * 0.5 * sin(2 * M_PI * i / 100) + kScreenHeight * 0.5;
        // kScreenHeight - y 解决坐标轴方向相反的问题
        CGPoint nextPoint = CGPointMake(i, kScreenHeight - y);
        [path addLineToPoint:nextPoint];
    }
    
    layer.path = path.CGPath;
    [self.view.layer addSublayer:layer];
    
}

// CAShapeLayer的可动画属性
-(void)shapeLayerAnimatableAttr{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.lineWidth = 2.0;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.strokeColor = [UIColor purpleColor].CGColor;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(200, 200) radius:100 startAngle:M_PI_2 endAngle:M_PI * 2 clockwise:YES];
    shapeLayer.path = path.CGPath;
    
    [self.view.layer addSublayer:shapeLayer];
    
    CABasicAnimation *animation = [CABasicAnimation animation];
//    animation.keyPath = @"strokeStart";
//    animation.fromValue = @0;
    
    animation.keyPath = @"strokeEnd";
    animation.fromValue = @0;
    animation.duration = 3;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        shapeLayer.strokeEnd = 1;
        [shapeLayer addAnimation:animation forKey:nil];
    });
}


-(void)pathAnimation{
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.lineWidth = 2.0;
    shapeLayer.strokeColor = [UIColor clearColor].CGColor;
    shapeLayer.fillColor = [UIColor orangeColor].CGColor;
    shapeLayer.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    [self.view.layer addSublayer:shapeLayer];
    
    UIBezierPath *fromPath = [UIBezierPath bezierPath];
    [fromPath moveToPoint:CGPointZero];
    [fromPath addLineToPoint:CGPointMake(0, 300)];
    [fromPath addQuadCurveToPoint:CGPointMake(kScreenWidth, 300) controlPoint:CGPointMake(kScreenWidth * 0.5, 380)];
    [fromPath addLineToPoint:CGPointMake(kScreenWidth, 0)];
    [fromPath closePath];
    shapeLayer.path = fromPath.CGPath;
    
    UIBezierPath *endPath = [UIBezierPath bezierPath];
    [endPath moveToPoint:CGPointZero];
    [endPath addLineToPoint:CGPointMake(0, kScreenHeight + 100)];
    [endPath addQuadCurveToPoint:CGPointMake(kScreenWidth, kScreenHeight + 100) controlPoint:CGPointMake(kScreenWidth * 0.5, kScreenHeight - 100)];
    [endPath addLineToPoint:CGPointMake(kScreenWidth, 0)];
    [endPath closePath];
//    shapeLayer.path = endPath.CGPath;
    
    CABasicAnimation *pathAnimation = [CABasicAnimation animation];
    pathAnimation.keyPath = @"path";
    pathAnimation.fromValue = fromPath;
//    shapeLayer.path = endPath.CGPath;
    pathAnimation.duration = 0.5;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [shapeLayer addAnimation:pathAnimation forKey:nil];
        shapeLayer.path = endPath.CGPath;
    });
}
@end
