//
//  NSString+BJExtend.h
//  BJCategory
//
//  Created by ghk on 2018/3/30.
//  Copyright © 2018年 geng hongkai. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (BJExtend)

/**
 *  中文验证
 *
 *  @return 是中文返回YES,不是返回NO.
 */
-(BOOL)isChinese;

/**
 *  整形验证
 *
 *  @param string 整形字符串
 *
 *  @return 格式正确返回YES，错误返回NO.
 */
- (BOOL)isPureInt:(NSString *)string;

/**
 *  邮箱号码验证
 *
 *  @param email 邮箱号码字符串
 *
 *  @return 格式正确返回YES，错误返回NO.
 */
+ (BOOL)isValidateEmail:(NSString *)email;

/**
 *  手机号码验证
 *
 *  @param mobile 手机号码字符串
 *
 *  @return 格式正确返回YES,错误返回NO
 */
+ (BOOL)isValidateMobile:(NSString *)mobile;

/**
 *  身份证号码验证
 *
 *  @param cardid 身份证号码字符串
 *
 *  @return 格式正确返回YES，错误返回NO
 */
+(BOOL)isValidateAboutCardId:(NSString *)cardid;

/**
 *  四舍五入方法
 *
 *  @param format 格式
 *  @param floatV 需要格式化的小数
 *
 *  @return 返回结果
 */
+ (NSString *)decimalwithFormat:(NSString *)format floatV:(float)floatV;

/**
 获取系统版本号

 @return 版本号
 */
+ (NSString*)bj_systemVersion;

/**
 获取当前时间

 @return 当前时间
 */
+ (NSDate *)getCurrentTime;

/**
 获取当前时间

 @return 当前时间
 */
+ (NSString *)getCurrentTimeStr;

/**
 比较两个日期大小（NSOrderedAscending(-1):第一个日期小;
 NSOrderedDescending(1):第二个日期小）

 @param aDate 第一个日期
 @param bDate 第二个日期
 @return 比较结果
 */
+ (NSComparisonResult)compareDate:(NSString*)aDate withDate:(NSString*)bDate;

/**
 获取设备名称

 @return 设备名称
 */
+ (NSString *)deviceModelName;

/**
 获取设备类型

 @return 设备类型
 */
+ (NSString *)deviceMod;

/**
 获取网络状态

 @return 网络状态
 */
+ (NSString*)networkType;

/**
 获取当前位置

 @return 当前位置
 */
+ (NSString *)UserLocations;

/**
 获取wifi名称

 @return wifi名称
 */
+ (NSString *)wifeName;

/**
 获取设备系统语言

 @return 设备系统语言
 */
+ (NSString*)language;

/**
 获取运营商名称

 @return 运营商名称
 */
+ (NSString*)carrierName;

/**
 获取IP地址

 @return IP地址
 */
+ (NSString *)iPAddress;

/**
 json字符串转字典

 @param jsonString json字符串
 @return 字典
 */
- (NSDictionary *)dictionaryWithJsonString:(NSString *)jsonString;

/**
 字典转json字符串

 @param dic 字典
 @return json字符串
 */
- (NSString*)dictionaryToJson:(NSDictionary *)dic;

/**
 获取时间戳

 @return 时间戳
 */
+ (NSString*)simulateAndRenderScene;

/**
 获取订单号

 @return 订单号
 */
+ (NSString *)generateTradeNO;

/**
 手机号添加掩码

 @param phoneNum 手机号
 @return 添加掩码后的手机号
 */
+ (NSString *)addCoverupCode:(NSString *)phoneNum;

/**
 为手机号添加空格 

 @param phoneNum 手机号
 @return 添加空格后的手机号
 */
+ (NSString *)instStrSpace:(NSString *)phoneNum;

/**
 去掉字符串中的空格

 @param str 字符串
 @return 去掉空格后的字符串
 */
+ (NSString *)removeStrSpace:(NSString *)str;
@end