# Socium Mobile App

A small social media app that connects studying communities together

### Folder structure

```
├── android/ - Contains build artifacts for Android
├── assets/ - Contains static files (images, videos, audios)
├── ios/ - Contains build artifacts for iOS
├── lib/ - Contains source code
    ├── login/ - Contains widgets for authentication
    ├── models/ - Contains classes of real-world objects
    ├── pages/ - Contains widgets represented as pages or screens
    ├── services/ - Contains classes controll models
    ├── widgets/ - Contains small widgets (components) for pages
    ├── firebase_options.dart/ - Contains current platform for Firebase
    ├── main.dart - Entry point (code starts here)
├── macos/ - Contain build artifacts for macOS
├── test/ - Contains code for testing
├── web/ - Contains static web files (HTML, CSS)
├── analysis_options.yaml - Contains rules for linter (flutter_lints)
├── pubspec.lock - Contains exact, locked version of dependencies
├── pubspec.yaml - Contains approximate version of dependencies
├── README.md - This documents
```

### Dependencies:

> _All of the dependencies are listed in [pubspec.yaml](pubspec.yaml).

* [cupertino_icons](https://pub.dev/packages/cupertino_icons): Default icons asset for Cupertino widgets based on Apple styled icons

* [google_fonts](https://pub.dev/packages/google_fonts): A Flutter package to use fonts from fonts.google.com

* [size_config](https://pub.dev/packages/size_config): A Flutter package to build responsive UI

* [wave](https://pub.dev/packages/wave): A Flutter package for displaying waves.

* [image_picker](https://pub.dev/packages/images_picker): A Flutter plugin for iOS and Android for picking images from the image library, and taking new pictures with the camera.

* [badges](https://pub.dev/packages/badges): A package for creating badges. Badges can be used for an additional marker for any widget, e.g. show a number of items in a shopping cart.

* [table_calendar](https://pub.dev/packages/table_calendar): Highly customizable, feature-packed calendar widget for Flutter.

* [top_modal_sheet](https://pub.dev/packages/top_modal_sheet): A simple top modal sheet implementation in pure dart.

* [chips_choice](https://pub.dev/packages/chip_choice): Lite version of smart_select package, zero dependencies, an easy way to provide a single or multiple choice chips.

* [syncfusion_flutter_sliders](https://pub.dev/packages/syncfusion_flutter_sliders): A Flutter Sliders library for creating highly customizable and UI-rich slider, range slider, and range selector widgets for filtering purposes.

* [firebase_core](https://pub.dev/packages/firebase_core): Flutter plugin for Firebase Core, enabling connecting to multiple Firebase apps.

* [animate_do](https://pub.dev/packages/animate_do): Beautiful animations inspired on Animate.css, every animation is a widget that contains default but customizable values that look attractive.

* [get](https://pub.dev/packages/get): Open screens/snackbars/dialogs without context, manage states and inject dependencies easily with GetX.

* [flutter_spinkit](https://pub.dev/packages/flutter_spinkit): A collection of loading indicators animated with flutter. Heavily inspired by @tobiasahlin's SpinKit.

* [page_transition](https://pub.dev/packages/page_transition): Flutter Page Transition Package which is the transition second page

* [animated_splash_screen](https://pub.dev/packages/animated_splash_screen): The easiest way to create your animated splash screen in a fully customizable way.

* [cloud_firestore](https://pub.dev/packages/cloud_firestore):A Flutter plugin to use the Cloud Firestore API.

* [firebase_auth](https://pub.dev/packages/firebase_auth):A Flutter plugin to use the Firebase Authentication API.

* [google_sign_in](https://pub.dev/packages/google_sign_in):Flutter plugin to google sign in

* [provider](https://pub.dev/packages/provider):A wrapper around InheritedWidget to make them easier to use and more reusable.

* [swipe_cards](https://pub.dev/packages/swipe_cards):A Flutter widget for Tinder like swipe cards. The card can be swiped right, left and up for different responses