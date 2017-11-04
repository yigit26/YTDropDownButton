# YTDropDownButton



## Screenshots




## Usage
First of all import module
```swift
 import YTDropDownButton
```
Then you can use like this :
#via Code

```swift
        let dropButtonCode = YTDropDownButton(frame: .zero)
        dropButtonCode.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        dropButtonCode.titleLabel?.textColor = UIColor.white
        dropButtonCode.setTitle("Button from code", for: .normal)
        dropButtonCode.dropViewTextColor = UIColor.white
        dropButtonCode.dropViewBackground = #colorLiteral(red: 0.168484956, green: 0.4678698778, blue: 0.7191821933, alpha: 1)
        dropButtonCode.dropViewFont = UIFont(name: "AvenirNext-Regular", size: 15)
        dropButtonCode.maximumHeightForDropView = 100
        dropButtonCode.setData(arr: ["Option1","Option2","Option3","Option4","Option5"])
        
        dropButtonCode.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(dropButtonCode)
        
        dropButtonCode.widthAnchor.constraint(equalToConstant: 200).isActive  = true
        dropButtonCode.heightAnchor.constraint(equalToConstant: 60).isActive = true
        dropButtonCode.topAnchor.constraint(equalTo: self.view.topAnchor, constant:30).isActive = true
        dropButtonCode.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
```
## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements
iOS9+

## Installation

YTDropDownButton is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "YTDropDownButton"
```

## Author

Yigit Can Ture,

## License

YTDropDownButton is available under the MIT license. See the LICENSE file for more info.
