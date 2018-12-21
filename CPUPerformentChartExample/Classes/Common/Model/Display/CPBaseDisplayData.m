//
//  CPBaseDisplayData.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/17/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPBaseDisplayData.h"
#import "CPBaseDisplaySection.h"

@interface CPBaseDisplayData ()

@property (nonatomic, copy) NSArray<CPBaseDisplaySection *> *sections;

@end

@implementation CPBaseDisplayData

+ (instancetype)displayDataWithSections:(NSArray<CPBaseDisplaySection *> *)sections {
    id displayData = [self new];
    if (displayData) {
        [displayData setSections:[NSArray<CPBaseDisplaySection *> arrayWithArray:sections]];
    }
    
    return displayData;
}

- (BOOL)isEqualToDisplayData:(CPBaseDisplayData *)data {
    if (!data) {
        return NO;
    }
    
    BOOL hasEqualSections = [self.sections isEqualToArray:data.sections];
    
    return hasEqualSections;
}

- (BOOL)isEqual:(id)object {
    if (self == object) {
        return YES;
    }
    
    if (![object isKindOfClass:[CPBaseDisplayData class]]) {
        return NO;
    }
    
    return [self isEqualToDisplayData:object];
}

- (NSUInteger)hash {
    return [self.sections hash];
}

@end
