//
//  CoreAnimationPrincipleViewController.m
//  CoreAnimationLearing
//
//  Created by 远路蒋 on 2018/5/7.
//  Copyright © 2018年 远路蒋. All rights reserved.
//  动画原理  UIView是如何将CoreAnimation封装成block动画的

#import "CoreAnimationPrincipleViewController.h"
#import "TestAnimationView.h"

@interface CoreAnimationPrincipleViewController ()
@property (nonatomic, strong) UIView *redView;
@end

@implementation CoreAnimationPrincipleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    redView.backgroundColor = [UIColor redColor];
    self.redView = redView;
    [self.view addSubview:redView];
    
    /*
     CALayer的可动画属性
     
     直接对可动画属性赋值的时候，由于有隐式动画存在的可能，CALayer首先会判断此时有没有隐式动画被触发
     
     1、CALayer让它的delegate 调用actionForLayer:forKey: 来获取一个返回值
        如果返回值是nil，则进行默认的隐式动画
        如果返回一个[NSNull null]，则CALayer不会做任何动画
        如果返回一个实现了CAAction协议的对象，则CALayer用这个对象来生成一个CAAnimation 并加到自己身上进行动画
     */
    
    /*
     如果一个CALayer被一个UIView所持有，那么这个CALayer的delegate就是持有它的这个UIView
     
     对view的一个属性，比如center赋值的时候，view同时会去对layer的position赋值。
     这是layer会让它的delegate（就是这个view）调用actionForLayer:forKey:方法，UIView在这个方法中是这样实现的：
     1、如果这次调用发生在[UIView animationWithDuration:animations:]的动画block里面，则UIView生成一个CAAction对象，返回给layer
     2、如果动画发生在block外面，返回NSNull，也就没有动画
     */
    
    TestAnimationView *view = [[TestAnimationView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self.view addSubview:view];
    
    [UIView animateWithDuration:1.25 animations:^{
        view.center = CGPointMake(80, 80);
    } completion:^(BOOL finished) {
        NSLog(@"aa");
    }];
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [super touchesEnded:touches withEvent:event];
    NSLog(@"out block:%@",[self.view.layer.delegate actionForLayer:self.view.layer forKey:@"position"]);
    [UIView animateWithDuration:1.5 animations:^{
        NSLog(@"inner block:%@",[self.view.layer.delegate actionForLayer:self.view.layer forKey:@"position"]);
        self.redView.center = CGPointMake(self.redView.center.x + 10, self.redView.center.y + 10);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
