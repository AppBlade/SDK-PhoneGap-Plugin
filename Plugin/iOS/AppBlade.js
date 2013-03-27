/**
 * AppBlade.js
 *
 * Phonegap AppBlade Instance plugin
 * Copyright (c) AppBlade 2012
 *
 */

// --------------------------------------------------------

var AppBlade = function(){
        this.serviceName = "AppBlade";
};

// --------------------------------------------------------

//AppBlade Registration
AppBlade.prototype.setupAppBlade = function(project, token, secret, timestamp, successFunction, failFunction) {
    return cordova.exec(successFunction, failFunction, this.serviceName, "AppBlade.setupAppBlade", [project, token, secret, timestamp], successFunction);
};

//Update Checks
AppBlade.prototype.checkForAnonymousUpdates = function(successFunction, failFunction) {
    return cordova.exec(successFunction, failFunction, this.serviceName, "AppBlade.checkforUpdates", []);
};

//Authentication Checks
AppBlade.prototype.checkAuthentication = function(successFunction, failFunction) {
    return cordova.exec(successFunction, failFunction, this.serviceName, "AppBlade.checkAuthentication", []);
};

//Crash Reporting
AppBlade.prototype.catchAndReportCrashes = function(successFunction, failFunction) {
    return cordova.exec(successFunction, failFunction, this.serviceName, "AppBlade.catchAndReportCrashes", []);
};

//Feedback Reporting
AppBlade.prototype.allowFeedbackReporting = function(successFunction, failFunction) {
   return cordova.exec(successFunction, failFunction, this.serviceName, "AppBlade.allowFeedbackReporting", []);
};
AppBlade.prototype.showFeedbackDialog = function(successFunction, failFunction) {
    return cordova.exec(successFunction, failFunction, this.serviceName, "AppBlade.showFeedbackDialog", []);
};

//Session Logging
AppBlade.prototype.startSession = function(successFunction, failFunction) {
    return cordova.exec(successFunction, failFunction, this.serviceName, "AppBlade.startSession", []);
};

AppBlade.prototype.endSession = function(successFunction, failFunction) {
    return cordova.exec(successFunction, failFunction, this.serviceName, "AppBlade.endSession", []);
};


//Custom Parameters
AppBlade.prototype.setCustomParameter = function(key, value, successFunction, failFunction) {
    return cordova.exec(successFunction, failFunction, this.serviceName, "AppBlade.setCustomParameter", [key, value]);
};

AppBlade.prototype.setAllCustomParameters = function(dictionary, successFunction, failFunction) {
    return cordova.exec(successFunction, failFunction, this.serviceName, "AppBlade.setCustomParameters", [dictionary]);
};

AppBlade.prototype.clearCustomParameters = function(successFunction, failFunction) {
    return cordova.exec(successFunction, failFunction, this.serviceName, "AppBlade.clearCustomParameters", []);
};

// --------------------------------------------------------


AppBlade.install = = function(){
    if (typeof window.plugins == "undefined") window.plugins = {};
    if (typeof window.plugins.AppBlade == "undefined") window.plugins.AppBlade = new AppBlade();
    return window.plugins.AppBlade;
};

if(!window.plugins) {
    window.plugins = {};
}

if (!window.plugins.AppBlade) {
    window.plugins.AppBlade = new AppBlade();
}


// --------------------------------------------------------

cordova.addConstructor(function() {
                       if (!window.Cordova) {
                       window.Cordova = cordova;
                       };
                       
                       if(!window.plugins) window.plugins = {};
                       window.plugins.appBlade = new AppBlade();
                       });