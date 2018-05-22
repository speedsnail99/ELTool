//
//  ELXMLParser.m
//  ELTool
//
//  Created by speedsnail on 2018/5/21.
//  Copyright © 2018年 speedsnail. All rights reserved.
//

#import "ELXMLParser.h"

@interface ELXMLParser()<NSXMLParserDelegate>
{
    NSXMLParser *_xmlParser;
    // 解析后获得的数据字典
    NSMutableArray *_xmlArray;
    
    // 树枝（branch，数的分支，即一个支节点）
    NSArray *_branchNameArray;
    // 树杈（crotch，树枝的分叉，意为支节点的子节点）
    NSArray *_crotchNameArray;
    
    // 当前节点名
    NSString *_currentElementName;
    // 支节点名
    NSString *_branchName;
    // 子节点名
    NSString *_crotchName;
    
    // 支节点下的数据字典
    NSMutableDictionary *_branchDict;
    // 支节点下的子节点的数据字典
    NSMutableDictionary *_crotchDict;
    // _crotchDict组成的数组
    NSMutableArray *_crotchArray;
    
    NSInteger _startNum;
    NSString *_rootElementName;
}
@property (nonatomic, copy) FinishBlock finish;
@property (nonatomic, copy) ErrorBlock error;

@end



@implementation ELXMLParser
+ (void)dictionaryWithXMLData:(NSData *)data
                  branchNames:(NSArray *)branchNames
                  crotchNames:(NSArray *)crotchNames
                  finishBlock:(FinishBlock)finish
                   errorBlock:(ErrorBlock)error;
{
    ELXMLParser *xmlHelper = [[ELXMLParser alloc] init];
    [xmlHelper dictionaryWithXMLData:data
                         branchNames:branchNames
                         crotchNames:crotchNames
                         finishBlock:finish
                          errorBlock:error];
}

- (void)dictionaryWithXMLData:(NSData *)data
                  branchNames:(NSArray *)branchNames
                  crotchNames:(NSArray *)crotchNames
                  finishBlock:(FinishBlock)finish
                   errorBlock:(ErrorBlock)error
{
    _branchNameArray = branchNames;
    _crotchNameArray = crotchNames;
    _branchName = @"";
    _crotchName = @"";
    _crotchArray = [NSMutableArray array];
    
    _xmlArray = [NSMutableArray array];
    _branchDict = [NSMutableDictionary dictionary];
    _crotchDict = [NSMutableDictionary dictionary];
    
    self.finish = finish;
    self.error = error;
    _startNum = 0;
    
    // 创建NSXMLParser对象并设置代理
    _xmlParser = [[NSXMLParser alloc] initWithData:data];
    _xmlParser.delegate = self;
    [_xmlParser parse];
}

/* 开始解析xml文件，在开始解析xml节点前，通过该方法可以做一些初始化工作 */
- (void)parserDidStartDocument:(NSXMLParser *)parser
{
}

/* 当解析器对象遇到xml的开始标记时，调用这个方法开始解析该节点 */
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict
{
    _currentElementName = elementName;
    ++_startNum;
    if (_startNum == 1) {
        _rootElementName = elementName;
    }
    
    if (_branchName.length == 0) {
        for (NSString *branchName in _branchNameArray) {
            if ([elementName isEqualToString:branchName]) {
                _branchDict = [NSMutableDictionary dictionary];
                _branchName = elementName;
                break;
            }
        }
    }
    
    if (_branchName.length > 0 && _crotchName.length == 0) {
        if ([elementName isEqualToString:_branchName] == NO) {
            for (NSString *crotchName in _crotchNameArray) {
                if ([elementName isEqualToString:crotchName]) {
                    _crotchDict = [NSMutableDictionary dictionary];
                    _crotchName = elementName;
                    break;
                }
            }
        }
    }
}

/* 当解析器找到开始标记和结束标记之间的字符时，调用这个方法解析当前节点的所有字符 */
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    if (_branchName.length > 0) {
        if (string.length > 0 && _crotchName.length == 0 && _currentElementName != _branchName) {
            if ([string rangeOfString:@"\n"].length == 0) {
                [_branchDict setValue:string forKey:_currentElementName];
            }
        }
        
        if (_crotchName.length > 0 && _currentElementName != _crotchName) {
            if ([string rangeOfString:@"\n"].length == 0) {
                [_crotchDict setValue:string forKey:_currentElementName];
            }
            
            if ([self isBlankString:string]) {
                [_crotchDict setValue:@"" forKey:_currentElementName];
            }
        }
    }
}

/* 当解析器对象遇到xml的结束标记时，调用这个方法完成解析该节点 */
- (void)parser:(NSXMLParser *)parser didEndElement:(nonnull NSString *)elementName namespaceURI:(nullable NSString *)namespaceURI qualifiedName:(nullable NSString *)qName
{
    if (_branchName.length > 0) {
        // 1.先处理子节点
        if ([elementName isEqualToString:_crotchName]) {
            [_crotchArray addObject:_crotchDict];
            [_branchDict setObject:_crotchArray forKey:_crotchName];
            
            _crotchName = @"";
        }
        
        // 2.在处理支节点
        if ([elementName isEqualToString:_branchName]) {
            NSDictionary *dict = [NSDictionary dictionaryWithObject:_branchDict forKey:_branchName];
            [_xmlArray addObject:dict];
            
            _branchName = @"";
            _crotchArray = [NSMutableArray array];
        }
    }
}

/* 解析xml出错的处理方法 */
- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(nonnull NSError *)parseError
{
    if (self.error) {
        self.error(parseError);
    }
}

/* 解析xml文件结束 */
- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    if (self.finish) {
        self.finish(_rootElementName, _xmlArray);
    }
}

- (BOOL) isBlankString:(NSString *)string {
    if (string == nil || string == NULL) {
        return YES;
    }
    if ([string isKindOfClass:[NSNull class]]) {
        return YES;
    }
    if ([[string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0) {
        return YES;
    }
    
    return NO;
}


@end
