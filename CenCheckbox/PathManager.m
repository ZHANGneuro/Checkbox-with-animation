//
//  PathManager.m
//  CheckBox
//
//  Created by boo on 03/06/2017.
//  Copyright © 2017 boo. All rights reserved.
//

#import "PathManager.h"

@implementation PathManager

- (NSBezierPath *)path_map:(int) circle_size {
    self.size = circle_size;
    CGFloat radius = self.size / 2.2;
    NSBezierPath* thepath = [NSBezierPath bezierPath];
    [thepath appendBezierPathWithArcWithCenter:CGPointMake(self.size / 2, self.size / 2) radius:radius startAngle:- M_PI / 4 endAngle:2 * M_PI - M_PI / 4 clockwise:YES];
    return thepath;
}

- (CGPathRef)pathForBox:(int) circle_size {
    self.size = circle_size;
    CGFloat radius = self.size / 2.2;
    NSBezierPath* thepath = [NSBezierPath bezierPath];
    [thepath appendBezierPathWithArcWithCenter:CGPointMake(self.size / 2, self.size / 2) radius:radius startAngle:- M_PI / 4 endAngle:2 * M_PI - M_PI / 4 clockwise:YES];
    CGPathRef for_return = [thepath quartzPath];
    return for_return;
}

- (CGPathRef)pathForCheckMark {
    NSBezierPath* checkMarkPath = [NSBezierPath bezierPath];
    [checkMarkPath moveToPoint: CGPointMake(self.size/3.1578, self.size-self.size/2)];
    [checkMarkPath lineToPoint:CGPointMake(self.size/2.0618, self.size-self.size/1.57894)];
    [checkMarkPath moveToPoint: CGPointMake(self.size/2.0618, self.size-self.size/1.57894)];
    [checkMarkPath lineToPoint:CGPointMake(self.size/1.3953, self.size-self.size/2.7272)];
    CGPathRef for_return = [checkMarkPath quartzPath];
    return for_return;
}

- (CGPathRef)pathForFlatCheckMark {
    NSBezierPath* flatCheckMarkPath = [NSBezierPath bezierPath];
    [flatCheckMarkPath moveToPoint: CGPointMake(self.size/4, self.size-self.size/2)];
    [flatCheckMarkPath lineToPoint:CGPointMake(self.size/2, self.size-self.size/2)];
    [flatCheckMarkPath moveToPoint: CGPointMake(self.size/2, self.size-self.size/2)];
    [flatCheckMarkPath lineToPoint:CGPointMake(self.size/1.2, self.size-self.size/2)];
    CGPathRef for_return = [flatCheckMarkPath quartzPath];
    return for_return;
}




@end


