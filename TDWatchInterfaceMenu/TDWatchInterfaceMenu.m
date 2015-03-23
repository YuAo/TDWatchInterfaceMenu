//
//  TDWatchInterfaceMenu.m
//  Pods
//
//  Created by YuAo on 3/23/15.
//
//

#import "TDWatchInterfaceMenu.h"
#import "TDWatchInterfaceMenuItem+Private.h"
#import <objc/runtime.h>

NSString * const TDWatchInterfaceMenuItemActionSelectorPrefix = @"td_watchInterfaceMenuItemAction_";

static char TDWKInterfaceControllerWatchInterfaceMenuKey;

@interface TDWatchInterfaceMenu ()

@property (nonatomic,weak) WKInterfaceController *interfaceController;

@property (nonatomic) Class interfaceControllerClass;

@property (nonatomic,copy) NSArray *menuItems;

@end

@implementation TDWatchInterfaceMenu

- (instancetype)initWithInterfaceController:(WKInterfaceController *)controller {
    if (self = [super init]) {
        NSParameterAssert(controller);
        self.interfaceController = controller;
        self.interfaceControllerClass = controller.class;
    }
    return self;
}

+ (instancetype)menuForInterfaceController:(WKInterfaceController *)interfaceController {
    TDWatchInterfaceMenu *menu = objc_getAssociatedObject(interfaceController, &TDWKInterfaceControllerWatchInterfaceMenuKey);
    if (!menu) {
        menu = [[TDWatchInterfaceMenu alloc] initWithInterfaceController:interfaceController];
        objc_setAssociatedObject(interfaceController, &TDWKInterfaceControllerWatchInterfaceMenuKey, menu, OBJC_ASSOCIATION_RETAIN);
    }
    return menu;
}

+ (SEL)actionSelectorForMenuItem:(TDWatchInterfaceMenuItem *)menuItem {
    return NSSelectorFromString([TDWatchInterfaceMenuItemActionSelectorPrefix stringByAppendingFormat:@"%lx",(unsigned long)menuItem.identifier.hash]);
}

- (void)td_watchInterfaceMenuItemAction_placeholder {
    
}

- (void)addMenuItem:(TDWatchInterfaceMenuItem *)menuItem {
    NSParameterAssert(menuItem);
    SEL actionSelector = [TDWatchInterfaceMenu actionSelectorForMenuItem:menuItem];
    if (self.interfaceController && ![self.interfaceController respondsToSelector:actionSelector]) {
        BOOL added =
        class_addMethod(self.interfaceControllerClass,
                        actionSelector,
                        imp_implementationWithBlock(^(id receiver){
                            if (menuItem.actionHandler) {
                                menuItem.actionHandler(receiver,menuItem);
                            }
                        }),
                        method_getTypeEncoding(class_getInstanceMethod(self.class, @selector(td_watchInterfaceMenuItemAction_placeholder))));
        if (added) {
            [menuItem addToInterfaceController:self.interfaceController actionSelector:actionSelector];
            self.menuItems = [[NSArray arrayWithArray:self.menuItems] arrayByAddingObject:menuItem];   
        }
    }
}

- (void)clearAllMenuItems {
    for (TDWatchInterfaceMenuItem *menuItem in self.menuItems) {
        SEL actionSelector = [TDWatchInterfaceMenu actionSelectorForMenuItem:menuItem];
        Method method = class_getInstanceMethod(self.interfaceControllerClass, actionSelector);
        imp_removeBlock(method_getImplementation(method));
        method_setImplementation(method, NULL);
    }
    [self.interfaceController clearAllMenuItems];
    self.menuItems = nil;
}

- (void)dealloc {
    [self clearAllMenuItems];
}

@end
