//
//  NSString+Addition.h
//  Alien
//
//  Created by DavidYang on 15/5/22.
//  Copyright (c) 2015年 hupu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString(Addition)

+ (NSString *)changeDataToYear:(NSString *)data;
/**
 *  @brief  判断字符串是否为空或者为nil,NULL
 *
 *  @param str 字符串
 *
 *  @return true 为空或者nil false 不为空,nil
 */
+ (BOOL)strIsNilOrEmpty:(NSString *)str;


+ (NSString *)getSafeStr:(NSString *)str;

/**
 *  @brief  去掉字符串空格
 *
 *  @param text 字符串
 *
 *  @return 返回去掉字符串空格
 */
+ (NSString *)strTrimSpace:(NSString *)text;
/**
 * 功能： 判断长度大于6位小于20位并是否同时包含且只有数字和字母
 */
+(BOOL)judgePassWordLegal:(NSString *)text;

+ (NSString *)strTrimSpace:(NSString *)text withSymble:(NSString*)symble;

+ (NSString*)hiddMiddlePart:(NSString*)originStr;

- (BOOL)isNumber;
- (BOOL)isSpeailChar;
- (BOOL)isLetter;
- (BOOL)isAllChinese;
- (BOOL)isMoreThan50;
- (NSString *)md5String;
+ (const char *)UnicodeToISO88591:(NSString *)src;
//是否包含中文
- (BOOL)isContainChinese;
//是否是整形
- (BOOL)isPureInt:(NSString*)string;
//字符串转json

+ (id)changeStringtoJson:(NSString *)content;
/**
 *  @brief  获取全局唯一id
 *
 *  @return 局唯一id
 */
+ (NSString *)generateUUIDString;

/**
 *  模式匹配 查找基于 key = value
 *
 *  @param key    <#key description#>
 *  @param source <#source description#>
 *
 *  @return <#return value description#>
 */
+ (NSString *)findKey:(NSString *)key source:(NSString *)source;


- (BOOL)isValidPhone;

- (BOOL)isValidSmsCode;
- (BOOL)isURLString;
- (NSString *) md5;

- (NSString *)wpTrim;


- (CGSize)lg_sizeWithFont:(UIFont *)font;
- (CGSize)lg_sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size lineBreakMode:(NSLineBreakMode)lineBreakMode;
- (CGSize)lg_sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size;

- (NSString *)replaceNewLine; //return a string "\n" replaced by empty

- (BOOL)isEmail;

- (NSString *)cutStringWithLength:(NSInteger)length;

- (NSString *)urlDecode;
- (NSString *)urlEncode;
- (NSString *)urlEncodeNoSymbol;
- (NSURL *)urlValue;

- (NSString *)toBase64String;
- (NSString *)base64StringToOriginString;
- (NSString *)getNumWithString:(NSString *)string;

+ (int)yy_getSexWithString:(NSString *)str;
//特殊字符或者数字
- (BOOL)isRightName;

+ (NSString *)getMoreSafeStr:(NSString *)str;

+ (NSString *)getChineseMonth:(NSUInteger )month;
@end
