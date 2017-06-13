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




@end
