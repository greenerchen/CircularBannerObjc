//
//  ViewController.m
//  CircularBanner
//
//  Created by Greener Chen on 2020/4/15.
//  Copyright © 2020 Greener Chen. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    struct CircularBannerModel model;
    model.imageNames = @[@"banner-1", @"banner-2", @"banner-3", @"banner-4"];
    self.banner.model = model;
    [self.banner setAutoScrollingEnabled:YES withTimeInterval:2.0];
}

@end
