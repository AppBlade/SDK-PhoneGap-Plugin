//
//  AppBladePlugin.h
//  HelloWorld
//
//  Created by Michele Titolo on 5/14/12.
//  Copyright (c) 2012 AppBlade. All rights reserved.
//

#import <Cordova/CDVPlugin.h>

@interface AppBladePlugin : CDVPlugin

- (void)setupAppBlade:(CDVInvokedUrlCommand*)command;

- (void)checkAuthentication:(CDVInvokedUrlCommand*)command;

- (void)checkForUpdates:(CDVInvokedUrlCommand*)command;

- (void)catchAndReportCrashes:(CDVInvokedUrlCommand*)command;

- (void)allowFeedbackReporting:(CDVInvokedUrlCommand*)command;
- (void)showFeedbackDialog:(CDVInvokedUrlCommand*)command;

- (void)startSession:(CDVInvokedUrlCommand*)command;
- (void)endSession:(CDVInvokedUrlCommand*)command;

- (void)setCustomParameter:(CDVInvokedUrlCommand*)command;
- (void)clearCustomParameters:(CDVInvokedUrlCommand*)command;

@end
