//
//  TDWatchInterfaceMenuItem.h
//  Pods
//
//  Created by YuAo on 3/23/15.
//
//

#import <Foundation/Foundation.h>
#import <WatchKit/WatchKit.h>

@class TDWatchInterfaceMenuItem;

typedef void (^TDWatchInterfaceMenuItemActionHandler)(WKInterfaceController *interfaceController, TDWatchInterfaceMenuItem *sender);

@interface TDWatchInterfaceMenuItem : NSObject

@property (nonatomic,copy,readonly) NSString *identifier;

@property (nonatomic,copy,readonly) TDWatchInterfaceMenuItemActionHandler actionHandler;

- (instancetype)initWithImage:(UIImage *)image title:(NSString *)title actionHandler:(TDWatchInterfaceMenuItemActionHandler)actionHandler NS_DESIGNATED_INITIALIZER;

- (instancetype)initWithImageNamed:(NSString *)imageName title:(NSString *)title actionHandler:(TDWatchInterfaceMenuItemActionHandler)actionHandler NS_DESIGNATED_INITIALIZER;

- (instancetype)initWithItemIcon:(WKMenuItemIcon)itemIcon title:(NSString *)title actionHandler:(TDWatchInterfaceMenuItemActionHandler)actionHandler NS_DESIGNATED_INITIALIZER;

@end
