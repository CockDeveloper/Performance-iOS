//
//  CPChartGPUUsageWireframe.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/13/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPChartGPUUsageWireframe.h"
#import "CPChartGPUUsageViewController.h"
#import "CPChartGPUUsagePresenter.h"

@interface CPChartGPUUsageWireframe ()

@property (nonatomic, weak) CPChartGPUUsageViewController *presentedViewController;

@end

@implementation CPChartGPUUsageWireframe

- (void)pushChartGPUUsageInterfaceFromViewController:(UIViewController *)viewController {
    CPChartGPUUsageViewController *chartVC = [self chartGPUUsageViewController];
    // TODO: config chartVC
    chartVC.eventHandler = self.chartGPUUsagePresenter;
    
    self.chartGPUUsagePresenter.userInterface = chartVC;
    self.presentedViewController = chartVC;
    [viewController.navigationController pushViewController:chartVC animated:YES];
}

//- (void)dismissChartGPUUsageInterface {
//    [self.presentedViewController.navigationController popViewControllerAnimated:YES];
//}

- (CPChartGPUUsageViewController *)chartGPUUsageViewController {
    return (CPChartGPUUsageViewController *)[CPStoryboardUtility getViewController:[CPChartGPUUsageViewController class]];
}

@end
