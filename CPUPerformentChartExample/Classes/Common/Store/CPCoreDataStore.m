//
//  CPCoreDataStore.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/12/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPCoreDataStore.h"
#import "CPChartItem.h"

@implementation CPCoreDataStore

- (void)fetchAllEntriesCompeletion:(void (^)(NSArray<NSDictionary *> *))completion {
    NSBundle *thisBundle = [NSBundle bundleForClass:[self class]];
    NSString *plistPath = [thisBundle pathForResource:@"ChartList" ofType:@"plist"];
    NSArray<NSDictionary *> *allEntries = nil;
    if (plistPath) {
        allEntries = [[NSArray alloc] initWithContentsOfFile:plistPath];
    }
    
    if (completion) {
        completion(allEntries);
    }
}

@end
