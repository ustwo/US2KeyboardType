//
//  UIApplication+US2KeyboardType.m
//  US2KeyboardType
//
//  Created by Martin on 29/05/2014.
//  Copyright (c) 2014 ustwo. All rights reserved.
//

#import "UIApplication+US2KeyboardType.h"
#import <objc/message.h>


@implementation UIApplication (US2KeyboardType)

- (UIKeyboardType)keyboardType
{
    UIKeyboardType keyboardType = [self us2_determineKeyboardType];
    return keyboardType;
}

- (UIKeyboardType)us2_determineKeyboardType
{
    UIWindow *keyboardWindow = [self us2_keyboardWindow];
    UIView *keyboardView = [self us2_keyboardViewInKeyboardWindow:keyboardWindow];
    NSString *componentName = [self us2_componentNameFromKeyboardView:keyboardView];
    UIKeyboardType keyboardType = [self us2_mapComponentNameToKeyboardType:componentName];
    
    return keyboardType;
}

- (UIWindow *)us2_keyboardWindow
{
    UIWindow *keyboardWindow = nil;
    for (UIWindow *window in self.windows)
    {
        if (![window.class isEqual:UIWindow.class])
        {
            keyboardWindow = window;
            break;
        }
    }
    
    return keyboardWindow;
}

- (UIView *)us2_keyboardViewInKeyboardWindow:(UIWindow *)keyboardWindow
{
    UIView *foundKeyboard = nil;
    for (UIView *possibleKeyboard in keyboardWindow.subviews)
    {
        Class keyboardClass = NSClassFromString(@"UIPeripheralHostView");
        if ([possibleKeyboard isKindOfClass:keyboardClass])
        {
            foundKeyboard = possibleKeyboard;
            break;
        }
    }
    
    return foundKeyboard;
}

- (NSString *)us2_componentNameFromKeyboardView:(UIView *)keyboardView
{
    NSString *componentName = nil;
    
    id keyplane = nil;
    [self us2_keyboardKeyplaneView:&keyplane inKeyboardView:keyboardView];
    SEL componentNameSelector = NSSelectorFromString(@"componentName");
    componentName = objc_msgSend(keyplane, componentNameSelector);
    
    return componentName;
}

- (void)us2_keyboardKeyplaneView:(id *)keyplaneView inKeyboardView:(UIView *)keyboardView
{
    NSArray *subviews = keyboardView.subviews;
    if (subviews.count == 0)
    {
        return;
    }
    
    for (UIView *subview in subviews)
    {
        if ([NSStringFromClass(subview.class) isEqualToString:@"UIKBKeyplaneView"])
        {
            SEL keyplaneSelector = NSSelectorFromString(@"keyplane");
            if ([subview respondsToSelector:keyplaneSelector])
            {
                NSObject *keyplane = objc_msgSend(subview, keyplaneSelector);
                if (keyplane.class == NSClassFromString(@"UIKBTree"))
                {
                    *keyplaneView = keyplane;
                    return;
                }
            }
        }
        
        [self us2_keyboardKeyplaneView:keyplaneView inKeyboardView:subview];
    }
}

- (UIKeyboardType)us2_mapComponentNameToKeyboardType:(NSString *)componentName
{
    UIKeyboardType keyboardType = 0;
    
    NSDictionary *mapDictionary = @{
                                    @"Capital-Letters": @(UIKeyboardTypeASCIICapable),
                                    @"Small-Letters": @(UIKeyboardTypeASCIICapable),
                                    @"First-Alternate": @(UIKeyboardTypeASCIICapable),
                                    @"Numbers-And-Punctuation": @(UIKeyboardTypeNumbersAndPunctuation),
                                    @"Numbers-And-Punctuation-Alternate": @(UIKeyboardTypeNumbersAndPunctuation)
                                    };
    
    NSNumber *value = [mapDictionary valueForKey:componentName];
    if (value)
    {
        keyboardType = [value intValue];
    }
    
    return keyboardType;
}

@end
