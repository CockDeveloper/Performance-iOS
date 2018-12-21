//
//  CPChartRAMUsagePresenter.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/13/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CPChartRAMUsageModuleInterface.h"
#import "CPChartRAMUsageIO.h"

NS_ASSUME_NONNULL_BEGIN
@protocol CPChartRAMUsageViewInterface;

@interface CPChartRAMUsagePresenter : NSObject <CPChartRAMUsageModuleInterface, CPChartRAMUsageOutput>

@property (strong, nonatomic) id<CPChartRAMUsageInput> chartInteractor;
@property (weak, nonatomic) UIViewController <CPChartRAMUsageViewInterface> *userInterface;

@end

NS_ASSUME_NONNULL_END
