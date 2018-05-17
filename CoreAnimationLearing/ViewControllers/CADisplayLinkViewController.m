//
//  CADisplayLinkViewController.m
//  CoreAnimationLearing
//
//  Created by 远路蒋 on 2018/5/11.
//  Copyright © 2018年 远路蒋. All rights reserved.
//

/*
 UIKit / AppKit
 Core Animation
 OpenGL/OpenGL ES   Core Graphics
 Graphics Hardware
 */

#import "CADisplayLinkViewController.h"

@interface CADisplayLinkViewController (){
    
    CGPoint _fromPoint;
    CGPoint _toPoint;
}
@property (nonatomic, strong) UIView *myView;
@property(nonatomic, assign) NSTimeInterval beginTime;
@end



@implementation CADisplayLinkViewController


static const NSTimeInterval duration = 2.78;

-(UIView *)myView{
    if (!_myView) {
        _myView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 80, 80)];
        _myView.backgroundColor = [UIColor yellowColor];
    }
    return _myView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _fromPoint = CGPointMake(10, 20);
    _toPoint = CGPointMake(300, 400);
    [self.view addSubview:self.myView];
    
    CADisplayLink *displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(onDisplayLink:)];
    [displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    
    self.beginTime = CACurrentMediaTime();
}


-(void)onDisplayLink:(CADisplayLink *)displayLink{
//    NSLog(@"display link callback");
    
    NSTimeInterval currentTime = CACurrentMediaTime() - self.beginTime;
    CGFloat percent = currentTime / duration;
    percent = [self easeIn:percent * 0.4];
    if (percent > 1) {
        percent = 1;
        [displayLink invalidate];
    }
    
    
    
    CGFloat x = [self _interpolateFrom:_fromPoint.x to:_toPoint.x percent:percent];
    CGFloat y = [self _interpolateFrom:_fromPoint.y to:_toPoint.y percent:percent];
    
    self.myView.center = CGPointMake(x, y);
}

-(CGFloat)_interpolateFrom:(CGFloat)from to:(CGFloat)to percent:(CGFloat)percent{
    return from + (to - from) * percent;
}

-(CGFloat)easeIn:(CGFloat)p{
    return p * p;
}
















@end
