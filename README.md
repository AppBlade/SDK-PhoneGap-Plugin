SDK-PhoneGap-Plugin
===================

Plugin for PhoneGap that uses the AppBlade SDK.

##Installation - iOS

1. Copy `AppBlade.js` into your `www` directory.
2. Copy `AppBladePlugin.[hm]` into your Plugins folder.
3. Follow directions for [adding the AppBlade SDK to your project](http://github.com/AppBlade/AppBladeSDK).
4. Add `-all_load` to the `other linker flags` build setting for your target.
5. In your `index.html`, register for the `"deviceready"` eventListener, and call the setup method with your SDK keys in this order: project, token, secret, issued timestamp.

See the Example project included for examples using the other functions of the SDK.