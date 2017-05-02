//
//  AppDelegate.h
//  ImageViewer
//
//  Created by Wilson Oliveira on 02/05/2017.
//  Copyright © 2017 wso277. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

