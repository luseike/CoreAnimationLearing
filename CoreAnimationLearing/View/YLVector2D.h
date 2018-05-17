//
//  YLVector2D.h
//  CoreAnimationLearing
//
//  Created by 远路蒋 on 2018/5/15.
//  Copyright © 2018年 远路蒋. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface YLVector2D : NSObject

// vector的起点和终点
@property(nonatomic, assign) CGPoint startPoint;
@property(nonatomic, assign) CGPoint endPoint;


/**
 用两个点初始化一个向量

 @param start 起点
 @param end 终点
 @return 生成的向量
 */
-(instancetype)initWithStartPoint:(CGPoint)start endPoint:(CGPoint)end;



@end
