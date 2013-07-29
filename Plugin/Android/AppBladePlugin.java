/**
 * 
 */
import java.util.Locale;

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
	    		includeScreenshot = !(SHOWFEEDBACKDIALOG_NOSCREENSHOTCHECK.equals(args.getString(0).toLowerCase(Locale.US)));
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
	private void setupAppBlade(final String projectUuid, final  String token, final String secret, final String timestamp, final CallbackContext callbackContext){
		cordova.getThreadPool().execute(new Runnable() {
            public void run() {
            	AppBlade.register(cordova.getActivity(), token, secret, projectUuid, timestamp);
            	callbackContext.success();
            }
        });

	}
		
	private void checkAuthentication(final CallbackContext callbackContext){
		cordova.getThreadPool().execute(new Runnable() {
            public void run() {
            	AppBlade.authorize(cordova.getActivity());
            	callbackContext.success();
            }
		});

	}
	
	private void checkForUpdates(final CallbackContext callbackContext) {
		cordova.getThreadPool().execute(new Runnable() {
            public void run() {
            	AppBlade.checkForUpdates(cordova.getActivity());
            	callbackContext.success();
            }
        });

	}

	
	private void showFeedbackDialog(final CallbackContext callbackContext, boolean includeScreenshot) {
		if(includeScreenshot)
		{
			cordova.getThreadPool().execute(new Runnable() {
	            public void run() {
	            	AppBlade.doFeedbackWithScreenshot(cordova.getActivity(), cordova.getActivity().getCurrentFocus());
	            	callbackContext.success();
	            }
	        });
		} 
		else 
		{
			cordova.getThreadPool().execute(new Runnable() {
	            public void run() {
	            	AppBlade.doFeedback(cordova.getActivity());
	            	callbackContext.success();
	            }
	        });
		}
	}


	private void startSession(final CallbackContext callbackContext) {
		cordova.getThreadPool().execute(new Runnable() {
            public void run() {
        		AppBlade.startSession(cordova.getActivity());
            	callbackContext.success();
            }
        });
	}

	private void endSession(final CallbackContext callbackContext) {
		cordova.getThreadPool().execute(new Runnable() {
            public void run() {
        		AppBlade.endSession(cordova.getActivity());
            	callbackContext.success();
            }
        });
	}

	private void setCustomParameter(final String object, final String key, final CallbackContext callbackContext) throws JSONException {
		cordova.getThreadPool().execute(new Runnable() {
            public void run() {
				try {
					AppBlade.setCustomParameterThrowy(cordova.getActivity(), key, object);
					callbackContext.success();
				} catch (JSONException e) {
					callbackContext.error(e.getLocalizedMessage());
				}
            }
        });
	}

	private void setAllCustomParameters(final JSONObject allParams, final CallbackContext callbackContext) {
		cordova.getThreadPool().execute(new Runnable() {
            public void run() {
				CustomParamDataHelper.storeCurrentCustomParams(cordova.getActivity(), new CustomParamData(allParams));
            	callbackContext.success();
		    }
		});
	}

	private void clearAllCustomParameters(final CallbackContext callbackContext) {
		cordova.getThreadPool().execute(new Runnable() {
            public void run() {
				AppBlade.clearCustomParameters(cordova.getActivity());
            	callbackContext.success();
		    }
		});
	}

}