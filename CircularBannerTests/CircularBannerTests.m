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


@interface CircularBannerTests : FBSnapshotTestCase

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
    NSArray *imageNames = @[@"banner-1"];
    CircularBannerModel *model = [[CircularBannerModel alloc] initWithImageNames:imageNames autoScrollingEnabled:NO timeInterval:0];
    self.banner.model = model;
    
    FBSnapshotVerifyView(self.banner, @"item-1");
}

- (void)testGiven2Image_BannerWillScroll2ImagesCircularly {
    NSArray *imageNames = @[@"banner-1", @"banner-2"];
    CircularBannerModel *model = [[CircularBannerModel alloc] initWithImageNames:imageNames autoScrollingEnabled:NO timeInterval:0];
    self.banner.model = model;
    
    // verify image 1
    FBSnapshotVerifyView(self.banner, @"item-1");
    
    // scroll to next image and verify it's image 2
    [self.banner scrollToNext:YES animated:NO];
    [TestUtils waitFor:0.3];
    FBSnapshotVerifyView(self.banner, @"item-2");
    
    // scroll to next image and verify it's image 1
    [self.banner scrollToNext:YES animated:NO];
    [TestUtils waitFor:0.3];
    FBSnapshotVerifyView(self.banner, @"item-3");
    
    // scroll to next image and verify it's image 2
    [self.banner scrollToNext:YES animated:NO];
    [TestUtils waitFor:0.3];
    FBSnapshotVerifyView(self.banner, @"item-4");
    
    // scroll to previous image and verify it's image 1
    [self.banner scrollToNext:NO animated:NO];
    [TestUtils waitFor:0.3];
    FBSnapshotVerifyView(self.banner, @"item-5");
    
    // scroll to previous image and verify it's image 2
    [self.banner scrollToNext:NO animated:NO];
    [TestUtils waitFor:0.3];
    FBSnapshotVerifyView(self.banner, @"item-6");
    
    // scroll to previous image and verify it's image 1
    [self.banner scrollToNext:NO animated:NO];
    [TestUtils waitFor:0.3];
    FBSnapshotVerifyView(self.banner, @"item-7");
}

- (void)testGiven2ImageAndAutoScrollingEnabled_BannerWillAutoScroll2ImagesCircularly {
    NSArray *imageNames = @[@"banner-1", @"banner-2"];
    CircularBannerModel *model = [[CircularBannerModel alloc] initWithImageNames:imageNames autoScrollingEnabled:YES timeInterval:0.5];
    self.banner.model = model;
    
    for (int i = 1; i <= 4; i++) {
        [TestUtils waitFor:0.5];
        NSString *_id = [NSString stringWithFormat:@"item-%d", i];
        FBSnapshotVerifyView(self.banner, _id);
    }
    
}

- (void)testGiven3Image_BannerWillScroll3ImagesCircularly {
    NSArray *imageNames = @[@"banner-1", @"banner-2", @"banner-3"];
    CircularBannerModel *model = [[CircularBannerModel alloc] initWithImageNames:imageNames autoScrollingEnabled:NO timeInterval:0];
    
    self.banner.model = model;
    
    // verify image 1
    FBSnapshotVerifyView(self.banner, @"item-1");
    
    // scroll to next image and verify it's image 2
    [self.banner scrollToNext:YES animated:NO];
    [TestUtils waitFor:0.3];
    FBSnapshotVerifyView(self.banner, @"item-2");
    
    // scroll to next image and verify it's image 3
    [self.banner scrollToNext:YES animated:NO];
    [TestUtils waitFor:0.3];
    FBSnapshotVerifyView(self.banner, @"item-3");
    
    // scroll to next image and verify it's image 1
    [self.banner scrollToNext:YES animated:NO];
    [TestUtils waitFor:0.3];
    FBSnapshotVerifyView(self.banner, @"item-4");
    
    // scroll to next image and verify it's image 2
    [self.banner scrollToNext:YES animated:NO];
    [TestUtils waitFor:0.3];
    FBSnapshotVerifyView(self.banner, @"item-5");
    
    // scroll to previous image and verify it's image 1
    [self.banner scrollToNext:NO animated:NO];
    [TestUtils waitFor:0.3];
    FBSnapshotVerifyView(self.banner, @"item-6");
    
    // scroll to previous image and verify it's image 3
    [self.banner scrollToNext:NO animated:NO];
    [TestUtils waitFor:0.3];
    FBSnapshotVerifyView(self.banner, @"item-7");
    
    // scroll to previous image and verify it's image 2
    [self.banner scrollToNext:NO animated:NO];
    [TestUtils waitFor:0.3];
    FBSnapshotVerifyView(self.banner, @"item-8");
    
    // scroll to previous image and verify it's image 1
    [self.banner scrollToNext:NO animated:NO];
    [TestUtils waitFor:0.3];
    FBSnapshotVerifyView(self.banner, @"item-9");
}

- (void)testGiven3ImageAndAutoScrollingEnabled_BannerWillAutoScroll3ImagesCircularly {
    NSArray *imageNames = @[@"banner-1", @"banner-2", @"banner-3"];
    CircularBannerModel *model = [[CircularBannerModel alloc] initWithImageNames:imageNames autoScrollingEnabled:YES timeInterval:1];
    self.banner.model = model;
    
    for (int i = 1; i <= 9; i++) {
        [TestUtils waitFor:1];
        NSString *_id = [NSString stringWithFormat:@"item-%d", i];
        FBSnapshotVerifyView(self.banner, _id);
    }
}

@end
