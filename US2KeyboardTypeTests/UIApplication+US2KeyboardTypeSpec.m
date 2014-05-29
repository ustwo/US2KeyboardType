//
//  US2KeyboardTypeTests.m
//  US2KeyboardTypeTests
//
//  Created by Martin on 29/05/2014.
//  Copyright (c) 2014 ustwo. All rights reserved.
//

#import "Specta.h"
#define EXP_SHORTHAND
#import "Expecta.h"
#define MOCKITO_SHORTHAND
#import "OCMockito.h"

#import <UIKit/UIKit.h>
#import "UIApplication+US2KeyboardType.h"


SpecBegin(UIApplication_US2KeyboardType)

describe(@"UIApplication+US2KeyboardType", ^{
    
    __block UIApplication *applicationMock = nil;
    
    beforeEach(^{
//        applicationMock = mock([UIApplication class]);
//        [given([applicationMock keyboardType]) willReturnUnsignedInteger:UIKeyboardTypeNumbersAndPunctuation];
    });
    
//    pending(@"keyboardType should be ASCIII", ^{
//        UIKeyboardType expectedKeyboardType = UIKeyboardTypeNumbersAndPunctuation;
//        UIKeyboardType actualKeyboardType = [applicationMock keyboardType];
//        expect(expectedKeyboardType).to.equal(actualKeyboardType);
//    });
});

SpecEnd