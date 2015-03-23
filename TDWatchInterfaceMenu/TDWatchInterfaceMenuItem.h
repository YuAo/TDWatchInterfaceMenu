//
//  TDWatchInterfaceMenuItem.h
//  Pods
//
//  Created by YuAo on 3/23/15.
//
//

#import <Foundation/Foundation.h>
#import <WatchKit/WatchKit.h>

@interface TDWatchInterfaceMenuItem : NSObject

@property (nonatomic,copy,readonly) NSString *identifier;

@property (nonatomic,copy,readonly) void (^actionHandler)(TDWatchInterfaceMenuItem *sender);

- (instancetype)initWithImage:(UIImage *)image title:(NSString *)title actionHandler:(void (^)(TDWatchInterfaceMenuItem *sender))actionHandler;

- (instancetype)initWithImageNamed:(NSString *)imageName title:(NSString *)title actionHandler:(void (^)(TDWatchInterfaceMenuItem *sender))actionHandler;

- (instancetype)initWithItemIcon:(WKMenuItemIcon)itemIcon title:(NSString *)title actionHandler:(void (^)(TDWatchInterfaceMenuItem *sender))actionHandler;

@end
