//
//  CPChartNetworkUsageDataManager.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/14/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "CPChartNetworkUsageDataManager.h"
#import "CPChartNetworkUsageItem.h"
#import "CPChartNetworkUsageCoreDataStore.h"
#import "CPManagedNetworkUsageItem.h"
#import "NetworkUsage.h"
#import "CPChartNetworkUsageIO.h"

@interface CPChartNetworkUsageDataManager ()

@property (nonatomic, strong) CPChartNetworkUsageCoreDataStore *dataStore;
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation CPChartNetworkUsageDataManager

static NSTimeInterval const repeatTimeInterval = 0.5;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.dataStore = [CPChartNetworkUsageCoreDataStore new];
        [self createTimer];
    }
    return self;
}

- (void)listNetworkUsageFromDataStoreWithComplete:(void (^)(NSArray<CPChartNetworkUsageItem *> * _Nonnull listData))completion {
    [self.dataStore fetchAllEntriesCompeletion:^(NSArray<CPManagedNetworkUsageItem *> * _Nonnull results) {
        NSArray *values = [results arrayFromObjectsCollectedWithBlock:^id _Nonnull(id _Nonnull object) {
            CPManagedNetworkUsageItem *managedUsageItem = (CPManagedNetworkUsageItem *)object;
            return [CPChartNetworkUsageItem networkUsage:managedUsageItem.valueUsage.doubleValue atTime:managedUsageItem.timeUpdate];
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
//            CPManagedNetworkUsageItem *networkUsageItem = [[CPManagedNetworkUsageItem alloc] init];
//            networkUsageItem.valueUsage = @(y);
//            networkUsageItem.timeUpdate = [NSDate dateWithTimeIntervalSince1970:x];
//            [values addObject:networkUsageItem];
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
                                                selector:@selector(updateNewNetworkUsage:)
                                                userInfo:nil
                                                 repeats:YES];
}

- (void)updateNewNetworkUsage:(NSTimer *)timer {
    if ([timer isEqual:self.timer]) {
        //FIXME: Fake --BEGEIN--
        dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), ^{
            NSURL *URL = [NSURL URLWithString:@"https://api.github.com/users?since=10"];
            NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
            AFURLSessionManager *manager = [[AFURLSessionManager alloc] initWithSessionConfiguration:configuration];
            
            //        NSURL *URL = [NSURL URLWithString:@"http://httpbin.org/get"];
            NSURLRequest *request = [NSURLRequest requestWithURL:URL];
            
            NSURLSessionDataTask *dataTask = [manager dataTaskWithRequest:request completionHandler:^(NSURLResponse *response, id responseObject, NSError *error) {
                if (error) {
                    NSLog(@"Error: %@", error);
                } else {
                    if ([responseObject isKindOfClass:[NSArray class]]) {
                        NSLog(@"%@ %@", response, @([responseObject count]));
                        for (NSDictionary *obj in responseObject) {
                            __block id avatarUrlStr = obj[@"avatar_url"];
                            if ([avatarUrlStr isKindOfClass:[NSString class]] && ((NSString *)avatarUrlStr).length > 0) {
                                dispatch_async(dispatch_get_global_queue(QOS_CLASS_BACKGROUND, 0), ^{
                                    NSURLSessionConfiguration *configurationSub = [NSURLSessionConfiguration defaultSessionConfiguration];
                                    AFURLSessionManager *managerSub = [[AFURLSessionManager alloc] initWithSessionConfiguration:configurationSub];
                                    NSURL *URLSub = [NSURL URLWithString:avatarUrlStr];
                                    NSURLRequest *requestSub = [NSURLRequest requestWithURL:URLSub];
                                    NSURLSessionDownloadTask *dataTaskSub = [managerSub downloadTaskWithRequest:requestSub progress:nil destination:^NSURL *(NSURL *targetPath, NSURLResponse *response) {
                                        NSURL *documentsDirectoryURL = [[NSFileManager defaultManager] URLForDirectory:NSDocumentDirectory inDomain:NSUserDomainMask appropriateForURL:nil create:NO error:nil];
                                        return [documentsDirectoryURL URLByAppendingPathComponent:[response suggestedFilename]];
                                    } completionHandler:^(NSURLResponse *response, NSURL *filePath, NSError *error) {
                                        NSLog(@"File downloaded to: %@", filePath);
                                    }];
                                    [dataTaskSub resume];
                                });
                            }
                        }
                    }
                }
            }];
            [dataTask resume];
        });
        //FIXME: Fake --END--
        
        CGFloat valueNetworkUsage = [NetworkUsage currentNetworkUsage];
        CPManagedNetworkUsageItem *newNetworkUsage = (CPManagedNetworkUsageItem *)[self.dataStore newEntry];
        newNetworkUsage.timeUpdate = [NSDate date];
        newNetworkUsage.valueUsage = @(valueNetworkUsage);
        
        [self.dataStore save];
        
        CPManagedNetworkUsageItem *managedUsageItem = newNetworkUsage;
        if (self.input && [self.input respondsToSelector:@selector(sendItemNewest:)]) {
            CPChartNetworkUsageItem *item = [CPChartNetworkUsageItem networkUsage:managedUsageItem.valueUsage.doubleValue atTime:managedUsageItem.timeUpdate];
            [self.input sendItemNewest:item];
        }
    }
}

@end
