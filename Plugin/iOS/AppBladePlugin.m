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

- (void)setupAppBlade:(CDVInvokedUrlCommand*)command
{
    CDVPluginResult* pluginResult = nil;
    if (command.arguments != nil && [[command arguments] count] == 4) {
        NSString* project = [[command arguments] objectAtIndex:ABProjectID];
        NSString* token = [[command arguments] objectAtIndex:ABToken];
        NSString* secret = [[command arguments] objectAtIndex:ABSecretKey];
        NSString* timestamp = [[command arguments] objectAtIndex:ABTimestamp];
        
        AppBlade *blade = [AppBlade sharedManager];
        blade.appBladeProjectID = project;
        blade.appBladeProjectToken = token;
        blade.appBladeProjectSecret = secret;
        blade.appBladeProjectIssuedTimestamp = timestamp;

        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK];
    } else {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR  messageAsString:@"Incorrect number of arguments"];
    }
    
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)checkAuthentication:(CDVInvokedUrlCommand*)command
{
    [[AppBlade sharedManager] checkApproval];
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Check approval via Plugin"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
    
}

- (void)checkForUpdates:(CDVInvokedUrlCommand*)command
{
    [[AppBlade sharedManager] checkForUpdates];

    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Checking For Updates via Plugin"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];

}


- (void)catchAndReportCrashes:(CDVInvokedUrlCommand*)command
{
    [[AppBlade sharedManager] catchAndReportCrashes];

    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Catch and Report Crashes via Plugin"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)allowFeedbackReporting:(CDVInvokedUrlCommand*)command
{
    [[AppBlade sharedManager] allowFeedbackReporting];
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Catch and Report Crashes via Plugin"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)showFeedbackDialog:(CDVInvokedUrlCommand*)command
{
    [[AppBlade sharedManager] showFeedbackDialogue];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Show Feedback via Plugin"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}


- (void)startSession:(CDVInvokedUrlCommand*)command
{
    [AppBlade startSession];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Start Session via Plugin"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)endSession:(CDVInvokedUrlCommand*)command
{
    [AppBlade endSession];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"End Session via Plugin"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}



- (void)setCustomParameter:(CDVInvokedUrlCommand*)command
{
    NSString* resultMessage = @"Allow Feedback via Plugin";
    if(nil != command.arguments && [[[command arguments] objectAtIndex:0] isKindOfClass:[NSString class]])
    {
        resultMessage =  @"Custom Feedback via Plugin";
        if([((NSString *)[[command arguments] objectAtIndex:0]) isEqualToString:@"Custom"])
            [[AppBlade sharedManager] setupCustomFeedbackReporting];
    }
    else
    {
        [[AppBlade sharedManager] allowFeedbackReporting];
    }
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:resultMessage];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];

}

- (void)clearCustomParameters:(CDVInvokedUrlCommand*)command
{
    [[AppBlade sharedManager] clearAllCustomParams];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Clearing all parameters via Plugin"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}


//DEPRECATED METHODS. WILL BE REMOVED IN THE IMMEDIATE FUTURE

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
    if(nil != args && [[args objectAtIndex:0] isKindOfClass:[NSString class]])
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
    [AppBlade startSession];
}

- (void)endSession:(NSMutableArray *)args withDict:(NSMutableDictionary *)options
{
    NSLog(@"End Session via Plugin");
    [AppBlade endSession];
}


- (void)setCustomParameter:(NSMutableArray *)args withDict:(NSMutableDictionary *)options
{
    NSLog(@"Setting a Custom Parameter via Plugin");
    NSArray* keyAndVal = [args objectAtIndex:0];
    NSString* key = [keyAndVal objectAtIndex:0];
    NSString* val = [keyAndVal objectAtIndex:1];
    
    [[AppBlade sharedManager] setCustomParam:val forKey:key];
}

- (void)clearCustomParameters:(NSMutableArray *)args withDict:(NSMutableDictionary *)options
{
    NSLog(@"Clearing all parameters via Plugin");
    [[AppBlade sharedManager] clearAllCustomParams];
}


@end
