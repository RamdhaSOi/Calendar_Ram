//
//  ViewController.m
//  Calendar_Event
//
//  Created by Ramdhas on May,19.
//  Copyright (c) 2014 Ramdhas. All rights reserved.
//

#import "ViewController.h"
#import <EventKit/EventKit.h>  //Its must
#import <EventKitUI/EventKitUI.h>
#import "EventKitDataSource.h"
#import "Kal.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    kal = [[KalViewController alloc] init];
    kal.title = @"Calendar";
    kal.delegate = self;
    dataSource = [[EventKitDataSource alloc] init];
    kal.dataSource = dataSource;
    [self.navigationController pushViewController:kal animated:YES];
    
    EKEventStore *eventStore=[[EKEventStore alloc] init];
    
    [eventStore requestAccessToEntityType:EKEntityTypeEvent completion:^(BOOL granted, NSError *error)
     {
         if (granted)
         {
             EKEvent *event  = [EKEvent eventWithEventStore:eventStore];
             NSString * appointmentDetail =@"Ramdhas_Event";
             
             NSDate *startDate = [NSDate date];
             
             //Create the end date components
             NSDateComponents *tomorrowDateComponents = [[NSDateComponents alloc] init];
             tomorrowDateComponents.month = 1;
             
             NSDate *endDate = [[NSCalendar currentCalendar] dateByAddingComponents:tomorrowDateComponents
                                                                             toDate:startDate
                                                                            options:0];
             
             event.title =@"Ramdhas App";
             event.startDate=startDate;
             event.endDate=endDate;
             event.notes = appointmentDetail;
            // event.allDay=YES;
             
             [event setCalendar:[eventStore defaultCalendarForNewEvents]];
             
             NSError *err;
             [eventStore saveEvent:event span:EKSpanThisEvent error:&err];
             
             UIAlertView * Alert = [[UIAlertView alloc]initWithTitle:nil message:@"Event added successfully" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil, nil];
           //  [Alert show];
             
         }
         else
         {
             NSLog(@"NoPermission to access the calendar");
         }
         
     }];
}	// Do any additional setup after loading the view, typically from a nib.


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
