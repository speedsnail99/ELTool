//
//  ELUtilityHelper.m
//  ELTool
//
//  Created by speedsnail on 2018/4/9.
//  Copyright © 2018年 speedsnail. All rights reserved.
//

#import "ELUtilityHelper.h"

@implementation ELUtilityHelper


/**
 字典参数拼接到链接中

 @param urlPath 域名url
 @param paraDict 参数字典
 @return 返回含有参数的完整链接字符串
 */
+ (NSString *)createUrl:(NSString *)urlPath WithParaDict:(NSDictionary *)paraDict
{
    if (!paraDict) {
        return  urlPath;
    }
    //字符串编码
    NSMutableDictionary *newParaDict = [[NSMutableDictionary alloc] init];
    [paraDict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSString *encodeObj = [self encodeToPercentEscapeString:obj];
        [newParaDict setObject:encodeObj forKey:key];
        
    }];
    //参数排序
    NSArray *allParaKeysArray = [paraDict allKeys];
    NSArray *sortedArray = [allParaKeysArray sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        NSComparisonResult result = [obj1 compare:obj2];
        if (result == NSOrderedAscending) {
            return NSOrderedAscending;
        } else {
            return NSOrderedDescending;
        }
    }];
    //拼接参数
    NSMutableString * urlParameterStr = [[NSMutableString alloc]init];
    [sortedArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        NSString * value = newParaDict[obj];
        [urlParameterStr appendString:[NSString stringWithFormat:@"%@=%@",obj,value]];
        if (idx !=sortedArray.count - 1) {
            [urlParameterStr appendString:@"&"];
        }
    }];
    //拼接完整链接
    NSString *completeUrl = [NSString stringWithFormat:@"%@?%@",urlPath,urlParameterStr];
    return completeUrl;
}


/**
 urlEncode编码操作
 
 @param input 编码字符串
 @return 编码后的字符串
 */
+ (NSString *)encodeToPercentEscapeString:(NSString *)input
{
    if (!input) {
        input = [NSString stringWithFormat:@""];
    }
    NSString *outputStr = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,
                                                              (CFStringRef)input,
                                                              NULL,
                                                              (CFStringRef)@"!*'();:@ &=+$,/?%#[]",
                                                              kCFStringEncodingUTF8));
    NSMutableString *str = [NSMutableString stringWithString:outputStr];
    [str replaceOccurrencesOfString:@"%20"  withString:@"+" options:NSLiteralSearch range:NSMakeRange(0, [str length])];
    
    return str;
}

@end
