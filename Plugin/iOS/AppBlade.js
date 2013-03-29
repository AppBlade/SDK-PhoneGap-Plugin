/**
 * AppBlade.js
 *
 * Phonegap AppBlade Instance plugin
 * Copyright (c) AppBlade 2013
 *
 */
(function () {
    var cordovaRef = window.PhoneGap || window.Cordova || window.cordova; // old to new fallbacks

    function AppBlade() {
        this.serviceName = "AppBlade"; //Keep us from making typos
    }

    //AppBlade Registration
    AppBlade.prototype.setupAppBlade = function (_project, _token, _secret, _timestamp, _onSuccess, _onError) {
        var successCallback = function (result) {
            if (typeof _onSuccess == 'function') {
                _onSuccess.apply(null, [result]);
            }
        };
        var errorCallback = function (result) {
            if (typeof _onError == 'function') {
                _onError.apply(null, [result]);
            }
        };
        return cordova.exec(successCallback, errorCallback, this.serviceName, 'setupAppBlade', [_project, _token, _secret, _timestamp]);
    };

    //Authentication Checks
    AppBlade.prototype.checkAuthentication = function (_onSuccess, _onError) {
        var successCallback = function (result) {
            if (typeof _onSuccess == 'function') {
                _onSuccess.apply(null, [result]);
            }
        };
        var errorCallback = function (result) {
            if (typeof _onError == 'function') {
                _onError.apply(null, [result]);
            }
        };
        return cordova.exec(successCallback, errorCallback, this.serviceName, 'checkAuthentication', []);
    };

    //Update Checks
    AppBlade.prototype.checkForAnonymousUpdates = function (_onSuccess, _onError) {
        var successCallback = function (result) {
            if (typeof _onSuccess == 'function') {
                _onSuccess.apply(null, [result]);
            }
        };
        var errorCallback = function (result) {
            if (typeof _onError == 'function') {
                _onError.apply(null, [result]);
            }
        };
        return cordova.exec(successCallback, errorCallback, this.serviceName, 'checkForUpdates', []);
    };

    //Crash Reporting
    AppBlade.prototype.catchAndReportCrashes = function (_onSuccess, _onError) {
        var successCallback = function (result) {
            if (typeof _onSuccess == 'function') {
                _onSuccess.apply(null, [result]);
            }
        };
        var errorCallback = function (result) {
            if (typeof _onError == 'function') {
                _onError.apply(null, [result]);
            }
        };
        return cordova.exec(successCallback, errorCallback, this.serviceName, 'catchAndReportCrashes', []);
    };


    //Feedback Reporting
    AppBlade.prototype.allowFeedbackReporting = function (_onSuccess, _onError) {
        var successCallback = function (result) {
            if (typeof _onSuccess == 'function') {
                _onSuccess.apply(null, [result]);
            }
        };
        var errorCallback = function (result) {
            if (typeof _onError == 'function') {
                _onError.apply(null, [result]);
            }
        };
        return cordova.exec(successCallback, errorCallback, this.serviceName, 'allowFeedbackReporting', []);
    };
    AppBlade.prototype.showFeedbackDialog = function (_screenshotFlag, _onSuccess, _onError) {
    	var args = [];
    	if(typeof _screenshotFlag == 'string')
    	{
	    	args = [_screenshotFlag];
    	}
    	
        var successCallback = function (result) {
            if (typeof _onSuccess == 'function') {
                _onSuccess.apply(null, [result]);
            }
        };
        var errorCallback = function (result) {
            if (typeof _onError == 'function') {
                _onError.apply(null, [result]);
            }
        };
        return cordova.exec(successCallback, errorCallback, this.serviceName, 'showFeedbackDialog', args);
    };


    //Session Logging
    AppBlade.prototype.startSession = function (successFunction, failFunction) {
        var successCallback = function (result) {
            if (typeof _onSuccess == 'function') {
                _onSuccess.apply(null, [result]);
            }
        };
        var errorCallback = function (result) {
            if (typeof _onError == 'function') {
                _onError.apply(null, [result]);
            }
        };
        return cordova.exec(successCallback, errorCallback, this.serviceName, 'startSession', []);
    };

    AppBlade.prototype.endSession = function (successFunction, failFunction) {
        var successCallback = function (result) {
            if (typeof _onSuccess == 'function') {
                _onSuccess.apply(null, [result]);
            }
        };
        var errorCallback = function (result) {
            if (typeof _onError == 'function') {
                _onError.apply(null, [result]);
            }
        };
        return cordova.exec(successCallback, errorCallback, this.serviceName, 'endSession', []);
    };


    //Custom Parameters
    AppBlade.prototype.setCustomParameter = function (key, value, successFunction, failFunction) {
        var successCallback = function (result) {
            if (typeof _onSuccess == 'function') {
                _onSuccess.apply(null, [result]);
            }
        };
        var errorCallback = function (result) {
            if (typeof _onError == 'function') {
                _onError.apply(null, [result]);
            }
        };
        return cordova.exec(successCallback, errorCallback, this.serviceName, 'setCustomParameter', [key, value]);
    };

    AppBlade.prototype.setAllCustomParameters = function (dictionary, successFunction, failFunction) {
        var successCallback = function (result) {
            if (typeof _onSuccess == 'function') {
                _onSuccess.apply(null, [result]);
            }
        };
        var errorCallback = function (result) {
            if (typeof _onError == 'function') {
                _onError.apply(null, [result]);
            }
        };
        return cordova.exec(successCallback, errorCallback, this.serviceName, 'setCustomParameters', [dictionary]);
    };

    AppBlade.prototype.clearCustomParameters = function (successFunction, failFunction) {
        var successCallback = function (result) {
            if (typeof _onSuccess == 'function') {
                _onSuccess.apply(null, [result]);
            }
        };
        var errorCallback = function (result) {
            if (typeof _onError == 'function') {
                _onError.apply(null, [result]);
            }
        };
        return cordova.exec(successCallback, errorCallback, this.serviceName, 'clearCustomParameters', []);
    };

    //Boilerplate Cordova plugin addition.
    cordova.addConstructor(function () {
        if (!window.plugins) window.plugins = {};
        window.plugins.appBlade = new AppBlade();
    });

})(window.cordova || window.Cordova);