//
//  AppDelegate.m
//  Bitrise
//
//  Created by Deszip on 04/07/2018.
//  Copyright © 2018 Bitrise. All rights reserved.
//

#import "AppDelegate.h"

#import "BRMainController.h"
#import "BRDependencyContainer.h"

@interface AppDelegate () <NSPopoverDelegate>

@property (strong, nonatomic) BRMainController *mainController;
@property (strong, nonatomic) BRMainController *detachableMainController;

@property (strong, nonatomic) NSWindowController *detachableWindowController;
@property (strong, nonatomic) NSStatusItem *statusItem;
@property (strong, nonatomic) NSPopover *popover;

@end

@implementation AppDelegate

- (instancetype)init {
    if (self = [super init]) {
        
#if DEBUG
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"NSConstraintBasedLayoutVisualizeMutuallyExclusiveConstraints"];
#endif
        
        BRDependencyContainer *container = [BRDependencyContainer new];
        
        _statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSSquareStatusItemLength];
        _popover = [[NSPopover alloc] init];
        _popover.delegate = self;
        
        _mainController = [[NSStoryboard mainStoryboard] instantiateControllerWithIdentifier:@"BRMainController"];
        _mainController.dependencyContainer = container;
        _detachableMainController = [[NSStoryboard mainStoryboard] instantiateControllerWithIdentifier:@"BRMainController"];
        _detachableMainController.dependencyContainer = container;
        
        _detachableWindowController = [[NSStoryboard mainStoryboard] instantiateControllerWithIdentifier:@"BRMainWindow"];
    }
    
    return self;
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    NSImage *image = [NSImage imageNamed:@"bitrise-logo"];
    self.statusItem.button.image = image;
    self.statusItem.button.imageScaling = NSImageScaleProportionallyDown;
    self.statusItem.button.alternateImage = image;
    [self.statusItem.button setAction:@selector(togglePopover:)];
    
    self.popover.contentViewController = self.mainController;
    self.popover.behavior = NSPopoverBehaviorTransient;
}


#pragma mark - Actions -

- (void)togglePopover:(NSStatusBarButton *)sender {
    if (self.popover.shown) {
        [self.popover performClose:self];
    } else {
        if (self.detachableWindowController.window.isVisible) {
            [self.detachableWindowController.window makeKeyAndOrderFront:self];
        } else {
            [self.popover showRelativeToRect:sender.bounds ofView:sender preferredEdge:NSRectEdgeMinY];
        }
    }
}

#pragma mark - NSPopoverDelegate -

- (BOOL)popoverShouldDetach:(NSPopover *)popover {
    return YES;
}

- (NSWindow *)detachableWindowForPopover:(NSPopover *)popover {
    self.detachableWindowController.window.contentViewController = self.detachableMainController;
    [self.detachableWindowController.window setMovableByWindowBackground:YES];
    
    return self.detachableWindowController.window;
}


@end