//
//  AppDelegate.m
//  XiaoCen_Checkbox
//
//  Created by boo on 03/06/2017.
//  Copyright © 2017 boo. All rights reserved.
//

#import "AppDelegate.h"


@implementation AppDelegate
@synthesize window;


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // set up a window
    int appheight = [[NSScreen mainScreen] frame].size.height;
    NSRect frame = NSMakeRect(50, appheight, 600, 700);
    NSUInteger masks = NSWindowStyleMaskTitled | NSWindowStyleMaskClosable |NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable |NSWindowStyleMaskBorderless;
    window = [[NSWindow alloc] initWithContentRect:frame styleMask:masks backing:NSBackingStoreBuffered defer:NO];
    [window makeKeyAndOrderFront:NSApp];
    [window setTitlebarAppearsTransparent:NO];
    [window setMaxSize:NSMakeSize(420, appheight)];
    [window setMinSize:NSMakeSize(420, appheight/2)];
    [window.contentView setCanDrawConcurrently:YES];
    window.backgroundColor = [NSColor colorWithCalibratedRed:(255/255.0f) green:(255/255.0f) blue:(255/255.0f) alpha:1.0f];
    
    NSTextField* cen = [[NSTextField alloc] initWithFrame:NSMakeRect(130, 450, 340, 200)];
    [cen setStringValue:@"CenCheckBox\nfor\nMacOS"];
    [cen setFont:[NSFont fontWithName:@"Optima" size:45]];
    [cen setEditable:NO];
    [cen setBordered:NO];
    [cen setAlignment:NSTextAlignmentCenter];
    [window.contentView addSubview:cen];
    
    
    // Options:
    // BEMAnimationTypeFlat
    // BEMAnimationTypeFill
    // BEMAnimationTypeStroke
    // BEMAnimationTypeBounce
    
    CenCheckBox *checkbox1 = [[CenCheckBox alloc] initWithFrame:NSMakeRect(90, 240, 200, 200)];
    checkbox1.animator = @"BEMAnimationTypeFlat";
    [window.contentView addSubview:checkbox1];
    
    CenCheckBox *checkbox2 = [[CenCheckBox alloc] initWithFrame:NSMakeRect(310, 240, 200, 200)];
    checkbox2.animator = @"BEMAnimationTypeFill";
    [window.contentView addSubview:checkbox2];
    
    CenCheckBox *checkbox3 = [[CenCheckBox alloc] initWithFrame:NSMakeRect(90, 30, 200, 200)];
    checkbox3.animator = @"BEMAnimationTypeStroke";
    [window.contentView addSubview:checkbox3];
    
    CenCheckBox *checkbox4 = [[CenCheckBox alloc] initWithFrame:NSMakeRect(310, 30, 200, 200)];
    checkbox4.animator = @"BEMAnimationTypeBounce";
    [window.contentView addSubview:checkbox4];
    
    
}



@end
