//
//  CenCheckBox.m
//  CheckBox
//
//  Created by boo on 03/06/2017.
//  Copyright © 2017 boo. All rights reserved.
//

#import "CenCheckBox.h"

@interface CenCheckBox ()

@property (strong, nonatomic) CAShapeLayer *onBoxLayer;
@property (strong, nonatomic) CAShapeLayer *offBoxLayer;
@property (strong, nonatomic) CAShapeLayer *checkMarkLayer;
@property (strong, nonatomic) AnimationManager *animationManager;
@property (strong, nonatomic) PathManager *pathManager;
@property (strong, nonatomic) NSBezierPath *circle_map;

@end


@implementation CenCheckBox

//static NSString *animator;

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) [self commonInit];
    return self;
}

- (void)commonInit {
    _animator = @"BEMAnimationTypeFlat";
    _on = NO;
    _blue_color = [NSColor colorWithRed:0 green:122.0/255.0 blue:255/255 alpha:1];
    _offFillColor = [NSColor clearColor];
    _tintColor = [NSColor lightGrayColor];
    _lineWidth = 3;
    _animationDuration = 0.2;
    _pathManager = [PathManager new];
    _circle_map = [_pathManager path_map:self.frame.size.width];
    _animationManager = [[AnimationManager alloc] initWithAnimationDuration:_animationDuration];
    [self setAction:@selector(mouseDown:)];
}


- (void)mouseDown:(NSEvent *)theEvent{
    NSPoint event_location = [theEvent locationInWindow];
    NSPoint transformed_location = [self convertPoint: event_location fromView: nil];
    BOOL inside_enclosed_area = [self.circle_map containsPoint:NSMakePoint(transformed_location.x, transformed_location.y)];
    if (inside_enclosed_area) {
        [self setOn:!self.on animated:YES];
    }
}


- (void)drawRect:(CGRect)rect {
    [self setOn:self.on animated:NO];
}


- (void)setOn:(BOOL)on animated:(BOOL)animated {
    _on = on;
    [self drawEntireCheckBox];
    if (on) {
        [self addOnAnimation];
    } else {
        [self addOffAnimation];
    }
}


- (void)addOnAnimation {
    if ([_animator isEqual: @"BEMAnimationTypeFlat"]) {
        CABasicAnimation *morphAnimation = [self.animationManager morphAnimationFromPath:[self.pathManager pathForFlatCheckMark] toPath:[self.pathManager pathForCheckMark]];
        CABasicAnimation *opacity = [self.animationManager opacityAnimationReverse:NO];
        opacity.duration = self.animationDuration / 5;
        
        [self.onBoxLayer addAnimation:opacity forKey:@"opacity"];
        [self.checkMarkLayer addAnimation:morphAnimation forKey:@"path"];
        [self.checkMarkLayer addAnimation:opacity forKey:@"opacity"];
    }
    
    if ([_animator isEqual: @"BEMAnimationTypeFill"]) {
        CAKeyframeAnimation *wiggle = [self.animationManager fillAnimationWithBounces:1 amplitude:0.18 reverse:NO];
        CABasicAnimation *opacityAnimation = [self.animationManager opacityAnimationReverse:NO];
        
        [self.onBoxLayer addAnimation:wiggle forKey:@"transform"];
        [self.checkMarkLayer addAnimation:opacityAnimation forKey:@"opacity"];
    }
    
    if ([_animator isEqual: @"BEMAnimationTypeStroke"]) {
        CABasicAnimation *animation = [self.animationManager strokeAnimationReverse:NO];
        [self.onBoxLayer addAnimation:animation forKey:@"strokeEnd"];
        [self.checkMarkLayer addAnimation:animation forKey:@"strokeEnd"];
    }
    
    if ([_animator isEqual: @"BEMAnimationTypeBounce"]) {
        CGFloat amplitude = 0.35;
        CAKeyframeAnimation *wiggle = [self.animationManager fillAnimationWithBounces:1 amplitude:amplitude reverse:NO];
        CABasicAnimation *opacity = [self.animationManager opacityAnimationReverse:NO];
        opacity.duration = self.animationDuration / 1.4;
        [self.onBoxLayer addAnimation:opacity forKey:@"opacity"];
        [self.checkMarkLayer addAnimation:wiggle forKey:@"transform"];
    }
}


- (void)addOffAnimation {
    if ([_animator isEqual: @"BEMAnimationTypeFlat"]) {
        CABasicAnimation *animation = [self.animationManager morphAnimationFromPath:[self.pathManager pathForCheckMark] toPath:[self.pathManager pathForFlatCheckMark]];
        CABasicAnimation *opacity = [self.animationManager opacityAnimationReverse:YES];
        opacity.duration = self.animationDuration;
        [self.onBoxLayer addAnimation:opacity forKey:@"opacity"];
        [self.checkMarkLayer addAnimation:animation forKey:@"path"];
        [self.checkMarkLayer addAnimation:opacity forKey:@"opacity"];
    }
    
    if ([_animator isEqual: @"BEMAnimationTypeFill"]) {
        CAKeyframeAnimation *wiggle = [self.animationManager fillAnimationWithBounces:1 amplitude:0.18 reverse:YES];
        wiggle.duration = self.animationDuration;
        [self.onBoxLayer addAnimation:wiggle forKey:@"transform"];
        [self.checkMarkLayer addAnimation:[self.animationManager opacityAnimationReverse:YES] forKey:@"opacity"];
    }
    
    if ([_animator isEqual: @"BEMAnimationTypeStroke"]) {
        CABasicAnimation *thisstroke = [self.animationManager strokeAnimationReverse:YES];
        CABasicAnimation *opacity = [self.animationManager opacityAnimationReverse:YES];
        opacity.duration = self.animationDuration+0.1f;
        [self.onBoxLayer addAnimation:thisstroke forKey:@"strokeEnd"];
        [self.checkMarkLayer addAnimation:thisstroke forKey:@"strokeEnd"];
        [self.checkMarkLayer addAnimation:opacity forKey:@"opacity"];
    }
    
    if ([_animator isEqual: @"BEMAnimationTypeBounce"]) {
        CGFloat amplitude = 0.35;
        CAKeyframeAnimation *wiggle = [self.animationManager fillAnimationWithBounces:1 amplitude:amplitude reverse:YES];
        wiggle.duration = self.animationDuration / 1.1;
        CABasicAnimation *opacity = [self.animationManager opacityAnimationReverse:YES];
        [self.onBoxLayer addAnimation:opacity forKey:@"opacity"];
        [self.checkMarkLayer addAnimation:wiggle forKey:@"transform"];
    }
}


- (void)drawEntireCheckBox {
    if (!self.offBoxLayer || CGRectGetHeight(CGPathGetBoundingBox(self.offBoxLayer.path)) == 0.0) {
        [self drawOffBox];
    }
    if (self.on) {
        [self drawOnBox];
    }
    if (self.on) {
        [self drawCheckMark];
    }
}

- (void)drawOnBox {
    [self.onBoxLayer removeFromSuperlayer];
    self.onBoxLayer = [CAShapeLayer layer];
    self.onBoxLayer.frame = self.bounds;
    self.onBoxLayer.path = [self.pathManager pathForBox:self.frame.size.width];
    self.onBoxLayer.lineWidth = self.lineWidth;
    if ([_animator isEqual:@"BEMAnimationTypeStroke"]) {
        self.onBoxLayer.fillColor = [NSColor clearColor].CGColor;
    } else {
        self.onBoxLayer.fillColor = self.blue_color.CGColor;
    }
    self.onBoxLayer.strokeColor = self.blue_color.CGColor;
    self.onBoxLayer.rasterizationScale = 4;
    self.onBoxLayer.shouldRasterize = YES;
    [self setWantsLayer:YES];
    [self.layer addSublayer:self.onBoxLayer];
}

- (void)drawOffBox {
    [self.offBoxLayer removeFromSuperlayer];
    self.offBoxLayer = [CAShapeLayer layer];
    self.offBoxLayer.frame = self.bounds;
    self.offBoxLayer.path = [self.pathManager pathForBox:self.frame.size.width];
    self.offBoxLayer.fillColor = self.offFillColor.CGColor;
    self.offBoxLayer.strokeColor = self.tintColor.CGColor;
    self.offBoxLayer.lineWidth = self.lineWidth;
    self.onBoxLayer.rasterizationScale = 4;
    self.offBoxLayer.shouldRasterize = YES;
    [self setWantsLayer:YES];
    [self.layer addSublayer:self.offBoxLayer];
}

- (void)drawCheckMark {
    [self.checkMarkLayer removeFromSuperlayer];
    self.checkMarkLayer = [CAShapeLayer layer];
    self.checkMarkLayer.frame = self.bounds;
    self.checkMarkLayer.path = [self.pathManager pathForCheckMark];
    if ([_animator isEqual:@"BEMAnimationTypeStroke"]) {
        self.checkMarkLayer.strokeColor = self.blue_color.CGColor;
    } else {
        self.checkMarkLayer.strokeColor = [NSColor whiteColor].CGColor;
    }
    self.checkMarkLayer.lineWidth = self.lineWidth;
    self.checkMarkLayer.fillColor = [NSColor clearColor].CGColor;
    self.checkMarkLayer.lineCap = kCALineCapRound;
    self.checkMarkLayer.lineJoin = kCALineJoinRound;
    self.checkMarkLayer.rasterizationScale = 4;
    self.checkMarkLayer.shouldRasterize = YES;
    [self setWantsLayer:YES];
    [self.layer addSublayer:self.checkMarkLayer];
}


- (void)setOn:(BOOL)on {
    [self setOn:on animated:NO];
}






@end
