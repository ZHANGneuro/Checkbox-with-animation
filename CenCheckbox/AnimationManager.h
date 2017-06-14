//
//  AnimationManager.h
//  CheckBox
//
//  Created by boo on 03/06/2017.
//  Copyright © 2017 boo. All rights reserved.
//

#import <AppKit/AppKit.h>
#import <QuartzCore/CAAnimation.h>
#import <QuartzCore/CAMediaTimingFunction.h>
#import <QuartzCore/CAGradientLayer.h>
#import <QuartzCore/CABase.h>
#import <CoreGraphics/CoreGraphics.h>


@interface AnimationManager : NSObject


@property (nonatomic) CGFloat animationDuration;


- (instancetype)initWithAnimationDuration:(CGFloat)animationDuration;

- (CABasicAnimation *)opacityAnimationReverse:(BOOL)reverse;

- (CABasicAnimation *)morphAnimationFromPath:(CGPathRef)fromPath toPath:(CGPathRef)toPath ;

- (CAKeyframeAnimation *)fillAnimationWithBounces:(NSUInteger)bounces amplitude:(CGFloat)amplitude reverse:(BOOL)reverse;

- (CABasicAnimation *)strokeAnimationReverse:(BOOL)reverse;

@end
