//
//  CPChartNetworkUsagePresenter.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/13/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CPChartNetworkUsageModuleInterface.h"
#import "CPChartNetworkUsageIO.h"

NS_ASSUME_NONNULL_BEGIN
@protocol CPChartNetworkUsageViewInterface;

@interface CPChartNetworkUsagePresenter : NSObject <CPChartNetworkUsageModuleInterface, CPChartNetworkUsageOutput>

@property (strong, nonatomic) id<CPChartNetworkUsageInput> chartInteractor;
@property (weak, nonatomic) UIViewController <CPChartNetworkUsageViewInterface> *userInterface;

@end

NS_ASSUME_NONNULL_END
