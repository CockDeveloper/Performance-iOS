//
//  CPChartCPUUsagePresenter.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/13/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CPChartCPUUsageModuleInterface.h"
#import "CPChartCPUUsageIO.h"

NS_ASSUME_NONNULL_BEGIN
@protocol CPChartCPUUsageViewInterface;

@interface CPChartCPUUsagePresenter : NSObject <CPChartCPUUsageModuleInterface, CPChartCPUUsageOutput>

@property (strong, nonatomic) id<CPChartCPUUsageInput> chartInteractor;
@property (weak, nonatomic) UIViewController <CPChartCPUUsageViewInterface> *userInterface;

@end

NS_ASSUME_NONNULL_END
