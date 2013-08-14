PhoneGap Plugin for the AppBlade SDK
=================== 
*Phonegap 2.5 - 3.0*


###Current platforms supported:
 * iOS 
  * Deployment target iOS 5.0 
 * Android 
  * Minimum Android SDK Version 9 
  * Target Android SDK Version 17

#Before You Install

It would help if you have already signed up with [AppBlade](https://appblade.com) to get your credentials. [Sign up here!](https://appblade.com/users/new)

Also make sure you have Xcode, and Eclipse installed (plugman as well if you want to add the plugin automagically). 

 * Xcode Version 4.6.3 (4H1503)
 * Eclipse SDK Version: 3.7.2
 * plugman version 0.10.0

## Plugman Installation

coming soon

##Manual Installation - iOS

1. Copy `AppBlade.js` from into your `www` directory.
2. Copy `AppBladePlugin.[hm]` into your Plugins folder.
3. Follow directions for [adding plugins to your iOS project](http://wiki.phonegap.com/w/page/43708792/How%20to%20Install%20a%20PhoneGap%20Plugin%20for%20iOS).
3. Follow directions for [adding the AppBlade SDK to your project](http://github.com/AppBlade/SDK).
4. Add `-all_load` to the `other linker flags` build setting for your target.
5. In your `index.html`, register for the `"deviceready"` eventListener, and call the setup method with your SDK keys in this order: project, token, secret, issued timestamp.

See the Example project included for examples using the other functions of the SDK.

##Manual Installation - Android

1. Copy `AppBlade.js` into your `www` directory.
2. Add `AppBladePlugin.java` to your project.
3. Follow directions for [adding plugins to your Android project](http://wiki.phonegap.com/w/page/43708611/How%20to%20Install%20a%20PhoneGap%20Plugin%20for%20Android).
3. Follow directions for [adding the AppBlade SDK to your project](http://github.com/AppBlade/SDK), but do not do the last 2 steps where you edit your main activity file.
3. In your `index.html`, register for the `"deviceready"` eventListener, and call the setup method with your SDK keys in this order: project, token, secret, issued timestamp.

See the Example project included for examples using the other functions of the SDK.


##Resources:
###[AppBlade.com](https://appblade.com/)
###[AppBlade Support](support.appblade.com/)
###[License and Terms](https://appblade.com/terms_of_use)