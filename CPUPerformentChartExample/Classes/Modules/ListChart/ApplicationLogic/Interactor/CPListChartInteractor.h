//
//  CPListChartInteractor.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/11/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CPListChartIO.h"

NS_ASSUME_NONNULL_BEGIN
@class CPListChartDataManager;

@interface CPListChartInteractor : NSObject <CPListChartInput>

@property (weak, nonatomic) id <CPListChartOutput> output;

- (instancetype)initWithDataManager:(CPListChartDataManager *)dataManager;

@end

NS_ASSUME_NONNULL_END
