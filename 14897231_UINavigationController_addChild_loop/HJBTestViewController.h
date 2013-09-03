//
//  HJBTestViewController.h
//  14897231_UINavigationController_addChild_loop
//
//  Created by Heath Borders on 9/3/13.
//  Copyright (c) 2013 Heath Borders. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, HJBTestViewControllerBehavior) {
    HJBTestViewControllerBehaviorViewManual,
    HJBTestViewControllerBehaviorViewWillAppear,
    HJBTestViewControllerBehaviorViewDidAppear,
};

@interface HJBTestViewController : UIViewController

- (id)initWithBehavior:(HJBTestViewControllerBehavior)behavior;

@end
