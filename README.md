# TDWatchInterfaceMenu
Add menu item with action handler block to `WKInterfaceController`

###Usage Example

```
class InterfaceController: WKInterfaceController {
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        let menuItem = TDWatchInterfaceMenuItem(itemIcon: WKMenuItemIcon.Accept, title: NSLocalizedString("Accept", comment: ""), actionHandler: { (item) -> Void in
            println("Accepted!")
        })
        
        let menu = TDWatchInterfaceMenu(forInterfaceController: self)
        menu.addMenuItem(menuItem)
    }
}
```

###Problem to solve

`WKInterfaceController` has some methods to add and remove menu items.
```
func addMenuItemWithImage(image: UIImage, title: String, action: Selector)
func addMenuItemWithImageNamed(imageName: String, title: String, action: Selector)
func addMenuItemWithItemIcon(itemIcon: WKMenuItemIcon, title: String, action: Selector)
func clearAllMenuItems()
```
However, these methods require the `WKInterfaceController` object to be the one who handles the menu action. You can not specify the target of the action.
