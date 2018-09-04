//
//  AppDelegate.h
//  iOS_wave
//
//  Created by 姜艳昌 on 2018/9/3.
//  Copyright © 2018年 jiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

