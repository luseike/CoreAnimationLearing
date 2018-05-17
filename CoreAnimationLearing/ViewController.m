//
//  ViewController.m
//  CoreAnimationLearing
//
//  Created by 远路蒋 on 2018/5/7.
//  Copyright © 2018年 远路蒋. All rights reserved.
//

#import "ViewController.h"
#import "TestAnimationView.h"

#define CGColorToNSObject(x) (__bridge id)x.CGColor
// 前排声明一下线宽和半径等
static const CGFloat radius = 150;
static const CGFloat lineWidth = 20;
@interface ViewController ()
@property (nonatomic, strong) CALayer *containerLayer;
@property (nonatomic, strong) CAShapeLayer *maskLayer;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    TestAnimationView *view = [[TestAnimationView alloc] init];
    view.frame = CGRectMake(100, 100, 100, 100);
    
    CALayer *containerLayer = [CALayer layer];
    containerLayer.frame = CGRectMake(0, 0, radius * 2 + lineWidth, radius * 2 + lineWidth);
    containerLayer.position = self.view.center;
    self.containerLayer = containerLayer;
    [self.view.layer addSublayer:containerLayer];
    
    // 左半边的layer
    CAGradientLayer *leftLayer = [CAGradientLayer layer];
    leftLayer.colors = @[CGColorToNSObject([UIColor greenColor]), CGColorToNSObject([UIColor yellowColor])];
    leftLayer.startPoint = CGPointMake(0, 0);
    leftLayer.endPoint = CGPointMake(0, 1);
    leftLayer.frame = CGRectMake(0, 0, CGRectGetWidth(self.containerLayer.frame) * 0.5, CGRectGetHeight(self.containerLayer.frame) - lineWidth);
    [self.containerLayer addSublayer:leftLayer];
    // 右半边的layer
    CAGradientLayer *rightLayer = [CAGradientLayer layer];
    rightLayer.colors = @[CGColorToNSObject([UIColor redColor]), CGColorToNSObject([UIColor yellowColor])];
    rightLayer.startPoint = CGPointMake(0, 0);
    rightLayer.endPoint = CGPointMake(0, 1);
    rightLayer.frame = CGRectMake(CGRectGetWidth(self.containerLayer.frame) * 0.5, 0, CGRectGetWidth(self.containerLayer.frame) * 0.5, CGRectGetHeight(self.containerLayer.frame) - lineWidth);
    [containerLayer addSublayer:rightLayer];
    
    CALayer *bottomLayer = [CALayer layer];
    bottomLayer.frame = CGRectMake(0, CGRectGetHeight(self.containerLayer.frame) - lineWidth, CGRectGetWidth(self.containerLayer.frame), lineWidth);
    bottomLayer.backgroundColor = [UIColor yellowColor].CGColor;
    [self.containerLayer addSublayer:bottomLayer];
    
    // 先算边长
//    CGFloat length = radius * 2 + lineWidth;
//    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
//    gradientLayer.frame = CGRectMake(80, 200, length, length);
//
//    gradientLayer.colors = @[CGColorToNSObject([UIColor redColor]),CGColorToNSObject([UIColor yellowColor]), CGColorToNSObject([UIColor greenColor])];
//    gradientLayer.startPoint = CGPointMake(0, 0);
//    gradientLayer.endPoint = CGPointMake(0, 1);
//    gradientLayer.locations = @[@0, @0.3, @1];
//    [self.view.layer addSublayer:gradientLayer];
    
    // 构造shapeLayer的渲染路径
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(radius + lineWidth * 0.5, radius + lineWidth * 0.5) radius:radius startAngle:-M_PI_2 endAngle:M_PI_2 * 3 clockwise:YES];
   
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [UIColor redColor].CGColor;
    
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    
    shapeLayer.lineWidth = lineWidth;
    shapeLayer.path = path.CGPath;
    self.containerLayer.mask = shapeLayer;
    self.maskLayer = shapeLayer;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesEnded:touches withEvent:event];
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"strokeEnd";
    animation.duration = 2;
    animation.fromValue = @0;
    self.maskLayer.strokeEnd = 1;
    [self.maskLayer addAnimation:animation forKey:nil];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
