//
//  LKEasyUI_ExampleTests.m
//  LKEasyUI_ExampleTests
//
//  Created by mac on 2020/12/15.
//  Copyright © 2020 lice_home@163.com. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LoginParamVerify.h"
@interface LKEasyUI_ExampleTests : XCTestCase
@property (nonatomic, strong) LoginParamVerify *pv;
@end

@implementation LKEasyUI_ExampleTests

- (void)setUp {
    _pv = [[LoginParamVerify alloc]init];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    _pv = nil;
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testVerifyPhone {
    LoginParamVerifyResult *ps = [_pv verifyPhoneNumber:@"1235"];
    XCTAssertFalse(ps.isVailed);
    
    ps = [_pv verifyPhoneNumber:@"13404769923"];
    XCTAssertTrue(ps.isVailed);
    
    ps = [_pv verifyPhoneNumber:@"134047699231"];
    
    XCTAssertFalse(ps.isVailed);
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

@end
