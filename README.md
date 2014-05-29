US2KeyboardType
===============

US2KeyboardType is a category on UIApplication to determine the current UIKeyboardType state of the keyboard. Since Apple does not provide an API to determine the current state of the keyboard this category helps out by looking through the keyboard hierarchy and find traces of the current state. The `keyboardType` readonly property returns a UIKeyboardType.

    #import "UIApplication+US2KeyboardType.h"
    
    self.textField.keyboardType = [UIApplication sharedApplication].keyboardType;