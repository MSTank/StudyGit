//
//  ViewController.m
//  StudyCode
//
//  Created by 李鉴开 on 2018/7/19.
//  Copyright © 2018年 李鉴开. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
{
    int a;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

//这是master 工程
    
// study GCD first
//    NSLog(@"start");
//
//    dispatch_queue_t queue = dispatch_queue_create("testDispatchQueue", DISPATCH_QUEUE_CONCURRENT);
//
//    dispatch_async(queue, ^{
//        for (int i = 0; i < 10000; i++) {
//            i++;
//            NSLog(@"i = %d",i);
//            a = i++;
//        }
//        dispatch_async(dispatch_get_main_queue(), ^{
//            NSLog(@"打印结束 ！ a = %d", a);
//        });
//    });
    
    
//使用系统的 NSObjce PerformSelectorInBackground with() 和perforemSelectorOnMainThread来实现GCD
    [self performSelectorInBackground:@selector(test) withObject:nil];
    
    
//主线程耗时操作
    for (int i = 0; i < 5000; i++) {
        NSLog(@"这是主线程的打印----------");
    }
    
    
}

- (void)test
{
    for (int i = 0; i < 10000; i++) {
        i++;
        NSLog(@"i = %d",i);
        a = i++;
    }
    [self performSelectorOnMainThread:@selector(maintest) withObject:nil waitUntilDone:NO];
    
}

- (void)maintest
{
    NSLog(@"打印结束 ！ a = %d", a);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
