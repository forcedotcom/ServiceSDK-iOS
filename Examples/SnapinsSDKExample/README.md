_This sample app demonstrates Snap-ins features. It doesn't contain production-quality code and is not meant to be used in a production app._

# SnapinsSDKExample

A simple Snap-ins SDK Hello World app that launches Knowledge, Cases, Chat, and SOS. This app also uses the action button API to create a custom button with a custom action.

## Instructions

To use this app, clone this repository, put the [required framework files](https://developer.salesforce.com/page/SnapinsMobile) in the [root directory](../../Frameworks/), and update the `SnapinsConstants` class with your org settings.

## Code Info

* [SnapinsConstants](./SnapinsSDKExample/SnapinsConstants.swift): Contains the constants used throughout this app. Update all the relevant `TO DO` items. Be sure to `ENABLE` all the features you want enabled.
* [SnapinsConfig](./SnapinsSDKExample/SnapinsConfig.swift): Configures all the enabled features.
* [SnapinsConfig+ActionManagerDelegate](./SnapinsSDKExample/SnapinsConfig%2BActionManagerDelegate.swift): Delegate that handles action manager events (for the action buttons).
* [SnapinsConfig+ChatDelegate](./SnapinsSDKExample/SnapinsConfig%2BChatDelegate.swift): Delegate for Live Agent Chat events.
* [SnapinsConfig+SOSDelegate](./SnapinsSDKExample/SnapinsConfig%2BSOSDelegate.swift): Delegate for SOS events.
* [ViewController](./SnapinsSDKExample/ViewController.swift): Launches all the Snap-ins features.
* [AppDelegate](./SnapinsSDKExample/AppDelegate.swift): Initializes the Snap-ins SDK.
