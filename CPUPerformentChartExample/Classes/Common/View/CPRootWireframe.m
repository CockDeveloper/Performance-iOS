//
//  CPRootWireframe.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/11/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPRootWireframe.h"

@implementation CPRootWireframe

- (void)showRootViewController:(UIViewController *)viewController
                      inWindow:(UIWindow *)window {
    UINavigationController *navigationVC = [self navigationControllerFromWindow:window];
    navigationVC.viewControllers = @[viewController];
}

- (UINavigationController *)navigationControllerFromWindow:(UIWindow *)window {
    UINavigationController *navigationVC = (UINavigationController *)[window rootViewController];
    return navigationVC;
}

@end
