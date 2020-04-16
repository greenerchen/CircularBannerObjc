//
//  CircularBannerTests.m
//  CircularBannerTests
//
//  Created by Greener Chen on 2020/4/15.
//  Copyright © 2020 Greener Chen. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <FBSnapshotTestCase/FBSnapshotTestCase.h>
#import "TestUtils/TestUtils.h"
#import "CircularBanner.h"
#import "ViewController.h"

@interface CircularBannerTests : FBSnapshotTestCase

@property (nonatomic, strong) ViewController *sut;
@property (nonatomic, strong) CircularBanner *banner;
@end

@implementation CircularBannerTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    self.banner = [[CircularBanner alloc] initWithFrame:CGRectMake(0, 0, 250, 100)];
    
    self.recordMode = NO;
}

- (void)tearDown {
    [super tearDown];
    // Put teardown code here. This method is called after the invocation of each test method in the class.
}

- (void)testGiven1Image_BannerWillShow1ImageAndNotScrollable {
    struct CircularBannerModel model;
    model.imageNames = @[@"banner-1"];
    self.banner.model = model;
    
    FBSnapshotVerifyView(self.banner, @"item-1");
}

- (void)testGiven2Image_BannerWillScroll2ImagesCircularly {
    struct CircularBannerModel model;
    model.imageNames = @[@"banner-1", @"banner-2"];
    self.banner.model = model;
    
    // verify image 1
    FBSnapshotVerifyView(self.banner, @"item-1");
    
    // scroll to next image and verify it's image 2
    [self.banner scrollToNext];
    [TestUtils waitFor:1.0];
    FBSnapshotVerifyView(self.banner, @"item-2");
    
    // scroll to next image and verify it's image 1
    [self.banner scrollToNext];
    [TestUtils waitFor:1.0];
    FBSnapshotVerifyView(self.banner, @"item-3");
    
    // scroll to next image and verify it's image 2
    [self.banner scrollToNext];
    [TestUtils waitFor:1.0];
    FBSnapshotVerifyView(self.banner, @"item-4");
    
    // scroll to previous image and verify it's image 1
    [self.banner scrollToPrevious];
    [TestUtils waitFor:1.0];
    FBSnapshotVerifyView(self.banner, @"item-5");
    
    // scroll to previous image and verify it's image 2
    [self.banner scrollToPrevious];
    [TestUtils waitFor:1.0];
    FBSnapshotVerifyView(self.banner, @"item-6");
    
    // scroll to previous image and verify it's image 1
    [self.banner scrollToPrevious];
    [TestUtils waitFor:1.0];
    FBSnapshotVerifyView(self.banner, @"item-7");
}

- (void)testGiven2ImageAndAutoScrollingEnabled_BannerWillAutoScroll2ImagesCircularly {
    struct CircularBannerModel model;
    model.imageNames = @[@"banner-1", @"banner-2"];
    self.banner.model = model;
    [self.banner setAutoScrollingEnabled:YES withTimeInterval:1.0];
    
    for (int i = 1; i <= 4; i++) {
        NSString *_id = [NSString stringWithFormat:@"item-%d", i];
        [TestUtils waitFor:1.0];
        FBSnapshotVerifyView(self.banner, _id);
    }
    
}

- (void)testGiven3Image_BannerWillScroll3ImagesCircularly {
    struct CircularBannerModel model;
    model.imageNames = @[@"banner-1", @"banner-2", @"banner-3"];
    self.banner.model = model;
    
    // verify image 1
    FBSnapshotVerifyView(self.banner, @"item-1");
    
    // scroll to next image and verify it's image 2
    [self.banner scrollToNext];
    [TestUtils waitFor:1.0];
    FBSnapshotVerifyView(self.banner, @"item-2");
    
    // scroll to next image and verify it's image 3
    [self.banner scrollToNext];
    [TestUtils waitFor:1.0];
    FBSnapshotVerifyView(self.banner, @"item-3");
    
    // scroll to next image and verify it's image 1
    [self.banner scrollToNext];
    [TestUtils waitFor:1.0];
    FBSnapshotVerifyView(self.banner, @"item-4");
    
    // scroll to next image and verify it's image 2
    [self.banner scrollToNext];
    [TestUtils waitFor:1.0];
    FBSnapshotVerifyView(self.banner, @"item-5");
    
    // scroll to previous image and verify it's image 1
    [self.banner scrollToPrevious];
    [TestUtils waitFor:1.0];
    FBSnapshotVerifyView(self.banner, @"item-6");
    
    // scroll to previous image and verify it's image 3
    [self.banner scrollToPrevious];
    [TestUtils waitFor:1.0];
    FBSnapshotVerifyView(self.banner, @"item-7");
    
    // scroll to previous image and verify it's image 2
    [self.banner scrollToPrevious];
    [TestUtils waitFor:1.0];
    FBSnapshotVerifyView(self.banner, @"item-8");
    
    // scroll to previous image and verify it's image 1
    [self.banner scrollToPrevious];
    [TestUtils waitFor:1.0];
    FBSnapshotVerifyView(self.banner, @"item-9");
}

- (void)testGiven3ImageAndAutoScrollingEnabled_BannerWillAutoScroll3ImagesCircularly {
    struct CircularBannerModel model;
    model.imageNames = @[@"banner-1", @"banner-2"];
    self.banner.model = model;
    [self.banner setAutoScrollingEnabled:YES withTimeInterval:1.0];
    
    for (int i = 1; i <= 9; i++) {
        NSString *_id = [NSString stringWithFormat:@"item-%d", i];
        [TestUtils waitFor:1.0];
        FBSnapshotVerifyView(self.banner, _id);
    }
}

@end
