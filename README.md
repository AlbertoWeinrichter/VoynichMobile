# Voynich Mobile App Skeleton

A collection of good practices learnt while developing with Flutter. 

Feel free to use this code to bootstrap your own app

## Features:

- Email and password sign-in
- Google sign-in
- Facebook sign-in
- Firebase project configuration for iOS & Android
- `FirebaseAuthService` implementation
- Use [Provider package](https://pub.dev/packages/provider) for dependency injection
- Platform-aware alert dialogs for confirmation/error messages
- Fully compliant with the official Flutter `analysis_options.yaml` rules
- Bottom navigation bar with independant navigation stacks


## Running the project with Firebase

To use this project with Firebase authentication, some configuration steps are required.

- Create a new project with the Firebase console.
- Add iOS and Android apps in the Firebase project settings.
- Create a SHA-1 certificate fingerprint for Google sign-in
- then, [download and copy](https://firebase.google.com/docs/flutter/setup#configure_an_android_app) `google-services.json` into `android/app`.
- then, [download and copy](https://firebase.google.com/docs/flutter/setup#configure_an_ios_app) `GoogleService-Info.plist` into `iOS/Runner`, and add it to the Runner target in Xcode.
- Add these lines to ios/Runner/info.plist

    
    <key>CFBundleName</key>
	<string>NAME OF YOUR APP</string>

    <key>CFBundleURLTypes</key>
    <array>
        <dict>
            <key>CFBundleTypeRole</key>
            <string>Editor</string>
        			
            <key>CFBundleURLSchemes</key>
            <array>
                <string>REVERSE CLIENTE ID, FIND IT IN YOUR GOOGLE-SERVICE-Info.plist FILE</string>
                <string> "fb" + YOUR FACEBOOK APP ID (should look like fb1234567890 )</string>
            </array>
            
        </dict>
    </array>

    <key>FacebookAppID</key>
    <string>YOUR FACEBOOK APP ID</string>
    <key>FacebookDisplayName</key>
    <string>YOUR APP NAME</string>

