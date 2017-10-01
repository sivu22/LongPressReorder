# LongPressReorder

![Swift](https://img.shields.io/badge/Swift-4-brightgreen.svg)
[![Version](https://img.shields.io/cocoapods/v/LongPressReorder.svg?style=flat)](http://cocoapods.org/pods/LongPressReorder)
[![License](https://img.shields.io/cocoapods/l/LongPressReorder.svg?style=flat)](http://cocoapods.org/pods/LongPressReorder)
[![Platform](https://img.shields.io/cocoapods/p/LongPressReorder.svg?style=flat)](http://cocoapods.org/pods/LongPressReorder)

LongPressReorder adresses a common use case when working with tables on an iOS device: the posibility to reorder table rows using a long press gesture, similar to drag and drop gesture. Lightweight and easy to use, LongPressReorder works with any view controller that manages an UITableView. Tables with one or multiple sections are supported.

This Swift module is based on the well-known article posted on raywenderlich.com: 

[Cookbook: Moving Table View Cells with a Long Press Gesture](https://www.raywenderlich.com/63089/cookbook-moving-table-view-cells-with-a-long-press-gesture)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

**UITableViewController with fixed first cell**

![LongPressReorder](/Screenshots/LongPressReorder.gif)

## Usage

Because of the way Swift handles protocols and extensions, it's extremely hard or next to impossible to add the desired behaviour directly on UIViewController or UITableView. Using the objc_setAssociatedObject hack is not an elegant Swift solution, therefore this module uses a wrapper of UITableView to achieve flexibility and cover all use cases.

### Creation

First of all, import LongPressReorder into your view controller and declare a new variable
```swift
var reorderTableView: LongPressReorderTableView!
```

Assuming we are working with a UITableViewController, create the object in onViewDidLoad()
```swift
override func viewDidLoad() {
    super.viewDidLoad()
        
    reorderTableView = LongPressReorderTableView(tableView)
}
```

In the case of a regular UIViewController with an UITableView inside, use the specific table outlet
```swift
reorderTableView = LongPressReorderTableView(yourTableViewOutlet)
```

The only thing left now is to enable it with
```swift
reorderTableView.enableLongPressReorder()
```

That was all. All the cells inside the UITableView can now be reordered using the long press gesture.

You may want to also disable the table's Selection on the cell for a better visual effect.

### Interaction

Use the delegate member to enable interaction with the LongPressReorderTableView. onViewDidLoad() usually looks like this
```swift
reorderTableView = LongPressReorderTableView(tableView)
reorderTableView.delegate = self
reorderTableView.enableLongPressReorder()
```

Reordering of cells is now purely visual. If you want to also change the model behind the table, LongPressReorder offers the following optional functions which can be grouped in a view controller extension
```swift
extension SpecificViewController {
    
    override func positionChanged(currentIndex: IndexPath, newIndex: IndexPath) {
        // currentIndex and newIndex rows are swapped, implement accordingly
    }
    
    override func reorderFinished(initialIndex: IndexPath, finalIndex: IndexPath) {
        // Gesture is finished and cell is back inside the table at finalIndex position
    }
}
```

The module offers additional functions, which can be overridden in order to specify which cells cannot be moved or cannot lose their position inside the table
```swift
extension SpecificViewController {
    
    override func startReorderingRow(atIndex indexPath: IndexPath) -> Bool {
        // All table cells except the first one can be reordered
        if indexPath.row > 0 {
            return true
        }
        
        // First cell will not respond to the long press gesture
        return false
    }
    
    override func allowChangingRow(atIndex indexPath: IndexPath) -> Bool {
        // All table cells except the first one can be replaced with the selected cell
        if indexPath.row > 0 {
            return true
        }
        
        // First cell will not lose its position and therefore no other cell can replace it
        return false
    }
}
```

### Customization

After pressing on the desired cell, it will pop out of the table and will be ready to be dragged around. This pop out effect can be customized using 4 different scales for the selected cell: none, small, medium and big (default is medium).
```swift
reorderTableView = LongPressReorderTableView(elementsTableView, selectedRowScale: SelectedRowScale.small)
```


## Requirements

- Swift 3
- iOS 9.0 +
- XCode 8.0+

## Installation

### CocoaPods
LongPressReorder is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "LongPressReorder"
```
or

```ruby
pod 'LongPressReorder', '~> 1.1.0'
```

### Manually
Simply copy LongPressReorder.swift to your project and you're ready to go.

## Author

Cristian Sava, cristianzsava@gmail.com

## License

LongPressReorder is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
