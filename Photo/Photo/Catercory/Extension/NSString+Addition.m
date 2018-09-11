//
//  NSString+Addition.m
//  Alien
//
//  Created by DavidYang on 15/5/22.
//  Copyright (c) 2015年 hupu. All rights reserved.
//

#import "NSString+Addition.h"
#import <CommonCrypto/CommonCrypto.h>

@implementation NSString(Addition)
+ (NSString *)changeDataToYear:(NSString *)data
{
    NSDate *coverDate = [NSDate dateWithTimeIntervalSince1970:[data doubleValue] ];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy年MM月dd日 HH:mm:ss"];
    
    NSString *dateString = [dateFormat stringFromDate:coverDate];
 //   NSLog(@"%@", dateString);
    return dateString;
}
+ (BOOL)strIsNilOrEmpty:(NSString *)str {
        
    if (str == nil || [str isEqual:[NSNull null]] || (str != nil && [str isEqualToString:@""])) {
        return YES;
    }
    return NO;
}

+ (NSString *)getSafeStr:(NSString *)str {
    if ([self strIsNilOrEmpty:str]) {
        return @"";
    }
    
    return str;
}


+ (NSString *)getMoreSafeStr:(NSString *)str{
    return (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)str, (CFStringRef)@"!NULL,'()*+,-./:;=?@_~%#[]{}", NULL, kCFStringEncodingUTF8));
}
+ (const char *)UnicodeToISO88591:(NSString *)src
{
    NSStringEncoding enc =      CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingISOLatin1);
    return [src cStringUsingEncoding:enc];
}
+ (NSString *)strTrimSpace:(NSString *)text {
    if (![NSString strIsNilOrEmpty:text]) {
        NSMutableString *result = [NSMutableString string];
        [result setString:[text stringByReplacingOccurrencesOfString:@" " withString:@""]];
        [result stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        return result;
    }
    return nil;
}

+ (NSString *)strTrimSpace:(NSString *)text withSymble:(NSString*)symble{
    if (![NSString strIsNilOrEmpty:text]) {
        NSMutableString *result = [NSMutableString string];
        [result setString:[text stringByReplacingOccurrencesOfString:@" " withString:symble]];
        [result stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
        return result;
    }
    return nil;

}


+ (NSString*)hiddMiddlePart:(NSString*)originStr;{
   
    if(originStr.length>2){
     NSRange subRange = NSMakeRange(1, originStr.length-1);
       return [originStr stringByReplacingCharactersInRange:subRange withString:@"****"];
    }else if(originStr.length ==1){
        return [NSString stringWithFormat:@"%@*****",originStr];
    }
    return @"******";
}

/**
 * 功能： 判断长度大于6位小于20位并是否同时包含且只有数字和字母
 */
+(BOOL)judgePassWordLegal:(NSString *)text{
    
    BOOL result = false;
    if ([text length] >= 6){
        
        NSString * regex = @"^[0-9A-Za-z]{6,20}$";
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
        result = [pred evaluateWithObject:text];
    }
    return result;
}


+ (id)changeStringtoJson:(NSString *)content
{
    NSData *jsonData = [content dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *err;
    
    id json = [NSJSONSerialization JSONObjectWithData:jsonData
                         
                                                        options:NSJSONReadingMutableContainers
                         
                                                          error:&err];

    return json;
}


+ (NSString *)generateUUIDString {
    CFUUIDRef uuidref = CFUUIDCreate(kCFAllocatorDefault);
    
    NSString  * uuidString = CFBridgingRelease(CFUUIDCreateString(kCFAllocatorDefault, uuidref));
    
    CFRelease(uuidref);
    
    return uuidString;
}


- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSMethodSignature *signature = [super methodSignatureForSelector:aSelector];
    if (!signature) {
       return signature =[NSMethodSignature signatureWithObjCTypes:"@^v^c"];
    } else {
        return signature;
    }
}

- (void)forwardInvocation:(NSInvocation *)anInvocation {
    if ([self respondsToSelector:[anInvocation selector]]) {
        [anInvocation invokeWithTarget:self];
    }
}


+ (NSString *)findKey:(NSString *)key source:(NSString *)source
{
    NSError *error;
    NSString *regTags=[[NSString alloc] initWithFormat:@"(^|&|\\?)+%@=+([^&]*)(&|$)",key];
    NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regTags
                                                                           options:NSRegularExpressionCaseInsensitive
                                                                             error:&error];
    NSArray *matches = [regex matchesInString:source
                                      options:0
                                        range:NSMakeRange(0, [source length])];
    for (NSTextCheckingResult *match in matches) {
        NSString *tagValue = [source substringWithRange:[match rangeAtIndex:2]];
        return tagValue;
    }
    return @"";
}

- (BOOL)isURLString
{
    NSString * URL = @"^((https|http)?:\\/\\/)[^\\s]+";
    
    NSPredicate *predicateURL = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", URL];
    
    BOOL result = [predicateURL evaluateWithObject:self];
    
    return result;
    
    
}
- (BOOL)isRightName
{
    NSInteger speNum = 0;
    NSInteger isNum = 0;
    BOOL isRight = YES;
    for (NSInteger i = 0; i< self.length; i++) {
        NSString *str = [self substringWithRange:NSMakeRange(i, 1)];
        if ([str isSpeailChar]) {
            speNum++;
        }
        if ([str isNumber]) {
            isNum++;
        }
    }
    if ((speNum + isNum) == self.length) {
        [SVProgressHUD showErrorWithStatus:@"不能全部都是特殊字符或者数字"];
        isRight = NO;
    }
    

    
    return isRight;
}

- (BOOL)isSpeailChar
{
    
    NSString * URL = @"((?=[\x21-\x7e]+)[^A-Za-z0-9])";
    
    NSPredicate *predicateURL = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", URL];
    
    BOOL result = [predicateURL evaluateWithObject:self];
    
    return result;
}
- (BOOL)isAllChinese
{
    BOOL result = YES;
    NSInteger count=0;
    for (NSInteger i = 0; i<self.length; i++) {
        NSString *str = [self substringWithRange:NSMakeRange(i, 1)];
        if ([str isContainChinese]) {
            count++;
        }
    }
    if (count != self.length) {
        result = NO;
    }
    return result;
}


- (BOOL)isNumber
{
    NSString * URL = @"^[0-9]*$";
    
    NSPredicate *predicateURL = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", URL];
    
    BOOL result = [predicateURL evaluateWithObject:self];
    
    return result;
}
- (BOOL)isLetter
{
    NSString * URL = @"^[A-Za-z]+$";
    
    NSPredicate *predicateURL = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", URL];
    
    BOOL result = [predicateURL evaluateWithObject:self];
    
    return result;
}

- (BOOL)isContainChinese
{
    NSString * URL = @"^[\u4E00-\u9FA5]*$";
    
    NSPredicate *predicateURL = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", URL];
    
    BOOL result = [predicateURL evaluateWithObject:self];
    
    return result;
    
    
}


- (BOOL)isPureInt:(NSString*)string{
    NSScanner* scan = [NSScanner scannerWithString:string];
    int val;
    if ([string isEqualToString:@"～"]) {
        return YES;
    }
    return[scan scanInt:&val] && [scan isAtEnd];
}

- (BOOL)isValidPhone {
    
    NSString * MOBILE = @"^1(3[0-9]|4[57]|5[0-35-9]|7[01678]|8[0-9])\\d{8}$";
    
    NSPredicate *predicateMobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    
    BOOL result = [predicateMobile evaluateWithObject:self];
    
    return result;
}

- (BOOL)isValidSmsCode{
    
    NSString * smscode = @"^[0-9]{4}$";
    
    NSPredicate *predicateSmsCode = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", smscode];
    
    BOOL result = [predicateSmsCode evaluateWithObject:self];
    
    return result;

}
- (NSString *)md5String
{
    if(self == nil || [self length] == 0) return nil;
    unsigned char digest[CC_MD5_DIGEST_LENGTH], i;
    CC_MD5([self UTF8String], (int)[self lengthOfBytesUsingEncoding:NSUTF8StringEncoding], digest);
    NSMutableString *ms = [NSMutableString string];
    for(i=0;i<CC_MD5_DIGEST_LENGTH;i++)
    {
        [ms appendFormat: @"%02x", (int)(digest[i])];
    }
    return [ms copy];
}
- (NSString *) md5
{
    const char *cStr = [self UTF8String];
    unsigned char digest[16];
    CC_MD5( cStr, (CC_LONG)strlen(cStr), digest ); // This is the md5 call
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    return  output;
}

- (NSString *)wpTrim
{
    NSString *tmp = [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if (tmp.length) {
        return tmp;
    }
    return nil;
}

- (NSString *)replaceNewLine {
    return [self stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
}
- (BOOL)isMoreThan50
{
    BOOL result = YES;
    NSMutableArray *tempArray = [NSMutableArray array];
    for (NSInteger i = 0; i < self.length; i++) {
        NSString *str = [self substringWithRange:NSMakeRange(i, 1)];
        if ([str isNumber]) {
            [tempArray addObject:str];
        }
    }
    NSString *resultString = [tempArray componentsJoinedByString:@""];
    if ([resultString integerValue] < 50) {
        result = NO;
    }
    return result;
}

-(BOOL)isEmail
{
    BOOL stricterFilter = YES;
    NSString *stricterFilterString = @"[A-Z0-9a-z\\._%+-]+@([A-Za-z0-9-]+\\.)+[A-Za-z]{2,4}";
    NSString *laxString = @".+@([A-Za-z0-9]+\\.)+[A-Za-z]{2}[A-Za-z]*";
    NSString *emailRegex = stricterFilter ? stricterFilterString : laxString;
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    return [emailTest evaluateWithObject:self];
}

- (NSString *)cutStringWithLength:(NSInteger)length
{
    if (length >= self.length) {
        return self;
    }
    NSRange range = [self rangeOfComposedCharacterSequencesForRange:NSMakeRange(0, length - 1)];
    NSString *returnStr = [self substringWithRange:range];
    return [returnStr stringByAppendingString:@"..."];
}


static NSString * SSPercentEscapedQueryStringValueFromStringWithEncoding(NSString *string, NSStringEncoding encoding) {
    return (__bridge_transfer  NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (__bridge CFStringRef)string, NULL, (__bridge CFStringRef)kAFCharactersToBeEscapedInQueryString, CFStringConvertNSStringEncodingToEncoding(encoding));
}

- (NSString *)urlDecode {
    return [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

- (NSString *)urlEncode {
    //    return [self stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return SSPercentEscapedQueryStringValueFromStringWithEncoding(self
                                                                  , NSUTF8StringEncoding);
}

- (NSString *)urlEncodeNoSymbol{
    
   return (__bridge_transfer  NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (__bridge CFStringRef)self, NULL, (__bridge CFStringRef) @":/?&=;!@#$()',*", CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
}

static NSString * const kAFCharactersToBeEscapedInQueryString = @":/?&=;+!@#$()',*";

static NSString * SSPercentEscapedQueryStringKeyFromStringWithEncoding(NSString *string, NSStringEncoding encoding) {
    static NSString * const kAFCharactersToLeaveUnescapedInQueryStringPairKey = @"[].";
    
    return (__bridge_transfer  NSString *)CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (__bridge CFStringRef)string, (__bridge CFStringRef)kAFCharactersToLeaveUnescapedInQueryStringPairKey, (__bridge CFStringRef)kAFCharactersToBeEscapedInQueryString, CFStringConvertNSStringEncodingToEncoding(encoding));
}

- (NSURL *)urlValue {
    
    NSString *encodeString = [[self stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding] stringByReplacingOccurrencesOfString:@"+" withString:@"%2B"];
    
    return [NSURL URLWithString:encodeString];
}

- (NSString *)toBase64String {
    return [[self dataUsingEncoding:NSASCIIStringEncoding] base64EncodedStringWithOptions:0];
}

- (NSString *)base64StringToOriginString {
    return [[NSString alloc] initWithData:[[NSData alloc] initWithBase64EncodedString:self options:0] encoding:NSASCIIStringEncoding];
}

// 0:未知，1:男性，2:女性
+ (int)yy_getSexWithString:(NSString *)str{
    if ([str isEqualToString:@"男"]) {
        return 1;
    }else if ([str isEqualToString:@"女"]){
        return 2;
    }else{
        return 0;
    }
}

+ (NSString *)getChineseMonth:(NSUInteger )month{
    switch (month) {
        case 1:
            return @"一月";
            break;
        case 2:
            return @"二月";
            break;
        case 3:
            return @"三月";
            break;
        case 4:
            return @"四月月";
            break;
        case 5:
            return @"五月";
            break;
        case 6:
            return @"六月";
            break;
        case 7:
            return @"七月";
            break;
        case 8:
            return @"八月";
            break;
        case 9:
            return @"九月月";
            break;
        case 10:
            return @"十月";
            break;
        case 11:
            return @"十一月";
            break;
        case 12:
            return @"十二月";
            break;
        default:
            return @"";
            break;
    }
}

- (CGSize)lg_sizeWithFont:(UIFont *)font{
    CGSize textSize = [self sizeWithAttributes:@{ NSFontAttributeName : font }];
    return textSize;
}
- (CGSize)lg_sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)constraint lineBreakMode:(NSLineBreakMode)lineBreakMode{
    
    CGRect rect = [self boundingRectWithSize:constraint
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:@{ NSFontAttributeName : font }
                                     context:nil];
    return rect.size;

}
- (CGSize)lg_sizeWithFont:(UIFont *)font constrainedToSize:(CGSize)size{
    return [self lg_sizeWithFont:font constrainedToSize:size lineBreakMode:NSLineBreakByWordWrapping];
}
@end
