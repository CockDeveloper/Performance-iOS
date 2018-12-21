//
//  GPUUsage.m
//  CPUPerformentChartExample
//
//  Created by Nguyễn Trọng Anh Tuấn on 12/18/18.
//  Copyright © 2018 Nguyễn Trọng Anh Tuấn. All rights reserved.
//

#import "GPUUsage.h"
#include <CoreFoundation/CoreFoundation.h>
#import <mach/mach_host.h>
//#include <Cocoa/Cocoa.h>
//#include <IOKit/IOKitLib.h>

NSDictionary* getMemoryState (){
    
    mach_port_t host_port;
    mach_msg_type_number_t host_size;
    vm_size_t pagesize;
    
    host_port = mach_host_self();
    host_size = sizeof(vm_statistics_data_t) / sizeof(integer_t);
    host_page_size(host_port, &pagesize);
    
    vm_statistics_data_t vm_stat;
    
    if (host_statistics(host_port, HOST_VM_INFO, (host_info_t)&vm_stat, &host_size) != KERN_SUCCESS) {
        NSLog(@"Failed to fetch vm statistics");
    }
    
    /* Stats in bytes */
    natural_t mem_used = (vm_stat.active_count +
                          vm_stat.inactive_count +
                          vm_stat.wire_count) *  (unsigned int) pagesize;
    
    natural_t mem_free = vm_stat.free_count * (unsigned int)pagesize;
    natural_t mem_total = mem_used + mem_free;
    
    //NSLog(@"used: %u free: %u total: %u active: %u video: %u", mem_used / 1024 /1024, mem_free / 1024 /1024, mem_total / 1024 /1024, vm_stat.active_count, 999 - (mem_total / 1024 /1024));
    
    NSMutableDictionary *dictWithMemoryStats = [[NSMutableDictionary alloc] initWithObjectsAndKeys:
                                                [NSNumber numberWithInt:mem_total / 1024 / 1024] , @"total",
                                                [NSNumber numberWithInt:mem_used / 1024 / 1024], @"used",
                                                [NSNumber numberWithInt:mem_free / 1024 / 1024], @"free",
                                                [NSNumber numberWithInt:((vm_stat.active_count *  (unsigned int) pagesize) / 1024 / 1024)], @"active",
                                                [NSNumber numberWithInt:(vm_stat.inactive_count  *  (unsigned int) pagesize) / 1024 /1014], @"inactive",
                                                [NSNumber numberWithInt:(vm_stat.wire_count  *  (unsigned int) pagesize) / 1024/ 1024], @"wire",
                                                nil];
    
    return dictWithMemoryStats;
}

//#include <IOKit/graphics/IOGraphicsLib.h>
//size_t currentFreeVRAM()
//{
//
//    kern_return_t krc;
//    mach_port_t masterPort;
//    krc = IOMasterPort(bootstrap_port, &masterPort);
//    if (krc == KERN_SUCCESS)
//    {
//        CFMutableDictionaryRef pattern = IOServiceMatching(kIOAcceleratorClassName);
//        //CFShow(pattern);
//
//        io_iterator_t deviceIterator;
//        krc = IOServiceGetMatchingServices(masterPort, pattern, &deviceIterator);
//        if (krc == KERN_SUCCESS)
//        {
//            io_object_t object;
//            while ((object = IOIteratorNext(deviceIterator)))
//            {
//                CFMutableDictionaryRef properties = NULL;
//                krc = IORegistryEntryCreateCFProperties(object, &properties, kCFAllocatorDefault, (IOOptionBits)0);
//                if (krc == KERN_SUCCESS)
//                {
//                    CFMutableDictionaryRef perf_properties = (CFMutableDictionaryRef) CFDictionaryGetValue( properties, CFSTR("PerformanceStatistics") );
//                    //CFShow(perf_properties);
//
//                    // look for a number of keys (this is mostly reverse engineering and best-guess effort)
//                    const void* free_vram_number = CFDictionaryGetValue(perf_properties, CFSTR("vramFreeBytes"));
//                    if (free_vram_number)
//                    {
//                        ssize_t vramFreeBytes;
//                        CFNumberGetValue( (CFNumberRef) free_vram_number, kCFNumberSInt64Type, &vramFreeBytes);
//                        return vramFreeBytes;
//                    }
//                }
//                if (properties) CFRelease(properties);
//                IOObjectRelease(object);
//            }
//            IOObjectRelease(deviceIterator);
//        }
//    }
//    return 0; // when we come here, this is a fail
//}

@implementation GPUUsage

+ (CGFloat)currentGPUUsage {
    CGFloat currentUsage = 0.0;
//    let dictWithRamInfi: NSDictionary = getMemoryState()
//    let proInfo = NSProcessInfo.processInfo()
//
//    let totalRam: UInt64 = ((proInfo.physicalMemory / 1024) / 1024)
//    let totalActiveRam: UInt64 = UInt64(dictWithRamInfi["total"]!.unsignedLongLongValue)
//
//    let videoRam = totalRam - totalActiveRam
    NSDictionary *dictWithRamInfi = getMemoryState();
    NSProcessInfo *proInfo = [NSProcessInfo processInfo];
    CGFloat totalRam = ((proInfo.physicalMemory / 1024) / 1024);
    CGFloat totalActiveRam = [dictWithRamInfi[@"total"] doubleValue];
    currentUsage = totalRam - totalActiveRam;
    
    return currentUsage;
}

//+ (CGFloat)gpu_usage {
//    // Get dictionary of all the PCI Devicces
//    CFMutableDictionaryRef matchDict = IOServiceMatching(kIOAcceleratorClassName);
//
//    // Create an iterator
//    io_iterator_t iterator;
//
//    if (IOServiceGetMatchingServices(kIOMasterPortDefault,matchDict,
//                                     &iterator) == kIOReturnSuccess)
//    {
//        // Iterator for devices found
//        io_registry_entry_t regEntry;
//
//        while ((regEntry = IOIteratorNext(iterator))) {
//            // Put this services object into a dictionary object.
//            CFMutableDictionaryRef serviceDictionary;
//            if (IORegistryEntryCreateCFProperties(regEntry,
//                                                  &serviceDictionary,
//                                                  kCFAllocatorDefault,
//                                                  kNilOptions) != kIOReturnSuccess)
//            {
//                // Service dictionary creation failed.
//                IOObjectRelease(regEntry);
//                continue;
//            }
//
//            CFMutableDictionaryRef perf_properties = (CFMutableDictionaryRef) CFDictionaryGetValue( serviceDictionary, CFSTR("PerformanceStatistics") );
//            if (perf_properties) {
//
//                static ssize_t gpuCoreUse=0;
//                static ssize_t freeVramCount=0;
//                static ssize_t usedVramCount=0;
//
//                const void* gpuCoreUtilization = CFDictionaryGetValue(perf_properties, CFSTR("GPU Core Utilization"));
//                const void* freeVram = CFDictionaryGetValue(perf_properties, CFSTR("vramFreeBytes"));
//                const void* usedVram = CFDictionaryGetValue(perf_properties, CFSTR("vramUsedBytes"));
//                if (gpuCoreUtilization && freeVram && usedVram)
//                {
//                    CFNumberGetValue( (CFNumberRef) gpuCoreUtilization, kCFNumberSInt64Type, &gpuCoreUse);
//                    CFNumberGetValue( (CFNumberRef) freeVram, kCFNumberSInt64Type, &freeVramCount);
//                    CFNumberGetValue( (CFNumberRef) usedVram, kCFNumberSInt64Type, &usedVramCount);
//                    NSLog(@"GPU: %.3f%% VRAM: %.3f%%",gpuCoreUse/(double)10000000,usedVramCount/(double)(freeVramCount+usedVramCount)*100.0);
//
//                }
//
//            }
//
//            CFRelease(serviceDictionary);
//            IOObjectRelease(regEntry);
//        }
//        IOObjectRelease(iterator);
//    }
//}
@end
