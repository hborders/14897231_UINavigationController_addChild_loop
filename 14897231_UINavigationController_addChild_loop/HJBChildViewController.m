//
//  HJBChildViewController.m
//  14897231_UINavigationController_addChild_loop
//
//  Created by Heath Borders on 9/3/13.
//  Copyright (c) 2013 Heath Borders. All rights reserved.
//

#import "HJBChildViewController.h"

@interface HJBChildViewController ()

@end

@implementation HJBChildViewController

#pragma mark - UIViewController

- (void)loadView {
    [super loadView];
    
    NSLog(@"HJBChildViewController loadView");
    
    UILabel *label = [[UILabel alloc] initWithFrame:self.view.bounds];
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    label.text = @"Child";
    [self.view addSubview:label];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    NSLog(@"HJBChildViewController viewWillAppear");
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    NSLog(@"HJBChildViewController viewDidAppear");
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    NSLog(@"HJBChildViewController viewWillDisappear");
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    NSLog(@"HJBChildViewController viewDidDisappear");
}

@end
