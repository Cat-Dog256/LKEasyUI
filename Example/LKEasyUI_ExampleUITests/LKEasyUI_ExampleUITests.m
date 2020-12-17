//
//  LKEasyUI_ExampleUITests.m
//  LKEasyUI_ExampleUITests
//
//  Created by mac on 2020/12/15.
//  Copyright © 2020 lice_home@163.com. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface LKEasyUI_ExampleUITests : XCTestCase

@end

@implementation LKEasyUI_ExampleUITests

- (void)setUp {
    // Put setup code here. This method is called before the invocation of each test method in the class.

    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testLoginAction{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app launch];

    XCUIElement *element = [[[[[[[app childrenMatchingType:XCUIElementTypeWindow] elementBoundByIndex:0] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther] elementBoundByIndex:1];
    
    XCUIElement *loginPhoneTfTextField = [[element.textFields matchingType:XCUIElementTypeTextField identifier:@"login_phone_tf"]elementBoundByIndex:0];
    [loginPhoneTfTextField tap];
    [loginPhoneTfTextField typeText:@"13404568899"];


    XCUIElement *loginPwdTfTextField = element/*@START_MENU_TOKEN@*/.textFields[@"login_pwd_tf"]/*[[".textFields[@\"\\U8bf7\\U8f93\\U5165\\U5bc6\\U7801\"]",".textFields[@\"login_pwd_tf\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/;
    [loginPwdTfTextField tap];
    [loginPwdTfTextField typeText:@"123456"];
    
    XCUIElement *loginSubmitButton = element.buttons[@"login_submit"];
    [loginSubmitButton tap];
    
}
- (void)testExample {
    // UI tests must launch the application that they test.
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app launch];

    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testLaunchPerformance {
    if (@available(macOS 10.15, iOS 13.0, tvOS 13.0, *)) {
        // This measures how long it takes to launch your application.
        [self measureWithMetrics:@[[[XCTApplicationLaunchMetric alloc] init]] block:^{
            [[[XCUIApplication alloc] init] launch];
        }];
    }
}

@end
