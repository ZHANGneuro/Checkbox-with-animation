//
//  NSBezierPath_to_CGPathRef.h
//  checkbox_for_osx
//
//  Created by boo on 12/06/2017.
//  Copyright © 2017 boo. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <Foundation/Foundation.h>

@interface NSBezierPath (BezierPathQuartzUtilities)

- (CGPathRef)quartzPath;

@end
