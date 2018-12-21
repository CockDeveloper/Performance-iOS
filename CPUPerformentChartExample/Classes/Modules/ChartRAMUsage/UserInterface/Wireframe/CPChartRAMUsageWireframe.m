//
//  CPChartRAMUsageWireframe.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/13/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPChartRAMUsageWireframe.h"
#import "CPChartRAMUsageViewController.h"
#import "CPChartRAMUsagePresenter.h"

@interface CPChartRAMUsageWireframe ()

@property (nonatomic, weak) CPChartRAMUsageViewController *presentedViewController;

@end

@implementation CPChartRAMUsageWireframe

- (void)pushChartRAMUsageInterfaceFromViewController:(UIViewController *)viewController {
    CPChartRAMUsageViewController *chartVC = [self chartRAMUsageViewController];
    // TODO: config chartVC
    chartVC.eventHandler = self.chartRAMUsagePresenter;
    
    self.chartRAMUsagePresenter.userInterface = chartVC;
    self.presentedViewController = chartVC;
    [viewController.navigationController pushViewController:chartVC animated:YES];
}

//- (void)dismissChartRAMUsageInterface {
//    [self.presentedViewController.navigationController popViewControllerAnimated:YES];
//}

- (CPChartRAMUsageViewController *)chartRAMUsageViewController {
    return (CPChartRAMUsageViewController *)[CPStoryboardUtility getViewController:[CPChartRAMUsageViewController class]];
}

@end
