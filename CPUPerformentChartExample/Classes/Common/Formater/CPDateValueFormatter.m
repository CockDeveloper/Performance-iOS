//
//  CPDateValueFormatter.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/14/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPDateValueFormatter.h"

@interface CPDateValueFormatter ()

@property (nonatomic) NSDateFormatter *dateFormatter;

@end

@implementation CPDateValueFormatter

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dateFormatter = [NSDateFormatter new];
        self.dateFormatter.dateFormat = @"dd HH:mm:ss";
    }
    return self;
}

- (NSString * _Nonnull)stringForValue:(double)value axis:(ChartAxisBase * _Nullable)axis {
    return [self.dateFormatter stringFromDate:[NSDate dateWithTimeIntervalSince1970:value]];
}

@end
