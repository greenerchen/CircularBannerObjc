//
//  TestUtils.m
//  CircularBannerTests
//
//  Created by Greener Chen on 2020/4/16.
//  Copyright © 2020 Greener Chen. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TestUtils.h"

@implementation TestUtils

+ (void)waitFor:(NSTimeInterval)timeInterval
{
    XCTestExpectation *sleep = [[XCTestExpectation alloc] initWithDescription:@"Wait for some time"];
    [XCTWaiter waitForExpectations:@[sleep] timeout:timeInterval];
}
@end
