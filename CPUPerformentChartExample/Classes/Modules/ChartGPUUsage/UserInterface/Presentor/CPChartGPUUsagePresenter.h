//
//  CPChartGPUUsagePresenter.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/13/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CPChartGPUUsageModuleInterface.h"
#import "CPChartGPUUsageIO.h"

NS_ASSUME_NONNULL_BEGIN
@protocol CPChartGPUUsageViewInterface;

@interface CPChartGPUUsagePresenter : NSObject <CPChartGPUUsageModuleInterface, CPChartGPUUsageOutput>

@property (strong, nonatomic) id<CPChartGPUUsageInput> chartInteractor;
@property (weak, nonatomic) UIViewController <CPChartGPUUsageViewInterface> *userInterface;

@end

NS_ASSUME_NONNULL_END
