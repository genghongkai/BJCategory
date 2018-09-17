//
//  NSString+BJExtend.m
//  BJCategory
//
//  Created by ghk on 2018/3/30.
//  Copyright © 2018年 geng hongkai. All rights reserved.
//

#import "NSString+BJExtend.h"
#import <UIKit/UIKit.h>
#include <sys/socket.h> // Per msqr
#include <sys/sysctl.h>
#include <arpa/inet.h>
#include <netdb.h>
#include <net/if.h>
#include <ifaddrs.h>
#import <sys/utsname.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <CoreTelephony/CTCarrier.h>
#import <SystemConfiguration/CaptiveNetwork.h>
#import <CoreLocation/CoreLocation.h>
#import "BJCategoryConst.h"

@implementation NSString (BJExtend)

/**
 *  中文验证
 *
 *  @return 是中文返回YES,不是返回NO.
 */
-(BOOL)isChinese
{
    NSString *match=@"(^[\u4e00-\u9fa5]+$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    return [predicate evaluateWithObject:self];
}

/**
 *  整形验证
 *
 *  @param string 整形字符串
 *
 *  @return 格式正确返回YES，错误返回NO.
 */
- (BOOL)isPureInt:(NSString *)string
{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    return [scan scanInt:&val] && [scan isAtEnd];
}

/**
 *  邮箱号码验证
 *
 *  @param email 邮箱号码字符串
 *
 *  @return 格式正确返回YES，错误返回NO.
 */
+ (BOOL)isValidateEmail:(NSString *)email
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:email];
}

/**
 *  手机号码验证
 *
 *  @param mobile 手机号码字符串
 *
 *  @return 格式正确返回YES,错误返回NO
 */
+ (BOOL)isValidateMobile:(NSString *)mobile
{
    //手机号以13， 15，18,17,14开头，
    NSString *phoneRegex = @"^13[0-9]{1}[0-9]{8}$|15[0-9]{1}[0-9]{8}$|18[0-9]{9}$|17[0-9]{9}$|14[0-9]{9}";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    return [phoneTest evaluateWithObject:mobile];
}

/**
 *  身份证号码验证
 *
 *  @param cardid 身份证号码字符串
 *
 *  @return 格式正确返回YES，错误返回NO
 */
+(BOOL)isValidateAboutCardId:(NSString *)cardid
{
    BOOL flag = NO;
    NSString *regex2 = @"^(^[1-9]\\d{7}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])\\d{3}$)|(^[1-9]\\d{5}[1-9]\\d{3}((0\\d)|(1[0-2]))(([0|1|2]\\d)|3[0-1])((\\d{4})|\\d{3}[Xx])$)$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    flag = [identityCardPredicate evaluateWithObject:cardid];
    return flag;
}

/**
 *  四舍五入方法
 *
 *  @param format 格式
 *  @param floatV 需要格式化的小数
 *
 *  @return 返回结果
 */
+ (NSString *)decimalwithFormat:(NSString *)format floatV:(float)floatV
{
    NSNumberFormatter *numberFormatter = [[NSNumberFormatter alloc] init];
    [numberFormatter setPositiveFormat:format];
    return  [numberFormatter stringFromNumber:[NSNumber numberWithFloat:floatV]];
}

+ (NSString*)bj_systemVersion {
    NSString * str = [NSString stringWithFormat:@"IOS%.2f",[[[UIDevice currentDevice] systemVersion] floatValue]];
    return str;
}

+ (NSDateFormatter *)formatter
{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    return formatter;
}

+ (NSDate *)getCurrentTime{
    NSDate *date = [NSDate date];
    //获取当前系统所在时区
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSTimeInterval time = [zone secondsFromGMTForDate:date];
    NSDate *dateNow = [date dateByAddingTimeInterval:time];
    NSString *dateTime=[self.formatter stringFromDate:dateNow];
    date = [self.formatter dateFromString:dateTime];
    return date;
}
+ (NSString *)getCurrentTimeStr {
    NSString *dateTime=[self.formatter stringFromDate:[NSDate date]];
    return dateTime;
}

//比较两个日期的大小  日期格式为2016-08-14 08：46：20
+ (NSComparisonResult)compareDate:(NSString*)aDate withDate:(NSString*)bDate
{
    if (!aDate.length || !bDate.length) {
        return 0;
    }

    if ([bDate containsString:@"."]) {
        NSRange range = [bDate rangeOfString:@"."];
        bDate = [bDate substringToIndex:range.location];
    }
    NSDate *dta = [self.formatter dateFromString:aDate];
    NSDate *dtb = [self.formatter dateFromString:bDate];
    NSComparisonResult result = [dta compare:dtb];

    return result;
}

+ (NSString*)deviceModelName
{
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];

    NSArray *modelArray = @[

                            @"i386", @"x86_64",

                            @"iPhone1,1",
                            @"iPhone1,2",
                            @"iPhone2,1",
                            @"iPhone3,1",
                            @"iPhone3,2",
                            @"iPhone3,3",
                            @"iPhone4,1",
                            @"iPhone5,1",
                            @"iPhone5,2",
                            @"iPhone5,3",
                            @"iPhone5,4",
                            @"iPhone6,1",
                            @"iPhone6,2",
                            @"iPhone7,2",
                            @"iPhone7,1",
                            @"iPhone8,1",
                            @"iPhone8,2",

                            @"iPod1,1",
                            @"iPod2,1",
                            @"iPod3,1",
                            @"iPod4,1",
                            @"iPod5,1",

                            @"iPad1,1",
                            @"iPad2,1",
                            @"iPad2,2",
                            @"iPad2,3",
                            @"iPad2,4",
                            @"iPad3,1",
                            @"iPad3,2",
                            @"iPad3,3",
                            @"iPad3,4",
                            @"iPad3,5",
                            @"iPad3,6",

                            @"iPad2,5",
                            @"iPad2,6",
                            @"iPad2,7",
                            ];
    NSArray *modelNameArray = @[

                                @"iPhone Simulator",
                                @"iPhone Simulator",
                                @"iPhone 2G",
                                @"iPhone 3G",
                                @"iPhone 3GS",
                                @"iPhone 4(GSM)",
                                @"iPhone 4(GSM Rev A)",
                                @"iPhone 4(CDMA)",
                                @"iPhone 4S",
                                @"iPhone 5(GSM)",
                                @"iPhone 5(GSM+CDMA)",
                                @"iPhone 5c(GSM)",
                                @"iPhone 5c(Global)",
                                @"iphone 5s(GSM)",
                                @"iphone 5s(Global)",
                                @"iPhone 6",
                                @"iPhone 6 Plus",
                                @"iPhone 6s",
                                @"iPhone 6s Plus",

                                @"iPod Touch 1G",
                                @"iPod Touch 2G",
                                @"iPod Touch 3G",
                                @"iPod Touch 4G",
                                @"iPod Touch 5G",

                                @"iPad",
                                @"iPad 2(WiFi)",
                                @"iPad 2(GSM)",
                                @"iPad 2(CDMA)",
                                @"iPad 2(WiFi + New Chip)",
                                @"iPad 3(WiFi)",
                                @"iPad 3(GSM+CDMA)",
                                @"iPad 3(GSM)",
                                @"iPad 4(WiFi)",
                                @"iPad 4(GSM)",
                                @"iPad 4(GSM+CDMA)",

                                @"iPad mini (WiFi)",
                                @"iPad mini (GSM)",
                                @"ipad mini (GSM+CDMA)"
                                ];
    NSInteger modelIndex = - 1;
    NSString *modelNameString = nil;
    modelIndex = [modelArray indexOfObject:deviceString];
    if (modelIndex >= 0 && modelIndex < [modelNameArray count]) {
        modelNameString = [modelNameArray objectAtIndex:modelIndex];
    }
    return modelNameString ? modelNameString : @"iOS";
}

+ (NSString*)deviceMod{

    return [UIDevice currentDevice].model;
}

+ (NSString*)networkType{
    //  能  [[self deviceVersion] isEqualToString:@"iPhone X"] 来判断，因为模拟  会 返回 iPhone X
    NSArray *subviews ;
    if ([[[UIApplication sharedApplication] valueForKeyPath:@"_statusBar"] isKindOfClass:NSClassFromString(@"UIStatusBar_Modern")]) {
        subviews = [[[[[UIApplication sharedApplication] valueForKeyPath:@"_statusBar"] valueForKeyPath:@"_statusBar"] valueForKeyPath:@"foregroundView"] subviews];
    } else {
        subviews = [[[[UIApplication sharedApplication] valueForKeyPath:@"_statusBar"] valueForKeyPath:@"foregroundView"] subviews];
    }
    NSNumber *dataNetworkItemView = nil;
    for (id subview in subviews) {
        if([subview isKindOfClass:[NSClassFromString(@"UIStatusBarDataNetworkItemView") class]])
        {
            dataNetworkItemView = subview;
            break;
        }
    }
    NSString *str = @"";
    switch ([[dataNetworkItemView valueForKey:@"dataNetworkType"]integerValue]) {
        case 0:
        {
            str = @" 服务";
        }
            break;
        case 1:
        {
            str = @"2G";
        }
            break;
        case 2:
            str = @"3G";
            break;
        case 3:
            str = @"4G";
            break;
        case 4:
            str = @"LTE";
            break;
        case 5:
            str = @"Wifi";
            break;
        default:
            str = @"default";
            break;
    }
    return str;
}

+(NSString *)UserLocations
{
    CLLocationManager *locationManager = [[CLLocationManager alloc] init];
    [locationManager requestWhenInUseAuthorization];
    //经度
    CGFloat longitude = [locationManager.location coordinate].longitude;
    //纬度
    CGFloat latitude = [locationManager.location coordinate].latitude;
    NSString *userLocations = [NSString stringWithFormat:@"%lf|%lf",longitude,latitude];
    return userLocations;
}

#pragma mark -获取WiFi名称
+(NSString *)wifeName {
    id info = nil;
    NSString *str = @"";
    NSArray *ifs = (__bridge_transfer id)CNCopySupportedInterfaces();
    for (NSString *ifnam in ifs) {
        info = (__bridge_transfer id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
        str = info[@"SSID"];
    }
    return str;
}

+ (NSString*)language
{
    NSUserDefaults* defs = [NSUserDefaults standardUserDefaults];
    NSArray* languages = [defs objectForKey:@"AppleLanguages"];
    NSString* preferredLang = [languages objectAtIndex:0];
    if ([preferredLang isEqualToString:@"en"]) {
        return @"英文";
    }
    if ([preferredLang isEqualToString:@"zh-Hans"]) {
        return @"简体中文";
    }
    if ([preferredLang isEqualToString:@"zh-Hant"]) {
        return @"繁体中文";
    }
    if ([preferredLang isEqualToString:@"ja"]) {
        return @"日文";
    } else {
        return @"其他语言";
    }
}

+(NSString*)carrierName{
    CTTelephonyNetworkInfo *telephonyInfo = [[CTTelephonyNetworkInfo alloc] init];
    CTCarrier *carrier = [telephonyInfo subscriberCellularProvider];
    NSString *currentCountry=[carrier carrierName];
    if([currentCountry length]>0)
    {
        return currentCountry;
    } else {
        return @"wifi";
    }
}

+ (NSString *)iPAddress
{
    BOOL success;
    struct ifaddrs * addrs;
    const struct ifaddrs * cursor;
    success = getifaddrs(&addrs) == 0;
    if (success) {
        cursor = addrs;
        while (cursor != NULL) {
            // the second test keeps from picking up the loopback address
            if (cursor->ifa_addr->sa_family == AF_INET && (cursor->ifa_flags & IFF_LOOPBACK) == 0)
            {
                NSString *name = [NSString stringWithUTF8String:cursor->ifa_name];
                if ([name isEqualToString:@"en0"])  // Wi-Fi adapter
                    return [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)cursor->ifa_addr)->sin_addr)];
            }
            cursor = cursor->ifa_next;
        }
        freeifaddrs(addrs);
    }
    return @"";
}

- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString
{
    if (jsonString == nil) {
        return nil;
    }
    NSData *jsonData = [jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSError *err;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&err];
    if(err) {
        BJCategoryLog(@"json解析失败：%@",err);
        return nil;
    }
    return dic;
}
/** 字典转json串 */
- (NSString*)dictionaryToJson:(NSDictionary *)dic
{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

/** 时间戳 */
+ (NSString*)simulateAndRenderScene{
    NSDate* dat = [NSDate dateWithTimeIntervalSinceNow:0];
    NSTimeInterval a = [dat timeIntervalSince1970]*1000;
    NSString *timeString = [NSString stringWithFormat:@"%.f", a];
    return timeString;
}

/** 获取订单号 */
+ (NSString *)generateTradeNO
{
    static int kNumber = 15;

    NSString *sourceStr = @"0123456789";
    NSMutableString *resultStr = [[NSMutableString alloc] init];
    srand((unsigned)time(0));
    for (int i = 0; i < kNumber; i++)
    {
        unsigned index = rand() % [sourceStr length];
        NSString *oneStr = [sourceStr substringWithRange:NSMakeRange(index, 1)];
        [resultStr appendString:oneStr];
    }
    return resultStr;
}

/** 手机号添加掩码 */
+ (NSString *)addCoverupCode:(NSString *)phoneNum
{
    if (phoneNum.length < NSMaxRange(NSMakeRange(3, 4))) {
        return @"";
    }
    NSMutableString *phone = [NSMutableString stringWithString:phoneNum];
    NSRange range = NSMakeRange(3, 4);

    [phone replaceCharactersInRange:range withString:@"****"];
    NSString *phoneNo = [NSString stringWithFormat:@"%@",phone];
    return phoneNo;
}

/** 手机号格式 添加空格 */
+ (NSString *)instStrSpace:(NSString *)phoneNum {

    if (phoneNum.length < NSMaxRange(NSMakeRange(0, 7))) {
        return phoneNum;
    }
    NSMutableString *str = [[NSMutableString alloc] initWithString:phoneNum];
    [str insertString:@" "  atIndex:3];
    [str insertString:@" "  atIndex:7];
    NSString *str1 = [[NSString alloc] initWithString:str];
    return str1;
}

/** 去掉字符串空格 */
+ (NSString *)removeStrSpace:(NSString *)phoneNum {
    NSString *str = [phoneNum stringByReplacingOccurrencesOfString:@" " withString:@""];
    return str;
}

+ (NSString *)timeStrFromTimeStampStr:(NSString *)stampStr {

    if ([stampStr containsString:@"-"]) {
        return stampStr;
    }
    NSTimeInterval interval = [stampStr doubleValue];
    if (stampStr.length == 13) {
        interval = interval / 1000;
    }
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:interval];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyy-MM-dd"];
    NSString *dateString = [formatter stringFromDate: date];
    return dateString;
}

+ (NSString *)dateStrFromDateStr:(NSString *)dateStr {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"yyyyMMdd"];
    NSDate *date = [formatter dateFromString:dateStr];
    NSDateFormatter *formatter2 = [[NSDateFormatter alloc] init];
    [formatter2 setDateFormat:@"yyyy年MM月dd日"];
    NSString *dateString = [formatter2 stringFromDate:date];
    return dateString;
}

+ (BOOL )checkTheDate:(NSString *)string {

    NSDateFormatter *format = [[NSDateFormatter alloc]init];
    [format setDateFormat:@"yyyy-MM-dd"];
    NSDate *date = [format dateFromString:string];
    BOOL isToday = [[NSCalendar currentCalendar] isDateInToday:date];
    return isToday;
}

- (NSString *)bj_stringIfStringIsZeroOrEmptyTransform:(NSString *)transtormString {

    if (self.length == 0 || [self isEqualToString:@"0"]) {
        return transtormString;
    }
    return self;
}

- (NSString *)bj_stringAppendStringAtLastIfNotContaintString:(NSString *)string {

    if (![self containsString:string]) {
        NSString *tempString = [NSString stringWithFormat:@"%@%@",self,string];
        return tempString;
    }
    return self;
}

- (NSString *)bj_stringIfStringIsEqualToString:(NSString *)string toString:(NSString *)targetString {

    if ([self isEqualToString:string]) {

        return targetString;
    }
    return self;
}

- (NSString *)bj_stringRemoveStringContaintZeroAfterPointer {

    if ([self hasSuffix:@".00"]) {
        return [self stringByReplacingOccurrencesOfString:@".00" withString:@""];
    } else if ([self hasSuffix:@"0"] && [self containsString:@"."]) {
        NSString *temp = [self substringWithRange:NSMakeRange(0, self.length-1)];
        return [temp bj_stringRemoveStringContaintZeroAfterPointer];
    } else if ([self containsString:@"."] && [self hasSuffix:@"0"]) {
        return [self substringWithRange:NSMakeRange(0, self.length-1)];
    } else if([self hasSuffix:@"0001"] && ![self containsString:@".0001"]) {
        NSString *temp = [self substringWithRange:NSMakeRange(0, self.length-4)];
        return [temp bj_stringRemoveStringContaintZeroAfterPointer];
    } else if([self hasSuffix:@"9999"] && [self containsString:@"."]) {
        NSString *temp = self;
        double tempDouble = [temp doubleValue];
        NSMutableString *string = [NSMutableString stringWithFormat:@"%.10lf",tempDouble];
        return [string bj_stringRemoveStringContaintZeroAfterPointer];
    }
    return self;
}

/**
 去掉字符串中多余的特殊符号， %

 @return 转换后的字符串
 */
- (NSString *)bj_stringRemoveSymbol {

    NSString *tempStr = self;
    if ([self containsString:@"%%"]) {
        tempStr = [tempStr stringByReplacingOccurrencesOfString:@"%%" withString:@"%"];
        tempStr = [tempStr bj_stringRemoveSymbol];
    }
    return tempStr;
}

@end
