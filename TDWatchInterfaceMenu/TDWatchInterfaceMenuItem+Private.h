//
//  TDWatchInterfaceMenuItem+Private.h
//  Pods
//
//  Created by YuAo on 3/23/15.
//
//

#import <Foundation/Foundation.h>
#import <TDWatchInterfaceMenu/TDWatchInterfaceMenuItem.h>

@interface TDWatchInterfaceMenuItem (Private)

- (void)addToInterfaceController:(WKInterfaceController *)interfaceController actionSelector:(SEL)actionSelector;

@end
