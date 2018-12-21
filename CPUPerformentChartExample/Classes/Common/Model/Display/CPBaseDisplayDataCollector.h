//
//  CPBaseDisplayDataCollector.h
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/17/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class CPBaseDisplayData;
@protocol CPBaseDisplayDataCollectorDelegate;

@interface CPBaseDisplayDataCollector : NSObject

@property (nonatomic, weak) id <CPBaseDisplayDataCollectorDelegate> delegate;

- (void)addItems:(NSArray *)items;
- (CPBaseDisplayData *)collectedDisplayData;

@end

NS_ASSUME_NONNULL_END
