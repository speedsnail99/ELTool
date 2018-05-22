//
//  ELXMLParseViewController.m
//  ELTool
//
//  Created by speedsnail on 2018/5/21.
//  Copyright © 2018年 speedsnail. All rights reserved.
//

#import "ELXMLParseViewController.h"
#import "ELXMLParser.h"

@interface ELXMLParseViewController ()<NSXMLParserDelegate>

@end

@implementation ELXMLParseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"XMLParse";
    [self createUserInterface];
}

- (void)createUserInterface
{
    UIButton *parseBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 50)];
    parseBtn.backgroundColor = [UIColor blueColor];
    [parseBtn setTitle:@"Parse" forState:UIControlStateNormal];
    [parseBtn addTarget:self action:@selector(startParseAction) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:parseBtn];
}

- (void)startParseAction
{
    
    /*
    // 获取工程中xml文件路径
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"demofirst" ofType:@"xml"];
    NSData *xmlData = [NSData dataWithContentsOfFile:filePath];
    // 支节点数组
    NSArray *branchNameArray = @[@"titleBar",  @"adBar"];
    // 支节点的子节点数组
    NSArray *crotchNameArray = @[@"ad"];
      */
    
    // 获取工程中xml文件路径
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"oaMessage" ofType:@"xml"];
    NSData *xmlData = [NSData dataWithContentsOfFile:filePath];
    // 支节点数组
    NSArray *branchNameArray = @[];
    // 支节点的子节点数组
    NSArray *crotchNameArray = @[];
    
    [ELXMLParser dictionaryWithXMLData:xmlData branchNames:branchNameArray crotchNames:crotchNameArray finishBlock:^(NSString *rootElementName, NSArray *xmlArray) {
        NSLog(@"xmlArray:%@", xmlArray);
        NSLog(@"rootElementName:%@", rootElementName);
        
    } errorBlock:^(NSError *error) {
        
    }];
    

    
}

#pragma mark - NSXMLParserDelegate
// 开始
- (void)parserDidStartDocument:(NSXMLParser *)parser {
    
    NSLog(@"开始");
    
}

// 获取节点头
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
//     NSLog(@"解析XML文件中所有的元素:elementName:%@,attributeDict:%@",elementName,attributeDict);
    NSLog(@"startElement:%@",elementName);
//    if ([elementName isEqualToString:@"video"]) {
//        //MJExtension 解析数据
//        Model *model = [Model mj_objectWithKeyValues:attributeDict];
//        [self.dataArrM addObject:model];
//    }
    
//    self.currentElementName = elementName;
//
//    if ([elementName isEqualToString:@"student"]) {
//        Student *stu = [[Student alloc] init];
//        [_studentArray addObject:stu];
//    }
    
}

// 获取节点的值 (这个方法在获取到节点头和节点尾后，会分别调用一次)
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    
    NSLog(@"value : %@", string);
    
//    if (_currentElementName != nil) {
//        Student *stu = [_studentArray lastObject];
//        [stu setValue:string forKey:_currentElementName];
//    }
}

// 获取节点尾
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {
    NSLog(@"endElement:%@",elementName);
//    _currentElementName = nil;
//    NSLog(@"end element :%@", elementName);
    
}

// 结束
- (void)parserDidEndDocument:(NSXMLParser *)parser {
    
    NSLog(@"结束");
//    NSLog(@"%@",_studentArray);
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
