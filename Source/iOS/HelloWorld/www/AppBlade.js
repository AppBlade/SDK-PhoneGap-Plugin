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
  
AppBlade.prototype.setupAppBlade = function(project, token, secret, timestamp) {
    cordova.exec("AppBlade.setupAppBlade", [project, token, secret, timestamp]);
};


AppBlade.prototype.checkForAnonymousUpdates = function() {
    cordova.exec("AppBlade.checkforUpdates");
};
    
AppBlade.prototype.checkAuthentication = function() {
    cordova.exec("AppBlade.checkAuthentication");
};

AppBlade.prototype.catchAndReportCrashes = function() {
    cordova.exec("AppBlade.catchAndReportCrashes");
};


AppBlade.prototype.allowFeedbackReporting = function() {
    cordova.exec("AppBlade.allowFeedbackReporting");
};
AppBlade.prototype.showFeedbackDialog = function() {
    cordova.exec("AppBlade.showFeedbackDialog");
};


AppBlade.prototype.startSession = function() {
    cordova.exec("AppBlade.startSession");
};

AppBlade.prototype.endSession = function() {
    cordova.exec("AppBlade.endSession");
};



AppBlade.prototype.setCustomParameter = function(key, value) {
    cordova.exec("AppBlade.setCustomParameter", [key, value]);
};

AppBlade.prototype.setAllCustomParameters = function(dictionary) {
    cordova.exec("AppBlade.setCustomParameters", dictionary);
};

AppBlade.prototype.clearCustomParameterss = function() {
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