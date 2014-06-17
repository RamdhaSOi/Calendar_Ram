//
//  ViewController.h
//  Calendar_Event
//
//  Created by Ramdhas on May,19.
//  Copyright (c) 2014 Ramdhas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EventKitDataSource.h"
#import "Kal.h"

#import <EventKit/EventKit.h>
#import <EventKitUI/EventKitUI.h>

@class KalViewController;

@interface ViewController : UIViewController<UITableViewDelegate>
{
    KalViewController *kal;
    id dataSource;
    UINavigationController *navController;
}

@end
