//
//  AppDelegate.m
//  fgcdfgd
//
//  Created by fpmi on 24.10.15.
//  Copyright (c) 2015 fpmi. All rights reserved.
//

#import "AppDelegate.h"
#import "PYDataStore.h"

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.nbrb.by/Services/XmlExRates.aspx?ondate=10/30/2015"]];
    PYDataStore *del = [[PYDataStore alloc] init];
    NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:del] ;
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
