//
//  AnimationManager.m
//  CheckBox
//
//  Created by boo on 03/06/2017.
//  Copyright © 2017 boo. All rights reserved.
//

#import "AnimationManager.h"

@implementation AnimationManager

- (instancetype)initWithAnimationDuration:(CGFloat)animationDuration {
    self = [super init];
    if (self) {
        _animationDuration = animationDuration;
    }
    return self;
}

- (CABasicAnimation *)morphAnimationFromPath:(CGPathRef)fromPath toPath:(CGPathRef)toPath {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    animation.duration = self.animationDuration;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    animation.fromValue = (__bridge id _Nullable)(fromPath);
    animation.toValue = (__bridge id _Nullable)(toPath);
    
    return animation;
}


- (CABasicAnimation *)opacityAnimationReverse:(BOOL)reverse {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    if (reverse) {
        animation.fromValue = [NSNumber numberWithFloat:1.0];
        animation.toValue = [NSNumber numberWithFloat:0.0];
    } else {
        animation.fromValue = [NSNumber numberWithFloat:0.0];
        animation.toValue = [NSNumber numberWithFloat:1.0];
    }
    animation.duration = self.animationDuration;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    return animation;
}

- (CAKeyframeAnimation *)fillAnimationWithBounces:(NSUInteger)bounces amplitude:(CGFloat)amplitude reverse:(BOOL)reverse {
    NSMutableArray *values = [NSMutableArray new];
    NSMutableArray *keyTimes = [NSMutableArray new];
    
    if (reverse) {
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1)]];
    } else {
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0, 0, 0)]];
    }
    
    [keyTimes addObject:@0.0];
    
    for (NSUInteger i = 1; i <= bounces; i++) {
        CGFloat scale = (i % 2) ? (1 + amplitude/i) : (1 - amplitude/i);
        CGFloat time = i * 1.0/(bounces + 1);
        
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(scale, scale, scale)]];
        [keyTimes addObject:[NSNumber numberWithFloat:time]];
    }
    
    if (reverse) {
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.0001, 0.0001, 0.0001)]];
    } else {
        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1)]];
    }
    
    [keyTimes addObject:@1.0];
    
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
    animation.values = values;
    animation.keyTimes = keyTimes;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.duration = self.animationDuration;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    return animation;
}

- (CABasicAnimation *)strokeAnimationReverse:(BOOL)reverse {
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    if (reverse) {
        animation.fromValue = [NSNumber numberWithInt:1];
        animation.toValue = [NSNumber numberWithInt:0];
    } else {
        animation.fromValue = [NSNumber numberWithInt:0];
        animation.toValue = [NSNumber numberWithInt:1];
    }
    animation.duration = self.animationDuration;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    return animation;
}


@end
