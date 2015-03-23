//
//  TDWatchInterfaceMenu.h
//  Pods
//
//  Created by YuAo on 3/23/15.
//
//

#import <Foundation/Foundation.h>
#import <WatchKit/WatchKit.h>
#import <TDWatchInterfaceMenu/TDWatchInterfaceMenuItem.h>

@interface TDWatchInterfaceMenu : NSObject

+ (instancetype)menuForInterfaceController:(WKInterfaceController *)interfaceController;

- (void)addMenuItem:(TDWatchInterfaceMenuItem *)menuItem;
- (void)clearAllMenuItems;

@end
