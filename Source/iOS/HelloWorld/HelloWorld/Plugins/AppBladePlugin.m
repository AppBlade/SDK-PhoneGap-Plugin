//
//  AppBladePlugin.m
//  HelloWorld
//
//  Created by Michele Titolo on 5/14/12.
//  Copyright (c) 2012 AppBlade. All rights reserved.
//

#import "AppBladePlugin.h"
#import "AppBlade.h"

enum {
    ABProjectID = 0,
    ABToken,
    ABSecretKey,
    ABTimestamp
};

@implementation AppBladePlugin

- (void)setupAppBlade:(NSMutableArray*)args withDict:(NSMutableDictionary*)options
{
    NSArray* keys = [args objectAtIndex:0];
    NSLog(@"Setup with stuff: %@", keys);
    NSString* project = [keys objectAtIndex:ABProjectID];
    NSString* token = [keys objectAtIndex:ABToken];
    NSString* secret = [keys objectAtIndex:ABSecretKey];
    NSString* timestamp = [keys objectAtIndex:ABTimestamp];
    
    AppBlade *blade = [AppBlade sharedManager];
    blade.appBladeProjectID = project;
    blade.appBladeProjectToken = token;
    blade.appBladeProjectSecret = secret;
    blade.appBladeProjectIssuedTimestamp = timestamp;
}

- (void)catchAndReportCrashes:(NSMutableArray *)args withDict:(NSMutableDictionary *)options
{
    NSLog(@"Catch and Report Crashes via Plugin");
    [[AppBlade sharedManager] catchAndReportCrashes];
}

- (void)checkAuthentication:(NSMutableArray *)args withDict:(NSMutableDictionary *)options
{
    NSLog(@"Check approval via Plugin");
    [[AppBlade sharedManager] checkApproval];
}

- (void)allowFeedbackReporting:(NSMutableArray *)args withDict:(NSMutableDictionary *)options
{
    NSLog(@"Allow Feedback via Plugin");
    if(null != args && [[args objectAtIndex:0] isKindOfClass:[NSString class]])
    {
        NSLog(@"Custom Feedback via Plugin");
        if([((NSString *)[args objectAtIndex:0]) isEqualToString:@"Custom"])
        [[AppBlade sharedManager] setupCustomFeedbackReporting];
    }
    else
    {
        [[AppBlade sharedManager] allowFeedbackReporting];
    }
}

- (void)showFeedbackDialog:(NSMutableArray *)args withDict:(NSMutableDictionary *)options
{
    NSLog(@"Show Feedback via Plugin");
    [[AppBlade sharedManager] showFeedbackDialogue];
}



- (void)startSession:(NSMutableArray *)args withDict:(NSMutableDictionary *)options
{
    NSLog(@"Start Session via Plugin");
    [[AppBlade sharedManager] startSession];
}

- (void)endSession:(NSMutableArray *)args withDict:(NSMutableDictionary *)options
{
    NSLog(@"End Session via Plugin");
    [[AppBlade sharedManager] endSession];
}


- (void)setCustomParameter:(NSMutableArray *)args withDict:(NSMutableDictionary *)options
{
    NSLog(@"Setting a Custom Parameter via Plugin");
    NSArray* keyAndVal = [args objectAtIndex:0];
    NSString* key = [keyAndVal objectAtIndex:0];
    NSString* key = [keyAndVal objectAtIndex:0];

    [AppBlade sharedManager] setCustomParam:<#(id)#> withValue:<#(NSString *)#>
}

- (void)clearCustomParameters:(NSMutableArray *)args withDict:(NSMutableDictionary *)options
{
    NSLog(@"Clearing all parameters via Plugin");
}


@end
