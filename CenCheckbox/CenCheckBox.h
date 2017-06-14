//
//  CenCheckBox.h
//  CheckBox
//
//  Created by boo on 03/06/2017.
//  Copyright © 2017 boo. All rights reserved.
//

#import <AppKit/AppKit.h>
#import "AnimationManager.h"
#import "PathManager.h"
#import <QuartzCore/CAShapeLayer.h>
#import <QuartzCore/CATextLayer.h>


@interface CenCheckBox : NSControl

@property (nonatomic) BOOL on;
@property (nonatomic) CGFloat lineWidth;
@property (nonatomic) CGFloat animationDuration;
@property (strong, nonatomic) NSColor *blue_color;
@property (strong, nonatomic) NSColor *offFillColor;
@property (strong, nonatomic) NSColor *tintColor;
@property (strong, nonatomic) NSString *animator;

- (void) setOn:(BOOL)on animated:(BOOL)animated;

@end




