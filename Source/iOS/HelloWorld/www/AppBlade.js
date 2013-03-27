/**
 * AppBlade.js
 *  
 * Phonegap AppBlade Instance plugin
 * Copyright (c) AppBlade 2012
 *
 */
  
// --------------------------------------------------------
  
var AppBlade = function(){};

// --------------------------------------------------------
  
//AppBlade Registration
AppBlade.prototype.setupAppBlade = function(project, token, secret, timestamp) {
    cordova.exec("AppBlade.setupAppBlade", [project, token, secret, timestamp]);
};

//Update Checks
AppBlade.prototype.checkForAnonymousUpdates = function() {
    cordova.exec("AppBlade.checkforUpdates");
};
    
//Authentication Checks
AppBlade.prototype.checkAuthentication = function() {
    cordova.exec("AppBlade.checkAuthentication");
};

//Crash Reporting
AppBlade.prototype.catchAndReportCrashes = function() {
    cordova.exec("AppBlade.catchAndReportCrashes");
};

//Feedback Reporting
AppBlade.prototype.allowFeedbackReporting = function() {
    cordova.exec("AppBlade.allowFeedbackReporting");
};
AppBlade.prototype.showFeedbackDialog = function() {
    cordova.exec("AppBlade.showFeedbackDialog");
};

//Session Logging
AppBlade.prototype.startSession = function() {
    cordova.exec("AppBlade.startSession");
};

AppBlade.prototype.endSession = function() {
    cordova.exec("AppBlade.endSession");
};


//Custom Parameters
AppBlade.prototype.setCustomParameter = function(key, value) {
    cordova.exec("AppBlade.setCustomParameter", [key, value]);
};

AppBlade.prototype.setAllCustomParameters = function(dictionary) {
    cordova.exec("AppBlade.setCustomParameters", dictionary);
};

AppBlade.prototype.clearCustomParameters = function() {
    cordova.exec("AppBlade.clearCustomParameters");
};




// --------------------------------------------------------

cordova.addConstructor(function() {
    if (!window.Cordova) {
    window.Cordova = cordova;
    };
                       
    if(!window.plugins) window.plugins = {};
    window.plugins.appBlade = new AppBlade();
});