//
//  SFIMHistorySynModel.h
//  ELTool
//
//  Created by speedsnail on 2018/5/27.
//  Copyright © 2018年 speedsnail. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SFIMHistorySynModel : NSObject
@property (nonatomic, copy) NSString *agentname;
@property (nonatomic, copy) NSString *clienttype;
@property (nonatomic, copy) NSString *command;
@property (nonatomic, copy) NSString *form;
@property (nonatomic, copy) NSString *from;
@property (nonatomic, copy) NSString *message ;
@property (nonatomic, copy) NSString *messageid ;
@property (nonatomic, copy) NSString *messagekey ;
@property (nonatomic, copy) NSString *messagetime;
@property (nonatomic, copy) NSString *nickname ;
@property (nonatomic, copy) NSString *sendtime;
@property (nonatomic, copy) NSString *sendto;
@property (nonatomic, copy) NSString *state;
@property (nonatomic, copy) NSString *type ;
@end
