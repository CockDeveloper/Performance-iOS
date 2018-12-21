//
//  CPListChartWireframe.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/10/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPListChartWireframe.h"
#import "CPRootWireframe.h"
#import "CPStoryboardUtility.h"
#import "CPListChartViewController.h"
#import "CPListChartPresenter.h"
#import "CPChartCPUUsageWireframe.h"
#import "CPChartRAMUsageWireframe.h"
#import "CPChartNetworkUsageWireframe.h"
#import "CPChartGPUUsageWireframe.h"

@interface CPListChartWireframe ()

@property (weak, nonatomic) CPListChartViewController *listViewController;

@end

@implementation CPListChartWireframe

- (void)presentListChartInterfaceFromWindow:(UIWindow *)window {
    CPListChartViewController *listViewController = [self listViewControllerFromStoryboard];
    listViewController.eventHandler = self.listChartPresenter;
    
    self.listChartPresenter.userInterface = listViewController;
    self.listViewController = listViewController;
    [self.rootWireframe showRootViewController:listViewController
                                      inWindow:window];
}

- (CPListChartViewController *)listViewControllerFromStoryboard {
    UIStoryboard *storyboard = [CPStoryboardUtility mainStoryboard];
    CPListChartViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([CPListChartViewController class])];
    
    return viewController;
}

- (void)presentChartCPUUsageInterface {
    [self.chartCPUUsageWireframe pushChartCPUUsageInterfaceFromViewController:self.listViewController];
}

- (void)presentChartRAMUsageInterface {
    [self.chartRAMUsageWireframe pushChartRAMUsageInterfaceFromViewController:self.listViewController];
}

- (void)presentChartNetworkUsageInterface {
    [self.chartNetworkUsageWireframe pushChartNetworkUsageInterfaceFromViewController:self.listViewController];
}

- (void)presentChartGPUUsageInterface {
    [self.chartGPUUsageWireframe pushChartGPUUsageInterfaceFromViewController:self.listViewController];
}

@end
