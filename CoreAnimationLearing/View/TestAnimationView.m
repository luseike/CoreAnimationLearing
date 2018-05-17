//
//  TestAnimationView.m
//  CoreAnimationLearing
//
//  Created by 远路蒋 on 2018/5/7.
//  Copyright © 2018年 远路蒋. All rights reserved.
//

#import "TestAnimationView.h"

@interface TestAnimationLayer: CALayer
@end

@implementation TestAnimationLayer

-(void)setFrame:(CGRect)frame{
    [super setFrame:frame];
}

-(void)setPosition:(CGPoint)position{
    [super setPosition:position];
}

-(void)setBounds:(CGRect)bounds{
    [super setBounds:bounds];
}

-(CGPoint)position{
    return [super position];
}

-(void)addAnimation:(CAAnimation *)anim forKey:(NSString *)key{
    [super addAnimation:anim forKey:key];
    NSLog(@"%@",[anim debugDescription]);
}

@end


@implementation TestAnimationView

-(instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}

+(Class)layerClass{
    return [TestAnimationLayer class];
}

-(void)setFrame:(CGRect)frame{
    [super setFrame:frame];
}

-(void)setCenter:(CGPoint)center{
    [super setCenter:center];
}

-(CGPoint)center{
    return [super center];
}

-(void)setBounds:(CGRect)bounds{
    [super setBounds:bounds];
}

-(CGRect)bounds{
    return [super bounds];
}

-(id<CAAction>)actionForLayer:(CALayer *)layer forKey:(NSString *)event{
    id<CAAction> obj = [super actionForLayer:layer forKey:event];
    NSLog(@"-----%@",obj);
    return obj;
}
@end
