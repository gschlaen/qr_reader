# qr_reader
## Getting Started

For the application to work:

Get an API key at Google Developers Console.
Choose the project that you want to enable Google Maps on.
Select the navigation menu and then select "Google Maps".
Select "APIs" under the Google Maps menu.
To enable Google Maps for Android, select "Maps SDK for Android" in the "Additional APIs" section, then select "ENABLE".
To enable Google Maps for iOS, select "Maps SDK for iOS" in the "Additional APIs" section, then select "ENABLE".
Make sure the APIs you enabled are under the "Enabled APIs" section.

Android
Specify your API key in the application manifest android/app/src/main/AndroidManifest.xml:
<manifest ...
  <application ...
    <meta-data android:name="com.google.android.geo.API_KEY"
               android:value="YOUR KEY HERE"/>

iOS
Or in your swift code, specify your API key in the application delegate ios/Runner/AppDelegate.swift:
import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GMSServices.provideAPIKey("YOUR KEY HERE")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
