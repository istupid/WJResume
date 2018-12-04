//
//  WJCoreDataManager.h
//
//
//  Created by William on 2016/4/12.
//  Copyright © 2016年 William. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "WJSingleton.h"

@interface WJCoreDataManager : NSObject

INTERFACE_SINGLETON(WJCoreDataManager)

@property (nonatomic, strong) NSPersistentStoreCoordinator *persistentStoreCoordinator;

@property (nonatomic, strong) NSManagedObjectContext *context;

@property (nonatomic, strong) NSManagedObjectModel *model;

@end
