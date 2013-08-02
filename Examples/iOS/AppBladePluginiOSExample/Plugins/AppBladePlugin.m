//
//  AppBladePlugin.m
//  HelloWorld
//
//  Created by Michele Titolo on 5/14/12.
//  Copyright (c) 2012 AppBlade. All rights reserved.
//

#import "AppBlade.h"
#import "AppBladePlugin.h"

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
        AppBlade *blade = [AppBlade sharedManager];
        [blade registerWithAppBladePlist];

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
    NSLog(@"allowFeedbackReporting");

    NSString* resultMessage = @"Allow Feedback via Plugin";
    if(nil != command.arguments && [[command arguments] count] == 1 && [[[command arguments] objectAtIndex:0] isKindOfClass:[NSString class]])
    {
        resultMessage =  @"Custom Feedback via Plugin";
        if([((NSString *)[[command arguments] objectAtIndex:0]) isEqualToString:@"Custom"])
            [[AppBlade sharedManager] setupCustomFeedbackReporting];
    }
    else
    {
        [[AppBlade sharedManager] allowFeedbackReporting];
    }
    
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Catch and Report Crashes via Plugin"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}

- (void)showFeedbackDialog:(CDVInvokedUrlCommand*)command
{
    BOOL showScreenshot = YES;
    if([[command arguments] count] == 1)
    {
        NSString *noScreenShotCheck = (NSString *)[[command arguments] objectAtIndex:0];
        showScreenshot = [[noScreenShotCheck lowercaseString] isEqualToString:@"withscreenshot"];
    }
    
    [[AppBlade sharedManager] showFeedbackDialogue:showScreenshot];
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
    CDVPluginResult* pluginResult = nil;
    if([[command arguments] count] == 2)
    {
        NSString* key = [[command arguments] objectAtIndex:0];
        NSString* val = [[command arguments] objectAtIndex:1];
        [[AppBlade sharedManager] setCustomParam:val forKey:key];
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Setting a Custom Parameter via Plugin"];
    }
    else
    {
        pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_ERROR messageAsString:@"Incorrect number of arguments"];
    }

    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];

}

- (void)clearCustomParameters:(CDVInvokedUrlCommand*)command
{
    [[AppBlade sharedManager] clearAllCustomParams];
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:@"Clearing all parameters via Plugin"];
    [self.commandDelegate sendPluginResult:pluginResult callbackId:command.callbackId];
}


@end
