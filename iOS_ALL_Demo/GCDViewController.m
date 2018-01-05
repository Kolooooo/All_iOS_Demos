//
//  GCDViewController.m
//  iOS_ALL_Demo
//
//  Created by Ken_lu on 2017/10/15.
//  Copyright © 2017年 Ken lu. All rights reserved.
//

#import "GCDViewController.h"

@interface GCDViewController ()

@property (nonatomic, strong) UIButton  *button;
@property (nonatomic, strong) dispatch_group_t dispatchGroup;
@property (nonatomic, strong) NSURLSession *session;

@end

@implementation GCDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initUI];
    
#pragma mark group
    [self use_dispatch_group_t];
    
#pragma mark 信号量
    [self use_dispatch_semaphore];
}

- (void)use_dispatch_semaphore{
    /*
     * 信号量的具体做法是：当信号计数大于0时，每条进来的线程使计数减1，直到变为0，变为0后其他的线程将进不来，
     处于等待状态；执行完任务的线程释放信号，使计数加1，如此循环下去。
     *
     * dispatch_semaphore_create
     该函数使用一个初始值创建一个dispatch_semaphore_t类型的信号量,注意：这里的传入的参数value必须大于或等于0，否则dispatch_semaphore_create会返回NULL
     *
     * dispatch_semaphore_wait
     等待信号量，该函数会使传入的信号量dsema的值减1
     如果dsema信号量的值大于0，该函数所处线程就继续执行下面的语句，并且将信号量的值减1；
     如果desema的值为0，那么这个函数就阻塞当前线程等待timeout
     *
     * dispatch_semaphore_signal
     发送一个信号，这个函数会使传入的信号量dsema的值加1
     */
    
#pragma mark 我们可以使用信号量实现GCD下的同步
    [self use_dispatch_semaphore_t];
    
#pragma mark 异步添加数据到数组
    [self use_dispatch_semaphore_t_safe_add_array];
}

- (void)use_dispatch_semaphore_t_safe_add_array{
    dispatch_queue_t  queue = dispatch_get_global_queue(0, 0);
    NSMutableArray *array = [NSMutableArray array];
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(1);
    
    NSLog(@"Start action");
    for (NSUInteger i = 0; i < 5000000; i++) {
        dispatch_async(queue, ^{
            dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
            [array addObject:@(i)];
            dispatch_semaphore_signal(semaphore);
        });
    }
    
    NSLog(@"End action?");
}

- (void)use_dispatch_semaphore_t{
    /* log
     * dispatch_async 2
     * dispatch_async 1
     * all dispatch_async finished
     */
    
    dispatch_semaphore_t semaphore1 = dispatch_semaphore_create(0);
    dispatch_semaphore_t semaphore2 = dispatch_semaphore_create(0);
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSLog(@"dispatch_async 2");
            dispatch_semaphore_signal(semaphore2);
        });
        
        dispatch_semaphore_wait(semaphore2, DISPATCH_TIME_FOREVER);
        NSLog(@"dispatch_async 1");
        dispatch_semaphore_signal(semaphore1);
    });
    
    dispatch_semaphore_wait(semaphore1, DISPATCH_TIME_FOREVER);
    
    NSLog(@"all dispatch_async finished");
}

- (void)use_dispatch_group_t{
#pragma mark iOS多个异步网络请求全部返回后再执行具体逻辑的方法
    /*
     * dispatch_group_enter  相当于组内计数+1
     * dispatch_group_leave  相当于组内计数-1
     * dispatch_group_notify 组通知，如果计数器未0 那么就调用这里的block
     */
    
    [self refreshHeader];
    
    // 组通知回调必须放在组的所有注册之后
    [self endDispatchGroup];
    
    /* log
     * A request finished 与B 顺序不一定
     * B request finished 与A 顺序不一定
     * All request finished 一定在A B 完成以后
     */
}

- (void)refreshHeader{
    NSURLSessionDataTask *task = [self.session dataTaskWithURL:[NSURL URLWithString:@"https://www.baidu.com"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"A request finished");
        
        dispatch_group_leave(self.dispatchGroup);
    }];
    
    dispatch_group_enter(self.dispatchGroup);
    [task resume];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self refreshFooter];
    });
}

- (void)refreshFooter{
    NSURLSessionDataTask *task2 = [self.session dataTaskWithURL:[NSURL URLWithString:@
                                                                 "https://www.baidu.com"] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        NSLog(@"B request finished");
        dispatch_group_leave(self.dispatchGroup);
    }];
    
    dispatch_group_enter(self.dispatchGroup);
    [task2 resume];
}

- (void)endDispatchGroup{
    dispatch_group_notify(self.dispatchGroup, dispatch_get_main_queue(), ^(){
        NSLog(@"All request finished");
        
        __WeakSelf;
        [UIView animateWithDuration:1.0 animations:^{
            weakSelf.button.alpha = 0;
        } completion:^(BOOL finished) {
            [weakSelf.button removeFromSuperview];
        }];
    });
}

- (void)initUI{
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    self.button.frame = self.view.frame;
    self.button.backgroundColor = [UIColor yellowColor];
    self.button.alpha = 0.9;
    [self.button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.button setTitle:@"Loading" forState:UIControlStateNormal];
    
    [self.view addSubview:self.button];
}

#pragma mark - lazy load
- (dispatch_group_t)dispatchGroup{
    if (_dispatchGroup == nil) {
        _dispatchGroup = dispatch_group_create();
    }
    return _dispatchGroup;
}

- (NSURLSession *)session{
    if (_session == nil) {
        _session = [NSURLSession sharedSession];
    }
    return _session;
}

@end
