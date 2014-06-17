//
//  AppDelegate.h
//  Calendar_Event
//
//  Created by Ramdhas on May,19.
//  Copyright (c) 2014 Ramdhas. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KalViewController;
@interface AppDelegate : UIResponder <UIApplicationDelegate,UITableViewDelegate>
{
    UIWindow *window;
    UINavigationController *navController;
    KalViewController *kal;
    id dataSource;
}

@property (strong, nonatomic) UIWindow *window;

@end
