//
//  PresentationLayerAndModelLayerViewController.m
//  CoreAnimationLearing
//
//  Created by 远路蒋 on 2018/5/8.
//  Copyright © 2018年 远路蒋. All rights reserved.
//  presentationLayer 和 modelLayer

#import "PresentationLayerAndModelLayerViewController.h"

@interface PresentationLayerAndModelLayerViewController ()

@end

@implementation PresentationLayerAndModelLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // let'us begin from a animation with change position
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 80, 80)];
    view.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:view];
    
    [view addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(logSomething)]];
    
    /*
     CALayer内部有presentationLayer和modelLayer，presentationLayer负责绘制，modelLayer负责如何绘制
     */
    
    /*
     CAAnimation对presentationLayer的控制
     当我们调用了layer的addAnimation方法后，一个CAAnimation就控制了P，相当于A一脚把M从P身上踹了下来然后自己爬了上去
     */
    
    /*
     模型与显示同步
     
     CABasicAnimation文档中有一句话：如果不设置tovalue，则CABasicAnimation会从fromValue到M的值之间进行插值
     */
    
    view.center = CGPointMake(200, 200);
    CABasicAnimation *animation = [CABasicAnimation animation];
    animation.keyPath = @"position";
    animation.duration = 2;
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(80, 80)];
//    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 200)];
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    [view.layer addAnimation:animation forKey:nil];
}



- (void)logSomething {
    NSLog(@"logSomething");
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
