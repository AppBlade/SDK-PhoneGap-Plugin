/**
 * 
 */
package com.example.cordovaandroidtestproject;


import org.apache.cordova.api.CallbackContext;
import org.apache.cordova.api.CordovaPlugin;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import com.appblade.framework.AppBlade;
import com.appblade.framework.customparams.CustomParamData;
import com.appblade.framework.customparams.CustomParamDataHelper;

/**
 * 
 * @author micheletitolo
 * @author andrew.tremblay
 */
public class AppBladePlugin extends CordovaPlugin {
    //AppBlade Registration
	public static final String SETUP="setupAppBlade";
	public static final int SETUP_UuidIndex		= 0;
	public static final int SETUP_TokenIndex	= 1;
	public static final int SETUP_SecretIndex	= 2;
	public static final int SETUP_IssuanceIndex	= 3;
	
    //Authentication Checks
	public static final String CHECKAPPROVAL="checkAuthentication";
    //Update Checks
	public static final String CHECKFORUPDATES="checkForUpdates";
    //Crash Reporting
	public static final String CATCHANDREPORTCRASHES="catchAndReportCrashes";
    //Feedback Reporting
	public static final String ALLOWFEEDBACKREPORTING ="allowFeedbackReporting";
	public static final String SHOWFEEDBACKDIALOG="showFeedbackDialog";
	public static final String SHOWFEEDBACKDIALOG_NOSCREENSHOTCHECK ="noscreenshot"; //we convert to lowercase ourselves
    //Session Logging
	public static final String STARTSESSION= "startSession";
	public static final String ENDSESSION = "endSession";
    //Custom Parameters
	public static final String SETCUSTOMPARAMETER="setCustomParameter";
	public static final String SETALLCUSTOMPARAMETERS="setCustomParameters";
	public static final String CLEARCUSTOMPARAMETERS="clearCustomParameters";

	@Override
	public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
		boolean result = true; //ever the optimist
		if (SETUP.equals(action)) {
			String uuid = args.getString(SETUP_UuidIndex);
			String token = args.getString(SETUP_TokenIndex);
			String secret = args.getString(SETUP_SecretIndex);
			String issuance = args.getString(SETUP_IssuanceIndex);
			setupAppBlade(uuid, token, secret, issuance, callbackContext);
		}
		else if (CHECKAPPROVAL.equals(action)) {
			checkAuthentication(callbackContext);
	    }
		else if (CHECKFORUPDATES.equals(action)) {
			checkForUpdates(callbackContext);
	    }
	    else if (ALLOWFEEDBACKREPORTING.equals(action)) {
	    	//do nothing since it's a valid call but no setup is required for Android
	    }
	    else if (SHOWFEEDBACKDIALOG.equals(action)) {
	    	boolean includeScreenshot = true;
	    	if(args.length() == 1)
	    	{
	    		includeScreenshot = !(SHOWFEEDBACKDIALOG_NOSCREENSHOTCHECK.equals(args.getString(0).toLowerCase()));
	    	}
			showFeedbackDialog(callbackContext, includeScreenshot);
	    }
	    else if (STARTSESSION.equals(action)) {
			startSession(callbackContext);
	    }
	    else if (ENDSESSION.equals(action)) {
			endSession(callbackContext);
	    }
	    else if (SETCUSTOMPARAMETER.equals(action)) {
			String key = args.getString(0);
			String object = args.getString(1);
			setCustomParameter(object, key, callbackContext);
	    }
	    else if (SETALLCUSTOMPARAMETERS.equals(action)) {
			JSONObject allParams = args.getJSONObject(0);
	    	setAllCustomParameters(allParams, callbackContext);
	    }
	    else if (CLEARCUSTOMPARAMETERS.equals(action)) {
	    	clearAllCustomParameters(callbackContext);
	    }
	    else { 
	    	// we have no idea what to do with the given action
	        result = false;
	    }
		
		return result;
	}

	///
	/// Private methods to simplify the entry point
	///
	private void setupAppBlade(String projectUuid, String token, String secret, String timestamp, CallbackContext callbackContext){
		AppBlade.register(this.cordova.getActivity().getApplicationContext(), token, secret, projectUuid, timestamp);
	}
		
	private void checkAuthentication(CallbackContext callbackContext){
        // PhoneGap runs on its own thread. So we need one to display an alert and do our UI on.
//		cordova.getThreadPool().execute
        AppBlade.authorize(this.cordova.getActivity());
	}
	
	private void checkForUpdates(CallbackContext callbackContext) {
		AppBlade.checkForUpdates(this.cordova.getActivity());
	}

	
	private void showFeedbackDialog(CallbackContext callbackContext, boolean includeScreenshot) {
		if(includeScreenshot){
			AppBlade.doFeedbackWithScreenshot(this.cordova.getActivity(), this.cordova.getActivity().getCurrentFocus());
		}
		else
		{
			AppBlade.doFeedback(this.cordova.getActivity());
		}
	}


	private void startSession(CallbackContext callbackContext) {
		AppBlade.startSession(this.cordova.getActivity());
	}

	private void endSession(CallbackContext callbackContext) {
		AppBlade.endSession(this.cordova.getActivity());
	}

	private void setCustomParameter(String object, String key,
			CallbackContext callbackContext) throws JSONException {
		AppBlade.setCustomParameterThrowy(this.cordova.getActivity(), key, object);
	}

	private void setAllCustomParameters(JSONObject allParams,
			CallbackContext callbackContext) {
		CustomParamDataHelper.storeCurrentCustomParams(this.cordova.getActivity(), new CustomParamData(allParams));
	}

	private void clearAllCustomParameters(CallbackContext callbackContext) {
		AppBlade.clearCustomParameters(this.cordova.getActivity());
	}

	
}
