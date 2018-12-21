//
//  CPListChartDisplayDataCollector.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/17/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPListChartDisplayDataCollector.h"
#import "CPBaseDisplayDataCollectorDelegate.h"
#import "CPChartItem.h"
#import "CPListChartDisplayItem.h"

@interface CPListChartDisplayDataCollector () <CPBaseDisplayDataCollectorDelegate>

@end

@implementation CPListChartDisplayDataCollector

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.delegate = self;
    }
    return self;
}

- (CPBaseDisplayItem *)displayItemFromObjectItem:(id)objectItem {
    CPChartItem *chartItem = objectItem;
    CPListChartDisplayItem *displayItem = [CPListChartDisplayItem
                                           displayItemWithIdentifier:chartItem.chartId
                                                       andSectionKey:@(1)
                                                             andName:chartItem.chartName];
    
    return displayItem;
}

- (NSMutableArray<CPBaseDisplayItem *> *)sectionItemsForKey:(id)sectionKey fromSections:(NSMutableDictionary *)sections {
    NSMutableArray<CPBaseDisplayItem *> *sectionItems = sections[sectionKey];
    if (sectionItems == nil) {
        sectionItems = [NSMutableArray<CPBaseDisplayItem *> new];
        sections[sectionKey] = sectionItems;
    }

    return sectionItems;
}

@end
