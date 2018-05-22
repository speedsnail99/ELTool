//
//  ELXMLParser.h
//  ELTool
//
//  Created by speedsnail on 2018/5/21.
//  Copyright © 2018年 speedsnail. All rights reserved.
//  参考 https://www.jianshu.com/p/be5ce8bacbd9

#import <Foundation/Foundation.h>


typedef void(^FinishBlock)(NSString *rootElementName, NSArray *xmlArray);
typedef void(^ErrorBlock)(NSError *error);

@interface ELXMLParser : NSObject

+ (void)dictionaryWithXMLData:(NSData *)data branchNames:(NSArray *)branchNames crotchNames:(NSArray *)crotchNames finishBlock:(FinishBlock)finish errorBlock:(ErrorBlock)error;

@end
