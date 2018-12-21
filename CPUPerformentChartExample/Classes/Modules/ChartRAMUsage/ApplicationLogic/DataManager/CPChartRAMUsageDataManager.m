//
//  CPChartRAMUsageDataManager.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/14/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPChartRAMUsageDataManager.h"
#import "CPChartRAMUsageItem.h"
#import "CPChartRAMUsageCoreDataStore.h"
#import "CPManagedRAMUsageItem.h"
#import "RAMUsage.h"
#import "CPChartRAMUsageIO.h"

@interface CPChartRAMUsageDataManager ()

@property (nonatomic, strong) CPChartRAMUsageCoreDataStore *dataStore;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation CPChartRAMUsageDataManager

static NSTimeInterval const repeatTimeInterval = 0.5;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dataStore = [CPChartRAMUsageCoreDataStore new];
        [self createTimer];
    }
    return self;
}

- (void)listRAMUsageFromDataStoreWithComplete:(void (^)(NSArray<CPChartRAMUsageItem *> * _Nonnull listData))completion {
    [self.dataStore fetchAllEntriesCompeletion:^(NSArray<CPManagedRAMUsageItem *> * _Nonnull results) {
        NSArray *values = [results arrayFromObjectsCollectedWithBlock:^id _Nonnull(id _Nonnull object) {
            CPManagedRAMUsageItem *managedUsageItem = (CPManagedRAMUsageItem *)object;
            return [CPChartRAMUsageItem ramUsage:managedUsageItem.valueUsage.doubleValue atTime:managedUsageItem.timeUpdate];
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
//            CPManagedRAMUsageItem *ramUsageItem = [[CPManagedRAMUsageItem alloc] init];
//            ramUsageItem.valueUsage = @(y);
//            ramUsageItem.timeUpdate = [NSDate dateWithTimeIntervalSince1970:x];
//            [values addObject:ramUsageItem];
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
                                                selector:@selector(updateNewRAMUsage:)
                                                userInfo:nil
                                                 repeats:YES];
}

- (void)updateNewRAMUsage:(NSTimer *)timer {
    if ([timer isEqual:self.timer]) {
        CGFloat valueRAMUsage = [RAMUsage currentRAMUsage];
        CPManagedRAMUsageItem *newRAMUsage = (CPManagedRAMUsageItem *)[self.dataStore newEntry];
        newRAMUsage.timeUpdate = [NSDate date];
        newRAMUsage.valueUsage = @(valueRAMUsage);
        
        [self.dataStore save];
        
        CPManagedRAMUsageItem *managedUsageItem = newRAMUsage;
        if (self.input && [self.input respondsToSelector:@selector(sendItemNewest:)]) {
            CPChartRAMUsageItem *item = [CPChartRAMUsageItem ramUsage:managedUsageItem.valueUsage.doubleValue atTime:managedUsageItem.timeUpdate];
            [self.input sendItemNewest:item];
        }
    }
}

@end
