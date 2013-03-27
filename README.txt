AppBladeSDK PhoneGap Plugin
===================
PhoneGap Plugin Version : 2.5.0
AppBlade SDK Version : 0.4.0

Make sure you have a working PhoneGap project for iOS and/or Android before adding the AppBlade plugin. 
Already having the AppBlade SDK downloaded and an AppBlade project created will help as well.
Ensure you have our latest SDK either as a binary (https://AppBlade.com/sdk/download) or as source code (https://github.com/AppBlade/SDK). 

********************
iOS Installation

1. Copy `AppBlade.js` into your `www` directory.
2. Copy `AppBladePlugin.h` and 'AppBladePlugin.m' into your Plugins folder.
3. Add the AppBlade SDK to your project. 
 3* (These directions are for adding the binary compiled files, visit https://github.com/AppBlade/SDK/wiki/Embedding-our-SDK for the source directions)
 3a. Drag the AppBlade.h and libAppBladeUniversal.a files into your PhoneGap project in Xcode. (Make sure "Copy items" is checked.)
 3b. Under "Link Binary With Libraries" In your Target's "Build Phases" Click the "+" button and add the Library named "Security.Framework" to your project.
 3c. Build the Project in Xcode to ensure that everything is running.
######4. Add -all_load to the other linker flags build setting for your target.
. Add "appblade.com" to Cordova's whitelist.
 a. Open your config.xml file and find the access element (the line `<access origin= ... />`). 
 b. If the `access` line is already `<access origin="*" />` Then nothing else needs to be done. 
 c. If the `access` is not `<access origin="*" />` Then '<access origin="https://appblade.com" subdomains="true" />' will have to be added.
. Add AppBlade to your list of plugins
 a. Open your config.xml file and find the plugins list element (the line `<plugins> ... </plugins>`). 
 b. Add `<plugin name="AppBlade" value="AppBladePlugin" onload="true" />` inside your list of plugins.
. Link your PhoneGap project to AppBlade.  
 a. Get your project keys by navigating to your appblade project and selecting "Reveal your API Keys"
 a. In your `index.html`, register for the `"deviceready"` eventListener, and call the setup method with your SDK keys in the order: UUID token, secret, issued at.
 


********************
Android Installation