//
//  CPChartGPUUsageDataManager.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/14/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPChartGPUUsageDataManager.h"
#import "CPChartGPUUsageItem.h"
#import "CPChartGPUUsageCoreDataStore.h"
#import "CPManagedGPUUsageItem.h"
#import "GPUUsage.h"
#import "CPChartGPUUsageIO.h"

@interface CPChartGPUUsageDataManager ()

@property (nonatomic, strong) CPChartGPUUsageCoreDataStore *dataStore;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation CPChartGPUUsageDataManager

static NSTimeInterval const repeatTimeInterval = 0.5;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dataStore = [CPChartGPUUsageCoreDataStore new];
        [self createTimer];
    }
    return self;
}

- (void)listGPUUsageFromDataStoreWithComplete:(void (^)(NSArray<CPChartGPUUsageItem *> * _Nonnull listData))completion {
    [self.dataStore fetchAllEntriesCompeletion:^(NSArray<CPManagedGPUUsageItem *> * _Nonnull results) {
        NSArray *values = [results arrayFromObjectsCollectedWithBlock:^id _Nonnull(id _Nonnull object) {
            CPManagedGPUUsageItem *managedUsageItem = (CPManagedGPUUsageItem *)object;
            return [CPChartGPUUsageItem gpuUsage:managedUsageItem.valueUsage.doubleValue atTime:managedUsageItem.timeUpdate];
        }];
        
        //FIXME: Fake --BEGEIN--
//        NSInteger count = 100;
//        double range = 30.0;
//        NSTimeInterval now = [[NSDate date] timeIntervalSince1970];
//        NSTimeInterval hourSeconds = 3600.0;
//
//        NSMutableArray *values = [NSMutableArray new];
//        NSTimeInterval from = now - (count / 2.0) * hourSeconds;
//        NSTimeInterval to = now + (count / 2.0) * hourSeconds;
//
//        for (NSTimeInterval x = from; x < to; x += hourSeconds)
//        {
//            double y = arc4random_uniform(range) + 50;
//            CPManagedGPUUsageItem *gpuUsageItem = [[CPManagedGPUUsageItem alloc] init];
//            gpuUsageItem.valueUsage = @(y);
//            gpuUsageItem.timeUpdate = [NSDate dateWithTimeIntervalSince1970:x];
//            [values addObject:gpuUsageItem];
//        }
        //FIXME: Fake --END--

        if (completion) {
            completion(values);
        }
    }];
}

- (void)createTimer {
    self.timer = [NSTimer scheduledTimerWithTimeInterval:repeatTimeInterval
                                                  target:self
                                                selector:@selector(updateNewGPUUsage:)
                                                userInfo:nil
                                                 repeats:YES];
}

- (void)updateNewGPUUsage:(NSTimer *)timer {
    if ([timer isEqual:self.timer]) {
        CGFloat valueGPUUsage = [GPUUsage currentGPUUsage];
        CPManagedGPUUsageItem *newGPUUsage = (CPManagedGPUUsageItem *)[self.dataStore newEntry];
        newGPUUsage.timeUpdate = [NSDate date];
        newGPUUsage.valueUsage = @(valueGPUUsage);
        
        [self.dataStore save];
        
        CPManagedGPUUsageItem *managedUsageItem = newGPUUsage;
        if (self.input && [self.input respondsToSelector:@selector(sendItemNewest:)]) {
            CPChartGPUUsageItem *item = [CPChartGPUUsageItem gpuUsage:managedUsageItem.valueUsage.doubleValue atTime:managedUsageItem.timeUpdate];
            [self.input sendItemNewest:item];
        }
    }
}

@end
