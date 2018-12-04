//
//  WJCoreDataManager.m
//
//
//  Created by William on 2016/4/12.
//  Copyright © 2016年 William. All rights reserved.
//

#import "WJCoreDataManager.h"

@implementation WJCoreDataManager

IMPLEMENTATION_SINGLETON(WJCoreDataManager)

- (instancetype)init {
    if (self = [super init]) {
        // 创建对象模型
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"Model" withExtension:@"momd"];
        self.model = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
        
        // 创建持久化调度器
        self.persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:self.model];
        
        // 配置持久化调度器
        NSURL *storeURL = [[[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject] URLByAppendingPathComponent:@"William.sqlite"];
        NSLog(@"storeURL = %@", storeURL);
        NSDictionary *options = @{NSMigratePersistentStoresAutomaticallyOption:@(YES), //
                                  NSInferMappingModelAutomaticallyOption:@(YES)}; //自动模型更新
        [self.persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:options error:nil];
        
        // 创建上下文
        // 主线程
        self.context = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        
        // 关联上下文和持久化调度器
        self.context.persistentStoreCoordinator = self.persistentStoreCoordinator;
    }
    return self;
}

@end
