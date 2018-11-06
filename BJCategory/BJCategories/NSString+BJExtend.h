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
-(BOOL)bj_isChinese;

/**
 *  整形验证
 *
 *  @param string 整形字符串
 *
 *  @return 格式正确返回YES，错误返回NO.
 */
- (BOOL)bj_isPureInt:(NSString *)string;

/**
 *  邮箱号码验证
 *
 *  @param email 邮箱号码字符串
 *
 *  @return 格式正确返回YES，错误返回NO.
 */
+ (BOOL)bj_isValidateEmail:(NSString *)email;

/**
 *  手机号码验证
 *
 *  @param mobile 手机号码字符串
 *
 *  @return 格式正确返回YES,错误返回NO
 */
+ (BOOL)bj_isValidateMobile:(NSString *)mobile;

/**
 *  身份证号码验证
 *
 *  @param cardid 身份证号码字符串
 *
 *  @return 格式正确返回YES，错误返回NO
 */
+(BOOL)bj_isValidateAboutCardId:(NSString *)cardid;

/**
 *  四舍五入方法
 *
 *  @param format 格式
 *  @param floatV 需要格式化的小数
 *
 *  @return 返回结果
 */
+ (NSString *)bj_decimalwithFormat:(NSString *)format floatV:(float)floatV;

/**
 获取系统版本号

 @return 版本号
 */
+ (NSString*)bj_systemVersion;

/**
 获取当前时间

 @return 当前时间
 */
+ (NSDate *)bj_getCurrentTime;

/**
 获取当前时间

 @return 当前时间
 */
+ (NSString *)bj_getCurrentTimeStr;

/**
 比较两个日期大小（NSOrderedAscending(-1):第一个日期小;
 NSOrderedDescending(1):第二个日期小）

 @param aDate 第一个日期
 @param bDate 第二个日期
 @return 比较结果
 */
+ (NSComparisonResult)bj_compareDate:(NSString*)aDate withDate:(NSString*)bDate;

/**
 获取设备名称

 @return 设备名称
 */
+ (NSString *)bj_deviceModelName;

/**
 获取设备类型

 @return 设备类型
 */
+ (NSString *)bj_deviceMod;

/**
 获取网络状态

 @return 网络状态
 */
+ (NSString*)bj_networkType;

/**
 获取当前位置

 @return 当前位置
 */
+ (NSString *)bj_userLocations;

/**
 获取wifi名称

 @return wifi名称
 */
+ (NSString *)bj_wifeName;

/**
 获取设备系统语言

 @return 设备系统语言
 */
+ (NSString*)bj_language;

/**
 获取运营商名称

 @return 运营商名称
 */
+ (NSString*)bj_carrierName;

/**
 获取IP地址

 @return IP地址
 */
+ (NSString *)bj_iPAddress;

/**
 json字符串转字典

 @param jsonString json字符串
 @return 字典
 */
- (NSDictionary *)bj_dictionaryWithJsonString:(NSString *)jsonString;

/**
 字典转json字符串

 @param dic 字典
 @return json字符串
 */
- (NSString*)bj_dictionaryToJson:(NSDictionary *)dic;

/**
 获取时间戳

 @return 时间戳
 */
+ (NSString*)bj_simulateAndRenderScene;

/**
 获取订单号

 @return 订单号
 */
+ (NSString *)bj_generateTradeNO;

/**
 手机号添加掩码

 @param phoneNum 手机号
 @return 添加掩码后的手机号
 */
+ (NSString *)bj_addCoverupCode:(NSString *)phoneNum;

/**
 为手机号添加空格 

 @param phoneNum 手机号
 @return 添加空格后的手机号
 */
+ (NSString *)bj_instStrSpace:(NSString *)phoneNum;

/**
 去掉字符串中的空格

 @param str 字符串
 @return 去掉空格后的字符串
 */
+ (NSString *)bj_removeStrSpace:(NSString *)str;

/**
 时间戳字符串转标准时间字符串

 @param stampStr 时间戳字符串
 @return 标准时间字符串
 */
+ (NSString *)bj_timeStrFromTimeStampStr:(NSString *)stampStr;

/**
 日期字符串转日期字符串，转换后，如：2018年02月03日

 @param dateStr 日期字符串
 @return 日期字符串
 */
+ (NSString *)bj_dateStrFromDateStr:(NSString *)dateStr;

/**
 判断指定日期是否为今天

 @param string 指定日期
 @return YES,是今天;NO,不是今天.
 */
+ (BOOL )bj_checkTheDate:(NSString *)string;

/**
 字符串是空，或者是@"0",或者是小于1的@"0.8" 转目标字符串。目前只有价格能用到。

 @param transtormString 需要转换的字符串
 @return 转换后的字符串
 */
- (NSString *)bj_stringIfStringIsZeroOrEmptyTransform:(NSString *)transtormString;

/**
 目标字符串没有包含指定字符串，就在后面拼接上指定字符串

 @param string 指定字符串
 @return 拼接后的字符串
 */
- (NSString *)bj_stringAppendStringAtLastIfNotContaintString:(NSString *)string;

/**
 目标字符串等于一个指定字符串，转换为另一个字符串

 @param string 指定字符串
 @param targetString 另一个字符串
 @return 转换后的字符串
 */
- (NSString *)bj_stringIfStringIsEqualToString:(NSString *)string toString:(NSString *)targetString;

/**
 去掉目标价格字符串末尾的0，注意：仅限于保留两位小数

 @return 转换后的字符串
 */
- (NSString *)bj_stringRemoveStringContaintZeroAfterPointer;

/**
 去掉字符串中多余的特殊符号， %

 @return 转换后的字符串
 */
- (NSString *)bj_stringRemoveSymbol;

/**
 * 时间转时间戳
 */

+ (long)bj_timeStampWithDate:(NSDate *) timeDate;

/**
 * 时间戳转时间
 */

+ (NSString *)bj_dateWithTimeStamp:(long) longValue;

/**
 * 时间转时间戳 2018-10-15T01:28:08.473Z
 */

+ (long)bj_timeStampWithDateTZ:(NSString *)timeStr;

@end
