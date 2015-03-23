//
//  TDWatchInterfaceMenuItem.m
//  Pods
//
//  Created by YuAo on 3/23/15.
//
//

#import "TDWatchInterfaceMenuItem.h"

@interface TDWatchInterfaceMenuItem ()

@property (nonatomic,copy) TDWatchInterfaceMenuItemActionHandler actionHandler;

@property (nonatomic,copy) void (^actionForAddingMenuItemToInterfaceController)(WKInterfaceController *interfaceController, SEL selector);

@end

@implementation TDWatchInterfaceMenuItem

@synthesize identifier = _identifier;

- (NSString *)identifier {
    if (!_identifier) {
        _identifier = NSProcessInfo.processInfo.globallyUniqueString;
    }
    return _identifier;
}

- (instancetype)initWithImage:(UIImage *)image title:(NSString *)title actionHandler:(TDWatchInterfaceMenuItemActionHandler)actionHandler {
    if (self = [super init]) {
        self.actionHandler = actionHandler;
        self.actionForAddingMenuItemToInterfaceController = ^(WKInterfaceController *interfaceController, SEL selector) {
            [interfaceController addMenuItemWithImage:image title:title action:selector];
        };
    }
    return self;
}

- (instancetype)initWithImageNamed:(NSString *)imageName title:(NSString *)title actionHandler:(TDWatchInterfaceMenuItemActionHandler)actionHandler {
    if (self = [super init]) {
        self.actionHandler = actionHandler;
        self.actionForAddingMenuItemToInterfaceController = ^(WKInterfaceController *interfaceController, SEL selector) {
            [interfaceController addMenuItemWithImageNamed:imageName title:title action:selector];
        };
    }
    return self;
}

- (instancetype)initWithItemIcon:(WKMenuItemIcon)itemIcon title:(NSString *)title actionHandler:(TDWatchInterfaceMenuItemActionHandler)actionHandler {
    if (self = [super init]) {
        self.actionHandler = actionHandler;
        self.actionForAddingMenuItemToInterfaceController = ^(WKInterfaceController *interfaceController, SEL selector) {
            [interfaceController addMenuItemWithItemIcon:itemIcon title:title action:selector];
        };
    }
    return self;
}

@end

#import "TDWatchInterfaceMenuItem+Private.h"

@implementation TDWatchInterfaceMenuItem (Private)

- (void)addToInterfaceController:(WKInterfaceController *)interfaceController actionSelector:(SEL)actionSelector {
    if (self.actionForAddingMenuItemToInterfaceController) {
        self.actionForAddingMenuItemToInterfaceController(interfaceController,actionSelector);
    }
}

@end
