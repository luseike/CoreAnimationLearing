//
//  LayerMaskingViewController.m
//  CoreAnimationLearing
//
//  Created by 远路蒋 on 2018/5/15.
//  Copyright © 2018年 远路蒋. All rights reserved.
//  CALayer拥有一个属性叫做mask，作为这个CALayer对象的蒙版，mask本身也是一个CALayer
//  maskLayer并不直接绘制在父图层上，它只是定义了父图层的“可视部分”

#import "LayerMaskingViewController.h"

@interface LayerMaskingViewController ()

@end

@implementation LayerMaskingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.lineWidth = 2.0;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.strokeColor = [UIColor orangeColor].CGColor;
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path addArcWithCenter:CGPointMake(200, 200) radius:100 startAngle:-M_PI_2 endAngle:-M_PI_2 + M_PI * 2 * 0.75 clockwise:YES];
    shapeLayer.path = path.CGPath;
//    shapeLayer.strokeStart = 0.2;
    shapeLayer.strokeEnd = 0.6;
    [self.view.layer addSublayer:shapeLayer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation.duration = 2.5;
    animation.toValue = [NSNumber numberWithFloat:M_PI * 2.0];
    animation.repeatCount = INFINITY;
    animation.cumulative = YES;
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
//        shapeLayer.strokeStart = 1;
        [shapeLayer addAnimation:animation forKey:nil];
    });
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
