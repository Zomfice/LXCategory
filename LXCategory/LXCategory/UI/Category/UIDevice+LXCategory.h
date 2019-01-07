//
//  UIDevice+LXCategory.h
//  LXCategory
//
//  Created by 麻小亮 on 2018/12/28.
//  Copyright © 2018 xllpp. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIDevice (LXCategory)

+ (double)systemVersion;

+ (NSString *)localVersion;

+ (NSString *)localBuild;

+ (NSString *)storeUrlWithAppId:(NSString *)appId;

@property (nonatomic, readonly) BOOL isJailbroken;

@property (nonatomic, readonly) BOOL isPad;

@property (nonatomic, readonly) BOOL isSimulator;

@property (nullable, nonatomic, readonly) NSString *machineModel;

@property (nullable, nonatomic, readonly) NSString *machineModelName;

/**
 系统启动时间
 */
@property (nonatomic, readonly) NSDate *systemUptime;

@property (nonatomic, readonly) BOOL canMakePhoneCalls NS_EXTENSION_UNAVAILABLE_IOS("");
/**
 wifi IP
 */
@property (nullable, nonatomic, readonly) NSString *ipAddressWIFI;

/**
 cell IP
 */
@property (nullable, nonatomic, readonly) NSString *ipAddressCell;

typedef NS_OPTIONS(NSUInteger, LXNetworkTrafficType) {
    LXNetworkTrafficTypeWWANSent     = 1 << 0,
    LXNetworkTrafficTypeWWANReceived = 1 << 1,
    LXNetworkTrafficTypeWIFISent     = 1 << 2,
    LXNetworkTrafficTypeWIFIReceived = 1 << 3,
    LXNetworkTrafficTypeAWDLSent     = 1 << 4,
    LXNetworkTrafficTypeAWDLReceived = 1 << 5,
    
    LXNetworkTrafficTypeWWAN = LXNetworkTrafficTypeWWANSent | LXNetworkTrafficTypeWWANReceived,
    LXNetworkTrafficTypeWIFI = LXNetworkTrafficTypeWIFISent | LXNetworkTrafficTypeWIFIReceived,
    LXNetworkTrafficTypeAWDL = LXNetworkTrafficTypeAWDLSent | LXNetworkTrafficTypeAWDLReceived,
    
    LXNetworkTrafficTypeALL = LXNetworkTrafficTypeWWAN |
    LXNetworkTrafficTypeWIFI |
    LXNetworkTrafficTypeAWDL,
};

- (uint64_t)getNetworkTrafficBytes:(LXNetworkTrafficType)types;


#pragma mark - Disk Space
///=============================================================================
/// @name Disk Space
///=============================================================================

/// Total disk space in byte. (-1 when error occurs)
@property (nonatomic, readonly) int64_t diskSpace;

/// Free disk space in byte. (-1 when error occurs)
@property (nonatomic, readonly) int64_t diskSpaceFree;

/// Used disk space in byte. (-1 when error occurs)
@property (nonatomic, readonly) int64_t diskSpaceUsed;

#pragma mark - Memory Information

/// Total physical memory in byte. (-1 when error occurs)
@property (nonatomic, readonly) int64_t memoryTotal;

/// Used (active + inactive + wired) memory in byte. (-1 when error occurs)
@property (nonatomic, readonly) int64_t memoryUsed;

/// Free memory in byte. (-1 when error occurs)
@property (nonatomic, readonly) int64_t memoryFree;

/// Acvite memory in byte. (-1 when error occurs)
@property (nonatomic, readonly) int64_t memoryActive;

/// Inactive memory in byte. (-1 when error occurs)
@property (nonatomic, readonly) int64_t memoryInactive;

/// Wired memory in byte. (-1 when error occurs)
@property (nonatomic, readonly) int64_t memoryWired;

/// Purgable memory in byte. (-1 when error occurs)
@property (nonatomic, readonly) int64_t memoryPurgable;

/// Avaliable CPU processor count.
@property (nonatomic, readonly) NSUInteger cpuCount;

/// Current CPU usage, 1.0 means 100%. (-1 when error occurs)
@property (nonatomic, readonly) float cpuUsage;

/// Current CPU usage per processor (array of NSNumber), 1.0 means 100%. (nil when error occurs)
@property (nullable, nonatomic, readonly) NSArray<NSNumber *> *cpuUsagePerProcessor;

@end

NS_ASSUME_NONNULL_END
