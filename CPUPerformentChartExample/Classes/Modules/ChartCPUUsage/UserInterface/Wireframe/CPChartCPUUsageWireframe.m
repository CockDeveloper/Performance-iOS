//
//  CPChartCPUUsageWireframe.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/13/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPChartCPUUsageWireframe.h"
#import "CPChartCPUUsageViewController.h"
#import "CPChartCPUUsagePresenter.h"

@interface CPChartCPUUsageWireframe ()

@property (nonatomic, weak) CPChartCPUUsageViewController *presentedViewController;

@end

@implementation CPChartCPUUsageWireframe

- (void)pushChartCPUUsageInterfaceFromViewController:(UIViewController *)viewController {
    CPChartCPUUsageViewController *chartVC = [self chartCPUUsageViewController];
    // TODO: config chartVC
    chartVC.eventHandler = self.chartCPUUsagePresenter;
    
    self.chartCPUUsagePresenter.userInterface = chartVC;
    self.presentedViewController = chartVC;
    [viewController.navigationController pushViewController:chartVC animated:YES];
}

//- (void)dismissChartCPUUsageInterface {
//    [self.presentedViewController.navigationController popViewControllerAnimated:YES];
//}

- (CPChartCPUUsageViewController *)chartCPUUsageViewController {
    return (CPChartCPUUsageViewController *)[CPStoryboardUtility getViewController:[CPChartCPUUsageViewController class]];
}

@end
