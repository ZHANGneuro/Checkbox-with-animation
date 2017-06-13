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
@protocol CenCheckBoxDelegate;



@interface CenCheckBox : NSControl


typedef NS_ENUM(NSInteger, BEMAnimationType) {
    BEMAnimationTypeFlat
};


@property (nonatomic, weak) IBOutlet id <CenCheckBoxDelegate> delegate;


@property (nonatomic) IBInspectable BOOL on;


@property (nonatomic) IBInspectable CGFloat lineWidth;


@property (nonatomic) IBInspectable CGFloat animationDuration;


@property (strong, nonatomic) NSColor *blue_color;


@property (strong, nonatomic) NSColor *offFillColor;


@property (strong, nonatomic) NSColor *tintColor;


@property (nonatomic) BEMAnimationType onAnimationType;


@property (nonatomic) BEMAnimationType offAnimationType;


- (void)setOn:(BOOL)on animated:(BOOL)animated;

@end


@protocol CenCheckBoxDelegate <NSObject>

@optional


- (void)didTapCheckBox:(CenCheckBox*)checkBox;


- (void)animationDidStopForCheckBox:(CenCheckBox *)checkBox;

@end

