//
//  GCDUntil.m
//  trusty
//
//  Created by playable-iMac2 on 2019/2/25.
//  Copyright © 2019年 majin.missky. All rights reserved.
//

#import "GCDUntil.h"

@implementation GCDUntil{
    __block int _ticketSurplusCount;
    dispatch_semaphore_t semaphoreLock;
    NSLock *_lock;
}

#pragma mark - 1.GCD基本使用

-(void)gcdStudy{
    
    //URL:https://bujige.net/blog/iOS-Complete-learning-GCD.html
    
    //Serial Dispatch Queue
    //Concurrent Dispatch Queue (it works on dispatch_async)
    
    //1->make queue
    //DISPATCH_QUEUE_SERIAL
    //DISPATCH_QUEUE_CONCURRENT
    dispatch_queue_t serialQueue = dispatch_queue_create("link.trusty", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t mainSerialQueue = dispatch_get_main_queue();
    
    dispatch_queue_t concurrentQueue = dispatch_queue_create("link.trusty", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t globalConcurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
}

-(void)run{
    //    [self asyncConcurrent];
    //    [self communication];
    //    [self barrier];
    //    [self apply];
    //    [self groupNotify];
    //    [self groupWait];
    //    [self groupEnterAndLeave];
    [self initTicketStatusSave];
}

//同步执行+串行队列
//ps:不会开启新线程，在当前线程执行任务，任务是串行的，执行完一个任务，再执行下一个任务
-(void)syncSerial{
    NSLog(@"currentThread---%@",[NSThread currentThread]);
    NSLog(@"syncSerial---begin");
    
    dispatch_queue_t queue = dispatch_queue_create("test", DISPATCH_QUEUE_SERIAL);
    
    dispatch_sync(queue, ^{
        //追加任务1
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    dispatch_sync(queue, ^{
        //追加任务2
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    dispatch_sync(queue, ^{
        //追加任务3
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    NSLog(@"syncSerial---end");
}

//同步执行+并发队列
//ps:在当前线程中执行任务，不会开启新线程，执行完一个任务，再执行下一个任务。任务是并发的?
-(void)syncConcurrent{
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"syncConcurrent---begin");
    
    dispatch_queue_t queue = dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_sync(queue, ^{
        // 追加任务1
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    dispatch_sync(queue, ^{
        // 追加任务2
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    dispatch_sync(queue, ^{
        // 追加任务3
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    NSLog(@"syncConcurrent---end");
}

//异步执行+串行队列
//ps:会开启新线程，但是因为任务是串行的，执行完一个任务，再执行下一个任务。
-(void)asyncSerial{
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"asyncSerial---begin");
    
    dispatch_queue_t queue = dispatch_queue_create("net.bujige.testQueue", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(queue, ^{
        // 追加任务1
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    dispatch_async(queue, ^{
        // 追加任务2
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    dispatch_async(queue, ^{
        // 追加任务3
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    NSLog(@"asyncSerial---end");
}

//异步执行+并发队列
//ps:可以开启多个线程，任务交替（同时）执行。
-(void)asyncConcurrent{
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"asyncConcurrent---begin");
    
    dispatch_queue_t queue = dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        // 追加任务1
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    dispatch_async(queue, ^{
        // 追加任务2
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    dispatch_async(queue, ^{
        // 追加任务3
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    NSLog(@"asyncConcurrent---end");
}


#pragma mark - 2.GCD 线程间通讯

-(void)communication{
    //获取全局并发队列
    dispatch_queue_t globalConcurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //获取主队列
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    
    dispatch_async(globalConcurrentQueue, ^{
        // 异步追加任务
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        }
        
        // 回到主线程
        dispatch_async(mainQueue, ^{
            // 追加在主线程中执行的任务
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
        });
    });
}

#pragma mark - 3.GCD 其他方法
/**
 * 栅栏方法 dispatch_barrier_async
 */
-(void)barrier{
    dispatch_queue_t queue = dispatch_queue_create("", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(queue, ^{
        // 追加任务1
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    dispatch_async(queue, ^{
        // 追加任务2
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    dispatch_barrier_async(queue, ^{
        // 追加任务 barrier
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"barrier---%@",[NSThread currentThread]);// 打印当前线程
        }
    });
    
    dispatch_async(queue, ^{
        // 追加任务3
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    dispatch_async(queue, ^{
        // 追加任务4
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"4---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
}

/**
 * 延时执行方法 dispatch_after
 */
-(void)after{
    
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"asyncMain---begin");
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"after---%@",[NSThread currentThread]);  // 打印当前线程;
    });
}

/**
 * 一次性代码（只执行一次）dispatch_once
 */
-(void)once{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // 只执行1次的代码(这里面默认是线程安全的)
    });
}

/**
 * 快速迭代方法 dispatch_apply
 */
-(void)apply{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0);
    
    NSLog(@"apply---begin");
    dispatch_apply(14737777777, queue, ^(size_t index) {
        NSLog(@"%zd---%@",index, [NSThread currentThread]);
    });
    NSLog(@"apply---end");
}

#pragma mark - 4.GCD 队列组：dispatch_group
/**
 * 队列组 dispatch_group_notify (监听 group 中任务的完成状态，当所有的任务都执行完成后，追加任务到 group 中，并执行任务)
 */
- (void)groupNotify{
    NSLog(@"currentThread---%@",[NSThread currentThread]);
    NSLog(@"group---begin");
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 追加任务1
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 追加任务2
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        // 等前面的异步任务1、任务2都执行完毕后，回到主线程执行下边任务
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
        }
        NSLog(@"group---end");
    });
}

/**
 * 队列组 dispatch_group_wait (等待上面的任务全部完成后，会往下继续执行（会阻塞当前线程）)
 */
-(void)groupWait{
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"group---begin");
    
    dispatch_group_t group = dispatch_group_create();
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 追加任务1
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        // 追加任务2
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
        }
    });
    
    // 等待上面的任务全部完成后，会往下继续执行（会阻塞当前线程）
    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    
    NSLog(@"group---end");
}

/**
 * 队列组 dispatch_group_enter、dispatch_group_leave
 */
-(void)groupEnterAndLeave{
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"group---begin");
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_group_enter(group);
    dispatch_async(queue, ^{
        // 追加任务1
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程
        }
        dispatch_group_leave(group);
    });
    
    dispatch_group_enter(group);
    dispatch_async(queue, ^{
        // 追加任务2
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"2---%@",[NSThread currentThread]);      // 打印当前线程
        }
        dispatch_group_leave(group);
    });
    
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        
        // 等前面的异步操作都执行完毕后，回到主线程.
        for (int i = 0; i < 2; ++i) {
            [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
            NSLog(@"3---%@",[NSThread currentThread]);      // 打印当前线程
        }
        NSLog(@"group---end");
    });
    
    //    // 等待上面的任务全部完成后，会往下继续执行（会阻塞当前线程）
    //    dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    //    NSLog(@"group---end");
}

#pragma mark - 5.GCD 信号量：dispatch_semaphore
//(GCD 中的信号量是指 Dispatch Semaphore，是持有计数的信号。类似于过高速路收费站的栏杆。可以通过时，打开栏杆，不可以通过时，关闭栏杆。在 Dispatch Semaphore 中，使用计数来完成这个功能，计数为0时等待，不可通过。计数为1或大于1时，计数减1且不等待，可通过。)
/**
 * 线程同步 dispatch_semaphore
 */
-(void)semaphore{
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"semaphore---begin");

    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);

    __block int number = 0;

    dispatch_async(queue, ^{

        // 追加任务1
        [NSThread sleepForTimeInterval:2];              // 模拟耗时操作
        NSLog(@"1---%@",[NSThread currentThread]);      // 打印当前线程

        number = 100;

        dispatch_semaphore_signal(semaphore);
    });

    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
    NSLog(@"semaphore---end,number = %d",number);
}

/**
 * 线程同步 Dispatch Semaphore 线程安全和线程同步
 */

//场景：总共有50张火车票，有两个售卖火车票的窗口，一个是北京火车票售卖窗口，另一个是上海火车票售卖窗口。两个窗口同时售卖火车票，卖完为止。

/**
 * 非线程安全（不使用 semaphore）
 */
-(void)initTicket{
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"semaphore---begin");
    
    _ticketSurplusCount = 50;
    
    //queue1 北京买票窗口
    dispatch_queue_t queue1 = dispatch_queue_create("beijin.ticket", DISPATCH_QUEUE_SERIAL);
    //queue2 上海买票窗口
    dispatch_queue_t queue2 = dispatch_queue_create("shanghai.ticket", DISPATCH_QUEUE_SERIAL);
    
    //依次开始卖票
    dispatch_async(queue1, ^{
       
        [self beginSaleTicket];
    });
    
    dispatch_async(queue2, ^{
        
        [self beginSaleTicket];
    });
}

-(void)beginSaleTicket{
    while (1) {
        
        //卖票操作
        if (_ticketSurplusCount > 0) {  //如果还有票，继续售卖
            _ticketSurplusCount--;
            [NSThread sleepForTimeInterval:0.2];
            NSLog(@"%@", [NSString stringWithFormat:@"剩余票数：%d 窗口：%@", _ticketSurplusCount, [NSThread currentThread]]);
        } else { //如果已卖完，关闭售票窗口
            NSLog(@"所有火车票均已售完");
            break;
        }
        //
        
    }
}


/**
 * 线程安全（使用 semaphore 加锁）
 */

-(void)initTicketSemaphore{
    NSLog(@"currentThread---%@",[NSThread currentThread]);  // 打印当前线程
    NSLog(@"semaphore---begin");
    
    semaphoreLock = dispatch_semaphore_create(0);
    
    _ticketSurplusCount = 50;
    
    //queue1 北京买票窗口
    dispatch_queue_t queue1 = dispatch_queue_create("beijin.ticket", DISPATCH_QUEUE_SERIAL);
    //queue2 上海买票窗口
    dispatch_queue_t queue2 = dispatch_queue_create("shanghai.ticket", DISPATCH_QUEUE_SERIAL);
    
    //依次开始卖票
    dispatch_async(queue1, ^{
        
        [self beginSaleTicket];
    });
    
    dispatch_async(queue2, ^{
        
        [self beginSaleTicket];
    });
}


-(void)beginSaleTicketSemaphore{
    while (1) {
        
        
        //开始卖票，加锁--
        dispatch_semaphore_wait(semaphoreLock, DISPATCH_TIME_FOREVER);
        
        //卖票操作
        if (_ticketSurplusCount > 0) {  //如果还有票，继续售卖
            _ticketSurplusCount--;
            NSLog(@"%@", [NSString stringWithFormat:@"剩余票数：%d 窗口：%@", _ticketSurplusCount, [NSThread currentThread]]);
            [NSThread sleepForTimeInterval:0.2];
        } else { //如果已卖完，关闭售票窗口
            NSLog(@"所有火车票均已售完");
            //一个窗口的票卖完了，那这个窗口就不需要加锁了，解锁
            dispatch_semaphore_signal(semaphoreLock);
            break;
        }
        
        //一个窗口的一次卖票操作结束，解锁
        dispatch_semaphore_signal(semaphoreLock);
        
    }
}


#pragma mark - 6.Operation OperationQueue

-(void)task1{
    
    for (int i = 0; i < 2; i++) {
        [NSThread sleepForTimeInterval:2];                  // 模拟耗时操作
        NSLog(@"task1---%@", [NSThread currentThread]);     // 打印当前线程
    }
}

-(void)task2{
    
    for (int i = 0; i < 2; i++) {
        [NSThread sleepForTimeInterval:2];                  // 模拟耗时操作
        NSLog(@"task2---%@", [NSThread currentThread]);     // 打印当前线程
    }
}

-(void)operationQueueTest{
    
    NSLog(@"currentThread == %@",[NSThread currentThread]);
    NSLog(@"Operation--Begin");
    
    //1.creat queue
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
    //2.maxConcurrentOperationCount -- (the most concurrent task count)
    queue.maxConcurrentOperationCount = -1;
    //    queue.maxConcurrentOperationCount = 1;
    
    //3.creat task
    NSInvocationOperation *op1 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(task1) object:nil];
    NSInvocationOperation *op2 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(task2) object:nil];
    NSBlockOperation *op3 = [NSBlockOperation blockOperationWithBlock:^{
        
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];                              // 模拟耗时操作
            NSLog(@"task3---%@", [NSThread currentThread]);                 // 打印当前线程
        }
    }];
    
    //4.dependency (if task1/op1 must run when task1/op2 finished,use the slector addDependency)
    [op1 addDependency:op2];
    
    //5.add operation to queue and start operation'task
    [queue addOperation:op1];
    [queue addOperation:op2];
    [queue addOperation:op3];
    [queue addOperationWithBlock:^{
        
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];                              // 模拟耗时操作
            NSLog(@"task4---%@", [NSThread currentThread]);                 // 打印当前线程
        }
    }];
    
    [queue addOperationWithBlock:^{
        
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];                              // 模拟耗时操作
            NSLog(@"task5---%@", [NSThread currentThread]);                 // 打印当前线程
        }
    }];
    
    //6.communication
    [queue addOperationWithBlock:^{
        
        // 异步进行耗时操作
        for (int i = 0; i < 2; i++) {
            [NSThread sleepForTimeInterval:2];                              // 模拟耗时操作
            NSLog(@"task6---%@", [NSThread currentThread]);                 // 打印当前线程
        }
        
        // 回到主线程
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            
            // 进行一些 UI 刷新等操作
            for (int i = 0; i < 2; i++) {
                [NSThread sleepForTimeInterval:2];                           // 模拟耗时操作
                NSLog(@"taskRefreshUI---%@", [NSThread currentThread]);     // 打印当前线程
            }
        }];
    }];
}

/**
 * 线程安全：使用 NSLock 加锁
 * 初始化火车票数量、卖票窗口(线程安全)、并开始卖票
 */

- (void)initTicketStatusSave {
    NSLog(@"currentThread---%@",[NSThread currentThread]); // 打印当前线程
    
    _ticketSurplusCount = 50;
    
    _lock = [[NSLock alloc] init];  // 初始化 NSLock 对象
    
    // 1.创建 queue1,queue1 代表北京火车票售卖窗口
    NSOperationQueue *queue1 = [[NSOperationQueue alloc] init];
    queue1.maxConcurrentOperationCount = 1;
    
    // 2.创建 queue2,queue2 代表上海火车票售卖窗口
    NSOperationQueue *queue2 = [[NSOperationQueue alloc] init];
    queue2.maxConcurrentOperationCount = 1;
    
    // 3.创建卖票操作 op1
    NSBlockOperation *op1 = [NSBlockOperation blockOperationWithBlock:^{
        [self saleTicketSafe];
    }];
    // 4.创建卖票操作 op2
    NSBlockOperation *op2 = [NSBlockOperation blockOperationWithBlock:^{
        [self saleTicketSafe];
    }];

    // 5.添加操作，开始卖票
    [queue1 addOperation:op1];
    [queue2 addOperation:op2];
}

/**
 * 售卖火车票(线程安全)
 */
- (void)saleTicketSafe{
    while (1) {
        
        // 加锁
        [_lock lock];
        
        if (_ticketSurplusCount > 0) {
            //如果还有票，继续售卖
            _ticketSurplusCount--;
            NSLog(@"%@", [NSString stringWithFormat:@"剩余票数:%d 窗口:%@", _ticketSurplusCount, [NSThread currentThread]]);
            [NSThread sleepForTimeInterval:0.2];
        }
        
        // 解锁
        [_lock unlock];
        
        if (_ticketSurplusCount <= 0) {
            NSLog(@"所有火车票均已售完");
            break;
        }
    }
}

#pragma mark - 7.RunLoop


#pragma mark - breakpoint

-(void)breakPointTest{
    NSArray *array = @[@"yang",@"she",@"bing"];
    //    NSLog(@"%@",array[3]);
    for (int i = 0; i < 10; i++) {
        NSLog(@"%d",i);
    }
    
    /*
     1.Xcode for LLDB
     1.1 po
     print obj
     
     1.2 p
     p i
     
     1.3 call demo
     call i = i++ / i = i++;int j = j + i;
     
     1.4 expr
     expr i = 101
     
     1.5 bt
     bt thread
     
     1.6 image (find the location about address)
     image lookup --address 0x0000000104c25550
     
     2.Xcode for breakpoint
     2.1 if breakpoint
     
     2.2 Exception breakpoint
     
     2.3 symbolic breakpoint
     
     
     */
    //1.edit breakpoint
    //Condition  watchpoint set variable i
    
    
    
}
@end
