//
//  Macro.h
//  ELTool
//
//  Created by speedsnail on 2018/6/1.
//  Copyright © 2018年 speedsnail. All rights reserved.
//

#ifndef Macro_h
#define Macro_h

/*normal size */
#define kScreenViewBounds                      [UIScreen mainScreen].bounds
#define kScreenViewSize                        [UIScreen mainScreen].bounds.size
#define kScreenHeight                          [UIScreen mainScreen].bounds.size.height
#define kScreenWidth                           [UIScreen mainScreen].bounds.size.width

/*说明：
 *1.两个log方法，GGLogDebug GGLogError，用法和NSLog一样
 *2.SFLogDebug的输出添加了函数名
 *3.SFLogError的输出添加Error字段，添加了函数名和行号
 */
#ifdef DEBUG
#define ELLogDebug(fmt, ...)                        NSLog((@"%s" fmt), __FUNCTION__, ##__VA_ARGS__);
#define ELLogError(fmt, ...)                        NSLog((@"ERROR%s:%d" fmt), __FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define ELLogDebug(...);
#define ELLogError(...);
#define NSLog(...);
#endif

/* strong weak type*/
//weak
#define ELweakSelf(type)  __weak typeof(type) weak##type = type;
//strong
#define ELStrongSelf(type)  __strong typeof(type) type = weak##type;

/* performSelector方法调用SEL警告处理 */
#define SuppressPerformSelectorLeakWarning(Stuff) \
do { \
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Warc-performSelector-leaks\"") \
Stuff; \
_Pragma("clang diagnostic pop") \
} while (0)


#define ELSystemVersion [[[UIDevice currentDevice] systemVersion] floatValue]

#import "LGAlertView.h"
#import "Masonry.h"

#endif /* Macro_h */
