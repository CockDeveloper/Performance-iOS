//
//  NetworkUsage.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/18/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "NetworkUsage.h"
#include <net/if.h>
#include <ifaddrs.h>

static NSString *const DataCounterKeyWWANSent = @"WWANSent";
static NSString *const DataCounterKeyWWANReceived = @"WWANReceived";
static NSString *const DataCounterKeyWiFiSent = @"WiFiSent";
static NSString *const DataCounterKeyWiFiReceived = @"WiFiReceived";

NSDictionary *dataCounters()
{
    
    struct ifaddrs *addrs;
    const struct ifaddrs *cursor;
    
    u_int32_t WiFiSent = 0;
    u_int32_t WiFiReceived = 0;
    u_int32_t WWANSent = 0;
    u_int32_t WWANReceived = 0;
    
    if (getifaddrs(&addrs) == 0)
    {
        cursor = addrs;
        while (cursor != NULL)
        {
            if (cursor->ifa_addr->sa_family == AF_LINK)
            {
#ifdef DEBUG
                const struct if_data *ifa_data = (struct if_data *)cursor->ifa_data;
                if (ifa_data != NULL)
                {
                    NSLog(@"Interface name %s: sent %tu received %tu",cursor->ifa_name,ifa_data->ifi_obytes,ifa_data->ifi_ibytes);
                }
#endif
                
                // name of interfaces:
                // en0 is WiFi
                // pdp_ip0 is WWAN
                NSString *name = @(cursor->ifa_name);
                if ([name hasPrefix:@"en"])
                {
                    const struct if_data *ifa_data = (struct if_data *)cursor->ifa_data;
                    if (ifa_data != NULL)
                    {
                        WiFiSent += ifa_data->ifi_obytes;
                        WiFiReceived += ifa_data->ifi_ibytes;
                    }
                }
                
                if ([name hasPrefix:@"pdp_ip"])
                {
                    const struct if_data *ifa_data = (struct if_data *)cursor->ifa_data;
                    if (ifa_data != NULL)
                    {
                        WWANSent += ifa_data->ifi_obytes;
                        WWANReceived += ifa_data->ifi_ibytes;
                    }
                }
            }
            
            cursor = cursor->ifa_next;
        }
        
        freeifaddrs(addrs);
    }
    
    return @{DataCounterKeyWiFiSent : @(WiFiSent),
             DataCounterKeyWiFiReceived : @(WiFiReceived),
             DataCounterKeyWWANSent : @(WWANSent),
             DataCounterKeyWWANReceived : @(WWANReceived)};
}

@implementation NetworkUsage

+ (CGFloat)currentNetworkUsage {
    CGFloat currentUsage = 0.0;
    id dataWWANReceived = dataCounters()[DataCounterKeyWWANReceived];
    id dataWiFiReceived = dataCounters()[DataCounterKeyWiFiReceived];
    
    if (dataWWANReceived) {
        currentUsage += (([dataWWANReceived doubleValue] / 1024) / 1024);
    }
    if (dataWiFiReceived) {
        currentUsage += (([dataWiFiReceived doubleValue] / 1024) / 1024);
    }
    
    return currentUsage;
}

@end
