//
//  ELUtilityHelper.h
//  ELTool
//
//  Created by speedsnail on 2018/4/9.
//  Copyright © 2018年 speedsnail. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ELUtilityHelper : NSObject
#pragma mark - 链接处理相关
/**
 字典参数拼接到链接中
 
 @param urlPath 域名url
 @param paraDict 参数字典
 @return 返回含有参数的完整链接字符串
 */
+ (NSString *)createUrl:(NSString *)urlPath WithParaDict:(NSDictionary *)paraDict;
/**
 urlEncode编码操作
 
 @param input 编码字符串
 @return 编码后的字符串
 */
+ (NSString *)encodeToPercentEscapeString:(NSString *)input;
@end
