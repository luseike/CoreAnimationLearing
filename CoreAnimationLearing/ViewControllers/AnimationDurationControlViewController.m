//
//  AnimationDurationControlViewController.m
//  CoreAnimationLearing
//
//  Created by 远路蒋 on 2018/5/9.
//  Copyright © 2018年 远路蒋. All rights reserved.
//  动画时间控制

/*
 CAMediaTiming协议：所有跟时间有关的属性（duration，beginTime，repeatCount等）都来自CAMediaTiming协议
 它由CABasicAnimation和CAKeyframeAnimation的父类CAAnimation实现，一共定义了8个属性
 
 beginTime：CACurrentMediaTime（），动画被延迟多久才被执行
 fillMode：如果想让动画在开始之前显示fromValue的状态，可设置动画向后填充
 autoreverse：将使动画先正常走，完了以后反着从结束值回到起始值
 repeatCount：可以让动画重复执行若干次（可以是小数）。一旦动画到达结束值，它将立即返回到起始值并重新开始
 repeatDuration：给定的持续时间内重复执行动画，如果repeatDuration比动画持续时间小，那么动画将提前结束
 speed：动画速度。如果duration=3，speed = 2，动画将会在1.5秒结束，因为它以两倍速度在执行
    speed的特点：
    1、动画速度是有层级关系的
    2、CAAnimation并不是唯一的实现了CAMediaTiming协议的类（CALayer也实现了CAMediaTiming协议）
 timeOffset：偏移动画时间。duration=3，timeOffset=1，就会从正常动画的第1秒开始执行，直到2秒后突然跳回最开始的状态再执行1秒
 timingFunction：ease的效果，需要设置一个CAMediaTimingFunction对象，实际上是指定了一个曲线
 */

#import "AnimationDurationControlViewController.h"

@interface AnimationDurationControlViewController ()
@property (nonatomic, strong) UIView *customView;
@end


@implementation AnimationDurationControlViewController

-(UIView *)customView{
    if (!_customView) {
        _customView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
        _customView.backgroundColor = [UIColor whiteColor];
    }
    return _customView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setu
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.customView];
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.duration = 1.0;
    animation.fromValue = (__bridge id _Nullable)[UIColor orangeColor].CGColor;
    animation.toValue = (__bridge id _Nullable)[UIColor purpleColor].CGColor;
    animation.keyPath = @"backgroundColor";
    animation.timeOffset = 0;
    [self.customView.layer addAnimation:animation forKey:nil];
    self.customView.layer.speed = 0.0;
    
    UISlider *slider = [[UISlider alloc] initWithFrame:CGRectMake(100, 300, 300, 50)];
    [self.view addSubview:slider];
    [slider addTarget:self action:@selector(valuechanged:) forControlEvents:UIControlEventValueChanged];
}

-(void)valuechanged:(UISlider *)slider{
    NSLog(@"%f",slider.value);
    self.customView.layer.timeOffset = slider.value;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesBegan:touches withEvent:event];
    
//    CABasicAnimation *animation = [CABasicAnimation animation];
//    animation.keyPath = @"backgroundColor";
//    animation.fromValue = (__bridge id _Nullable)([UIColor orangeColor].CGColor);
//    animation.toValue = (__bridge id _Nullable)([UIColor blueColor].CGColor);
//    animation.duration = 3;
    
    // time control property
//    animation.beginTime = CACurrentMediaTime() + 4;
//    animation.fillMode = kCAFillModeBackwards;
    
//    animation.autoreverses = YES;
//    animation.repeatCount = 2.5;
    
//    animation.repeatDuration = 50;
//    animation.autoreverses = YES;
    
//    animation.speed = 2;
//    animation.timeOffset = 1;
//    [self.customView.layer addAnimation:animation forKey:nil];
    
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(200, 200, 100, 100);
    layer.backgroundColor = [UIColor orangeColor].CGColor;
    layer.opacity = 0.5;
    [self.view.layer addSublayer:layer];
    
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"opacity";
    animation.fromValue = [NSNumber numberWithFloat:0.0];
    animation.toValue = [NSNumber numberWithFloat:1.0];
    animation.duration = 3;
    
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeBoth;
    animation.beginTime = CACurrentMediaTime() + 3.0;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    [layer addAnimation:animation forKey:nil];
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
