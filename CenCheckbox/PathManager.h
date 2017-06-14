//
//  PathManager.h
//  CheckBox
//
//  Created by boo on 03/06/2017.
//  Copyright © 2017 boo. All rights reserved.
//

#import <AppKit/AppKit.h>
#import "CenCheckBox.h"
#import "NSBezierPath.h"


@interface PathManager : NSObject

@property (nonatomic) CGFloat size;

- (CGPathRef)pathForBox:(int) circle_size;
- (CGPathRef)pathForCheckMark;
- (CGPathRef)pathForFlatCheckMark;
- (NSBezierPath *)path_map:(int) circle_size;

@end
