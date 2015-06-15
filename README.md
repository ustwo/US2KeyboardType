US2KeyboardType
===============

[![Build Status](https://travis-ci.org/ustwo/US2KeyboardType.svg?branch=master)](https://travis-ci.org/ustwo/US2KeyboardType)

US2KeyboardType is a category on UIApplication to determine the current UIKeyboardType state of the keyboard. Apple does not provide an API to determine the state of the keyboard, but this category helps out by looking through the keyboard hierarchy and find traces of the current state.
    
## Blog Post

Read about the problem and the way the library is solving the issue.

[tech.ustwo.com/2014/05/29/ios-uikeyboardtype-issue/](http://tech.ustwo.com/2014/05/29/ios-uikeyboardtype-issue)

## Installation with CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries in your projects. 

#### Podfile

    platform :ios, '7.0'
    pod "US2KeyboardType", "~> 1.0"

#### Usage

The `keyboardType` readonly property returns a UIKeyboardType.

    #import "UIApplication+US2KeyboardType.h"
    
    self.textField.keyboardType = [UIApplication sharedApplication].keyboardType;


## Maintainers

- [Martin Stolz](http://github.com/martinstolz) ([@martin_stolz](https://twitter.com/martin_stolz))

## License

US2KeyboardType is available under the MIT license. See the LICENSE file for more info.

[![githalytics.com alpha](https://cruel-carlota.pagodabox.com/cbd3f42761cc90220cce0156934c1c55 "githalytics.com")](http://githalytics.com/ustwo/US2KeyboardType)
