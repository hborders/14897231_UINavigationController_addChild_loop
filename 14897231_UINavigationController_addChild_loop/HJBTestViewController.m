//
//  HJBTestViewController.m
//  14897231_UINavigationController_addChild_loop
//
//  Created by Heath Borders on 9/3/13.
//  Copyright (c) 2013 Heath Borders. All rights reserved.
//

#import "HJBTestViewController.h"
#import "HJBChildViewController.h"

@interface HJBTestViewController ()

@property (nonatomic) HJBTestViewControllerBehavior behavior;

@property (nonatomic) HJBChildViewController *childViewController;

@end

@implementation HJBTestViewController

- (id)initWithBehavior:(HJBTestViewControllerBehavior)behavior {
    self = [super init];
    if (self) {
        self.behavior = behavior;
    }
    return self;
}

- (void)loadView {
    [super loadView];
    
    self.childViewController = [HJBChildViewController new];
    self.childViewController.view.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    self.childViewController.view.frame = CGRectMake(0, 0, 150, 44);
    
    UILabel *label = [[UILabel alloc] initWithFrame:self.view.bounds];
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    label.text = @"Test";
    [self.view addSubview:label];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"TestViewController willAppear");
    
    if (self.behavior == HJBTestViewControllerBehaviorViewManual) {
        [self.childViewController viewWillAppear:animated];
        self.navigationItem.titleView = self.childViewController.view;
    } else if (self.behavior == HJBTestViewControllerBehaviorViewWillAppear) {
        [self.childViewController willMoveToParentViewController:self.navigationController];
        [self.navigationController addChildViewController:self.childViewController];
        self.navigationItem.titleView = self.childViewController.view;
        [self.childViewController didMoveToParentViewController:self.navigationController];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"TestViewController didAppear");
    
    if (self.behavior == HJBTestViewControllerBehaviorViewManual) {
        [self.childViewController viewDidAppear:animated];
    } else if (self.behavior == HJBTestViewControllerBehaviorViewDidAppear) {
        [self.childViewController willMoveToParentViewController:self.navigationController];
        [self.navigationController addChildViewController:self.childViewController];
        self.navigationItem.titleView = self.childViewController.view;
        [self.childViewController didMoveToParentViewController:self.navigationController];
    }
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"TestViewController didDisappear");
    
    if (self.behavior == HJBTestViewControllerBehaviorViewManual) {
        [self.childViewController viewWillDisappear:animated];
    }
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"TestViewController didDisappear");
    
    if (self.behavior == HJBTestViewControllerBehaviorViewManual) {
        self.navigationItem.titleView = nil;
        [self.childViewController viewDidDisappear:NO];
    } else {
        [self willMoveToParentViewController:nil];
        self.navigationItem.titleView = nil;
        [self removeFromParentViewController];
    }
}

@end
