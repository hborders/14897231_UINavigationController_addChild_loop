//
//  HJBAppDelegate.m
//  14897231_UINavigationController_addChild_loop
//
//  Created by Heath Borders on 9/3/13.
//  Copyright (c) 2013 Heath Borders. All rights reserved.
//

#import "HJBAppDelegate.h"
#import "HJBTestViewController.h"

@implementation HJBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    UIViewController *viewController = [UIViewController new];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, viewController.view.bounds.size.width, 100)];
    label.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    label.lineBreakMode = NSLineBreakByWordWrapping;
    label.numberOfLines = 0;
    label.text = @"Root\nPushing the above button should show the \"Test\" ViewController";
    [viewController.view addSubview:label];
    
    UIButton *manualButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    manualButton.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    manualButton.frame = CGRectMake(0, 200, viewController.view.bounds.size.width, 44);
    [manualButton setTitle:@"Don't use VC children"
                  forState:UIControlStateNormal];
    [manualButton addTarget:self
                     action:@selector(manualButtonTouchUpInside)
           forControlEvents:UIControlEventTouchUpInside];
    [viewController.view addSubview:manualButton];
    
    UIButton *viewWillAppearButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    viewWillAppearButton.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    viewWillAppearButton.frame = CGRectMake(0, 244, viewController.view.bounds.size.width, 44);
    [viewWillAppearButton setTitle:@"addChild in viewWillAppear"
                          forState:UIControlStateNormal];
    [viewWillAppearButton addTarget:self
                             action:@selector(viewWillAppearButtonTouchUpInside)
                   forControlEvents:UIControlEventTouchUpInside];
    [viewController.view addSubview:viewWillAppearButton];
    
    UIButton *viewDidAppearButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    viewDidAppearButton.autoresizingMask = UIViewAutoresizingFlexibleWidth;
    viewDidAppearButton.frame = CGRectMake(0, 288, viewController.view.bounds.size.width, 44);
    [viewDidAppearButton setTitle:@"addChild in viewDidAppear"
                         forState:UIControlStateNormal];
    [viewDidAppearButton addTarget:self
                            action:@selector(viewDidAppearButtonTouchUpInside)
                  forControlEvents:UIControlEventTouchUpInside];
    [viewController.view addSubview:viewDidAppearButton];
    
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 150, 44)];
    titleView.backgroundColor = [UIColor blueColor];
    viewController.navigationItem.titleView = titleView;
    
    self.window.rootViewController = [[UINavigationController alloc] initWithRootViewController:viewController];
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)manualButtonTouchUpInside {
    HJBTestViewController *testViewController = [[HJBTestViewController alloc] initWithBehavior:HJBTestViewControllerBehaviorViewManual];
    UINavigationController *navigationController = (UINavigationController *)self.window.rootViewController;
    [navigationController pushViewController:testViewController
                                    animated:YES];
}

- (void)viewWillAppearButtonTouchUpInside {
    HJBTestViewController *testViewController = [[HJBTestViewController alloc] initWithBehavior:HJBTestViewControllerBehaviorViewWillAppear];
    UINavigationController *navigationController = (UINavigationController *)self.window.rootViewController;
    [navigationController pushViewController:testViewController
                                    animated:YES];
}

- (void)viewDidAppearButtonTouchUpInside {
    HJBTestViewController *testViewController = [[HJBTestViewController alloc] initWithBehavior:HJBTestViewControllerBehaviorViewDidAppear];
    UINavigationController *navigationController = (UINavigationController *)self.window.rootViewController;
    [navigationController pushViewController:testViewController
                                    animated:YES];
}

@end
