//
//  CPChartCPUUsageDataManager.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/14/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPChartCPUUsageDataManager.h"
#import "CPChartCPUUsageItem.h"
#import "CPChartCPUUsageCoreDataStore.h"
#import "CPManagedCPUUsageItem.h"
#import "CPUUsage.h"
#import "CPChartCPUUsageIO.h"

@interface CPChartCPUUsageDataManager ()

@property (nonatomic, strong) CPChartCPUUsageCoreDataStore *dataStore;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation CPChartCPUUsageDataManager

static NSTimeInterval const repeatTimeInterval = 1.0;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dataStore = [CPChartCPUUsageCoreDataStore new];
        [self createTimer];
    }
    return self;
}

- (void)listCPUUsageFromDataStoreWithComplete:(void (^)(NSArray<CPChartCPUUsageItem *> * _Nonnull listData))completion {    
    [self.dataStore fetchAllEntriesCompeletion:^(NSArray<CPManagedCPUUsageItem *> * _Nonnull results) {
        NSArray *values = [results arrayFromObjectsCollectedWithBlock:^id _Nonnull(id _Nonnull object) {
            CPManagedCPUUsageItem *managedUsageItem = (CPManagedCPUUsageItem *)object;
            return [CPChartCPUUsageItem cpuUsage:managedUsageItem.valueUsage.doubleValue atTime:managedUsageItem.timeUpdate];
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
//            CPManagedCPUUsageItem *cpuUsageItem = [[CPManagedCPUUsageItem alloc] init];
//            cpuUsageItem.valueUsage = @(y);
//            cpuUsageItem.timeUpdate = [NSDate dateWithTimeIntervalSince1970:x];
//            [values addObject:cpuUsageItem];
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
                                                selector:@selector(updateNewCPUUsage:)
                                                userInfo:nil
                                                 repeats:YES];
//    [NSTimer timerWithTimeInterval:repeatTimeInterval
//                                        repeats:YES
//                                          block:^(NSTimer * _Nonnull timer) {
//                                              if ([timer isEqual:weakSelf.timer]) {
//                                                  [weakSelf updateNewCPUUsage];
//                                              }
//                                          }];
}

- (void)updateNewCPUUsage:(NSTimer *)timer {
    if ([timer isEqual:self.timer]) {
        CGFloat valueCPUUsage = [CPUUsage currentCPUUsage];
        CPManagedCPUUsageItem *newCPUUsage = (CPManagedCPUUsageItem *)[self.dataStore newEntry];
        newCPUUsage.timeUpdate = [NSDate date];
        newCPUUsage.valueUsage = @(valueCPUUsage);
        
        [self.dataStore save];
        
        CPManagedCPUUsageItem *managedUsageItem = newCPUUsage;
        if (self.input && [self.input respondsToSelector:@selector(sendItemNewest:)]) {
            CPChartCPUUsageItem *item = [CPChartCPUUsageItem cpuUsage:managedUsageItem.valueUsage.doubleValue atTime:managedUsageItem.timeUpdate];
            [self.input sendItemNewest:item];
        }
    }
}

@end
