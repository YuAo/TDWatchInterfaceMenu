# TDWatchInterfaceMenu
![CocoaPods Platform](https://img.shields.io/cocoapods/p/TDWatchInterfaceMenu.svg?style=flat-square)
![CocoaPods Version](https://img.shields.io/cocoapods/v/TDWatchInterfaceMenu.svg?style=flat-square)
![CocoaPods License](https://img.shields.io/cocoapods/l/TDWatchInterfaceMenu.svg?style=flat-square)

##Usage

```
class InterfaceController: WKInterfaceController {
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let menuItem = TDWatchInterfaceMenuItem(itemIcon: WKMenuItemIcon.Accept, title: NSLocalizedString("Accept", comment: ""), actionHandler: { (interfaceController, menuItem) -> Void in
            println("Accepted!")
        })
        
        let menu = TDWatchInterfaceMenu(forInterfaceController: self)
        menu.addMenuItem(menuItem)
    }
}
```

##Problem to Solve

`WKInterfaceController` has some methods to add and remove menu items.
```
func addMenuItemWithImage(image: UIImage, title: String, action: Selector)
func addMenuItemWithImageNamed(imageName: String, title: String, action: Selector)
func addMenuItemWithItemIcon(itemIcon: WKMenuItemIcon, title: String, action: Selector)
func clearAllMenuItems()
```
However, these methods require the `WKInterfaceController` object to be the one that handles the menu action. You cannot specify the target of the action.

`TDWatchInterfaceMenu` provides a way to add a menu item with a block as the action handler. More importantly, it decouples the menu item from the implementation of interface controller, makes it easier to reuse the menu item or, more commonly, the interface controller.

##Contributing

If you find a bug and know exactly how to fix it, please open a pull request.

If you can't make the change yourself, please open an issue after making sure that one isn't already logged.

##License

The MIT license
