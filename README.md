# TDWatchInterfaceMenu

Add menu item with a block as the action handler to `WKInterfaceController`

###Usage Example

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

###Problem to Solve

`WKInterfaceController` has some methods to add and remove menu items.
```
func addMenuItemWithImage(image: UIImage, title: String, action: Selector)
func addMenuItemWithImageNamed(imageName: String, title: String, action: Selector)
func addMenuItemWithItemIcon(itemIcon: WKMenuItemIcon, title: String, action: Selector)
func clearAllMenuItems()
```
However, these methods require the `WKInterfaceController` object to be the one handles the menu action. You can not specify the target of the action.

`TDWatchInterfaceMenu` provides a way to add menu item with a block as the action handler.
