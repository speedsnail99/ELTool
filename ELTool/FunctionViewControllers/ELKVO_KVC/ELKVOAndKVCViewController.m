//
//  ELKVOAndKVCViewController.m
//  ELTool
//
//  Created by speed snail on 2018/7/13.
//  Copyright © 2018年 speedsnail. All rights reserved.
//

#import "ELKVOAndKVCViewController.h"
#import "Dog.h"
#import "CarMan.h"

@interface ELKVOAndKVCViewController ()
@property (nonatomic, strong) CarMan *redCar;
@end

@implementation ELKVOAndKVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createUserInterface];
    [self configData];
    
}

- (void)configData
{
    CarMan *redCarman = [[CarMan alloc] init];
    self.redCar = redCarman;
    redCarman.carName = @"dasAuto";
    redCarman.carColor = @"red";
    
    [redCarman addObserver:self forKeyPath:@"carName" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)createUserInterface
{
    
    
    UIButton *setBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [self.view addSubview:setBtn];
    setBtn.backgroundColor = [UIColor cyanColor];
    [setBtn setTitle:@"ChangeDogValue" forState:UIControlStateNormal];
    [setBtn addTarget:self action:@selector(changeDogValue:) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *kvoBtn = [[UIButton alloc] initWithFrame:CGRectMake(100, CGRectGetMaxY(setBtn.frame) + 50, 100, 100)];
    [self.view addSubview:kvoBtn];
    kvoBtn.backgroundColor = [UIColor cyanColor];
    [kvoBtn setTitle:@"kvochange" forState:UIControlStateNormal];
    [kvoBtn addTarget:self action:@selector(changeKVOValue:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)changeDogValue:(UIButton *)btn
{
    
//    Dog* dog = [Dog new];
//    [dog setValue:@"newName" forKey:@"name"];
//    NSString* name = [dog valueForKey:@"toSetName"];
//    NSLog(@"%@",name);
    
    
}

- (void)changeKVOValue:(UIButton *)btn
{
    static int i = 1;
    i ++;
    NSString *carName = [NSString stringWithFormat:@"numb%d",i];
    //kvo
    self.redCar.carName = carName;
    
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSString *logStr = [NSString stringWithFormat:@"%@监听到 %@的%@ 改变",object,keyPath,change];
    ELLogDebug(@"%@",logStr);
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
