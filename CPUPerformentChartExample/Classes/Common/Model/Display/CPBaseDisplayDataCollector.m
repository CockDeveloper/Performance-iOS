//
//  CPBaseDisplayDataCollector.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/17/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPBaseDisplayDataCollector.h"
//#import "CPBaseItem.h"
#import "CPBaseDisplayData.h"
#import "CPBaseDisplaySection.h"
#import "CPBaseDisplayItem.h"
#import "NSArray+HOM.h"
#import "CPBaseDisplayDataCollectorDelegate.h"

@interface CPBaseDisplayDataCollector ()

@property (nonatomic) NSMutableDictionary<NSObject *,NSMutableArray<CPBaseDisplayItem *> *> *sections;

@end

@implementation CPBaseDisplayDataCollector

- (void)addItems:(NSArray *)items {
    for (id objItem in items) {
        [self addItem:objItem];
    }
}

- (CPBaseDisplayData *)collectedDisplayData {
    NSArray<CPBaseDisplaySection *> *displaySections = [[self collectedSectionKeys] arrayFromObjectsCollectedWithBlock:^id(id _Nonnull sectionKey) {
        return [self displaySectionForKey:sectionKey];
    }];

    return [CPBaseDisplayData displayDataWithSections:displaySections];
}

- (void)addItem:(id _Nonnull)item {
    if (self.delegate && [self.delegate respondsToSelector:@selector(displayItemFromObjectItem:)]) {
        CPBaseDisplayItem *displayItem = [self.delegate displayItemFromObjectItem:item];
        [self addDisplayItem:displayItem withSectionKey:displayItem.sectionKey];
    }
    else {
        [NSException raise:@"Invalid delegate" format:@"CPBaseDisplayDataCollectorDelegate is not exists or not implement [CPBaseDisplayDataCollectorDelegate displayItemFromObjectItem:]"];
    }
}

- (void)addDisplayItem:(CPBaseDisplayItem *)displayItem withSectionKey:(id _Nonnull)sectionKey {
    if (self.delegate && [self.delegate respondsToSelector:@selector(sectionItemsForKey:fromSections:)]) {
        NSMutableArray *sectionItems = [self.delegate sectionItemsForKey:sectionKey fromSections:self.sections];
        [sectionItems addObject:displayItem];
    }
    else {
        [NSException raise:@"Invalid delegate" format:@"CPBaseDisplayDataCollectorDelegate is not exists or not implement [CPBaseDisplayDataCollectorDelegate sectionItemsForKey:fromSections:]"];
    }
}

- (NSArray *)collectedSectionKeys {
    return [[self.sections allKeys] sortedArrayUsingSelector:@selector(compare:)];
}

- (CPBaseDisplaySection *)displaySectionForKey:(NSNumber *)sectionKey {
    return [CPBaseDisplaySection displaySectionWithItems:self.sections[sectionKey]];
}

#pragma mark - Property
- (NSMutableDictionary *)sections {
    if (_sections == nil) {
        _sections = [NSMutableDictionary new];
    }
    
    return _sections;
}

@end
