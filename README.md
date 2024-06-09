# real_estate_app

This guide will show you how to run this Flutter app, add an API key to the Android Manifest file, and AppDelegate.swift file. Additionally, it includes a link to the app design on dribble.

# Prerequisites

Flutter SDK: Install Flutter
Android Studio or Xcode (for iOS development)


# Running the Flutter App

# Clone the repository (git clone https://github.com/Destiny-Ed/real_estate_app)

# Install dependencies

flutter pub get

# Adding API Key

You need to add it to both the Android Manifest file and the AppDelegate.swift file for iOS.

# [Android]

Open the AndroidManifest.xml file located in android/app/src/main/AndroidManifest.xml.

Add your API key within the <application> tag:

  <meta-data
            android:name="com.example.API_KEY"
            android:value="YOUR_API_KEY_HERE" />

            
# iOS
Open the AppDelegate.swift file located in ios/Runner/AppDelegate.swift.

Add your API key in the application method:


App Design

The app design can be found at the following link: (https://dribbble.com/shots/23780608-Real-Estate-App)
