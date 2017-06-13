//
//  AppDelegate.m
//  XiaoCen_Checkbox
//
//  Created by boo on 03/06/2017.
//  Copyright © 2017 boo. All rights reserved.
//

#import "AppDelegate.h"


@implementation AppDelegate
@synthesize window,checkbox;


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // set up a window
    int appheight = [[NSScreen mainScreen] frame].size.height;
    NSRect frame = NSMakeRect(50, appheight, 600, 300);
    NSUInteger masks = NSWindowStyleMaskTitled | NSWindowStyleMaskClosable |NSWindowStyleMaskMiniaturizable | NSWindowStyleMaskResizable |NSWindowStyleMaskBorderless;
    window = [[NSWindow alloc] initWithContentRect:frame styleMask:masks backing:NSBackingStoreBuffered defer:NO];
    [window makeKeyAndOrderFront:NSApp];
    [window setTitlebarAppearsTransparent:NO];
    [window setMaxSize:NSMakeSize(420, appheight)];
    [window setMinSize:NSMakeSize(420, appheight/2)];
    [window.contentView setCanDrawConcurrently:YES];
    window.backgroundColor = [NSColor colorWithCalibratedRed:(255/255.0f) green:(255/255.0f) blue:(255/255.0f) alpha:1.0f];
    
    
    
    checkbox = [[CenCheckBox alloc] initWithFrame:NSMakeRect(350, 50, 200, 200)];
    [window.contentView addSubview:checkbox];
    
    NSTextField* cen = [[NSTextField alloc] initWithFrame:NSMakeRect(20, 30, 340, 200)];
    [cen setStringValue:@"CenCheckBox\nfor\nMacOS"];
    [cen setFont:[NSFont fontWithName:@"Optima" size:45]];
    [cen setEditable:NO];
    [cen setBordered:NO];
    [cen setAlignment:NSTextAlignmentCenter];
    
    
    [window.contentView addSubview:cen];
    
}



@end
