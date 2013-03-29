AppBladeSDK PhoneGap Plugin
===================
PhoneGap Plugin Version : 2.5.0
AppBlade SDK Version : 0.4.0

Make sure you have a working PhoneGap project for iOS and/or Android before adding the AppBlade plugin. 
Already having the AppBlade SDK downloaded and an AppBlade project created will help as well.
Ensure you have our latest SDK either as a binary (https://AppBlade.com/sdk/download) or as source code (https://github.com/AppBlade/SDK). 

********************
iOS Installation

1. Copy `AppBlade.js` into your `www/js` directory.

2. Copy `AppBladePlugin.h` and 'AppBladePlugin.m' into your Plugins folder.

3. Add the AppBlade SDK to your project. 
 3* (These directions are for adding the binary compiled files, adding AppBlade source to a PhoneGap project is currently not supported)
 3a. Drag the AppBLadeSDK folder with the AppBlade.h and libAppBladeUniversal.a files into your PhoneGap project in Xcode. (Make sure "Copy items" is checked.)
 3b. Under "Link Binary With Libraries" In your Target's "Build Phases" Click the "+" button and add the Library named "Security.Framework" to your project.
 3c. Build the Project in Xcode to ensure that everything is running.

4. Ensure "appblade.com" is in Cordova's whitelist.
 4a. Open your config.xml file and find the access element (the line `<access origin= ... />`). 
 4b. If the `access` line is already `<access origin="*" />` Then nothing else needs to be done. ("*" means the whitelist is allowing all sources)
 4c. If the `access` is not `<access origin="*" />` Then '<access origin="https://appblade.com" subdomains="true" />' will have to be added.

5. Add AppBlade to your list of plugins
 5a. Open your config.xml file and find the plugins list element (the line `<plugins> ... </plugins>`). 
 5b. Add `<plugin name="AppBlade" value="AppBladePlugin" />` inside your list of plugins.

6. Make AppBlade.js referenceable. 
 6*. There are many ways to do this, as AppBlade.js can be treated jet like  any other js file. This is just an example: 
 6a. In your `index.html` file add `<script type="text/javascript" src="js/AppBlade.js"></script>` after the "cordova-2.5.0.js" script reference and before the "js/index.js" script reference:
        <script type="text/javascript" src="cordova-2.5.0.js"></script>
        <script type="text/javascript" src="js/AppBlade.js"></script>
        <script type="text/javascript" src="js/index.js"></script>
 
7. Link your PhoneGap project to AppBlade.com  
 7a. To use AppBlade features the app must first exist on AppBlade (click [+ New Project] after signing in). Get your project keys by navigating to your AppBlade project and selecting "Reveal your API Keys".  
 7b. In your `index.js`, underneath the `app.receivedEvent('deviceready');` call the setup method with your SDK keys in the order they appear on the AppBlade site: UUID, token, secret, issued at.
The following example sets up the app blade plugin with API keys (actual values not used), sets up the crash reporter, and sets up feedback reporting. 

    onDeviceReady: function() {
        app.receivedEvent('deviceready');
	plugins.appBlade.setupAppBlade('[UUID]','[Token]', '[Secret]', '[Issued at]');
        plugins.appBlade.catchAndReportCrashes();
        plugins.appBlade.allowFeedbackReporting();
    },


********************
Android Installation

1. Copy `AppBlade.js` into your `assets/www/js` directory.
 1a. In your Package Explorer, expand your project and expand assets > www > js
 1b. Drag `AppBlade.js` from the AppBlade Plugin Android folder into the js folder in your package explorer.
 1c. Make sure "Copy files" is selected before selecting OK.    

2. Copy `AppBladePlugin.java` into your project's package directory.
 2a. In your Package Explorer, expand your project and expand src > [your.package.identifier] 
 2b. Drag AppBladePlugin.java from the Android folder into the package in your src folder that you would like your plugin to exist inside of.    
 2c. Make sure "Copy files" is selected before selecting OK.    
 2d. In your project's copy of AppBladePlugin.java, change the package name from 'com.appblade.phonegappluginexample' to your package identifier. 

3. Add the AppBlade SDK to your project. 
 3* (These directions are for adding the app blade framework jar, adding AppBlade source to a PhoneGap project is currently not supported)
 3a. Open your `libs` folder under your project in the Package Explorer. 
 3b. Drag the included `appblade framework.jar` and 'httpmime-4.1.2.jar' into the libs folder.
 3c. Make sure "Copy files" is selected before selecting OK.    

4. Ensure "appblade.com" is in Cordova's whitelist.
 4a. Open your config.xml file and find the access element (the line `<access origin= ... />`). 
 4b. If the `access` line is already `<access origin="*" />` Then nothing else needs to be done. ("*" means the whitelist is allowing all sources)
 4c. If the `access` is not `<access origin="*" />` Then '<access origin="https://appblade.com" subdomains="true" />' will have to be added.

5. Add AppBlade to your list of plugins
 5a. On Your Package Explorer, open your project's config.xml in res > xml > config.xml  
 5b. Open the file with the text editor (right-click > Open With > Text Editor, if necessary) and locate the plugins list element (the line `<plugins> ... </plugins>`). 
 5c. Add <plugin name="AppBlade" value="[your.package.identifier].AppBladePlugin"/>  inside your list of plugins. [your.package.identifier] is where AppBladePlugin.java is stored in your project's packages.

6. Make AppBlade.js referenceable. 
 6*. There are many ways to do this, as AppBlade.js can be treated jet like  any other js file. This is just an example: 
 6a. In your `index.html` file add `<script type="text/javascript" src="js/AppBlade.js"></script>` after the "cordova-2.5.0.js" script reference and before the "js/index.js" script reference:
        <script type="text/javascript" src="cordova-2.5.0.js"></script>
        <script type="text/javascript" src="js/AppBlade.js"></script>
        <script type="text/javascript" src="js/index.js"></script>
 
7. Link your PhoneGap project to AppBlade.  
 7a. To use AppBlade features the app must first exist on AppBlade (click [+ New Project] after signing in). Get your project keys by navigating to your AppBlade project and selecting "Reveal your API Keys".
 7b. In your `index.html`, underneath the `app.receivedEvent('deviceready');` call the setup method with your SDK keys in the order they appear on the AppBlade site: UUID, token, secret, issued at.
The following example sets up the app blade plugin with API keys (actual values not used), sets up the crash reporter, and sets up feedback reporting. 

    onDeviceReady: function() {
        app.receivedEvent('deviceready');
	plugins.appBlade.setupAppBlade('[UUID]','[Token]', '[Secret]', '[Issued at]');
        plugins.appBlade.catchAndReportCrashes();
        plugins.appBlade.allowFeedbackReporting();
    },
