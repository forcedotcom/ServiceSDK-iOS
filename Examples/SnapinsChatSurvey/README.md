_This sample app demonstrates Snap-ins features. It doesn't contain production-quality code and is not meant to be used in a production app._

# Snap-Ins Chat Survey

A simple Live Agent Chat app using the Snap-ins SDK that launches a chat session and then redirects the user to a survey page after the session.

## Instructions

To use this app, clone this repository, put the required framework files in the [Frameworks root directory](../../Frameworks/), and update the `ViewController` class with your org settings.

## Code Info

* [ViewController](./SnapinsChatSurvey/ViewController.swift): Configures and initializes a chat session
* [ViewController+ChatDelegate](./SnapinsChatSurvey/ViewController%2BChatDelegate.swift): Delegate for Live Agent Chat events. This implementation handles the end session event and launches the survey view.
* [SurveyViewController](./SnapinsChatSurvey/SurveyViewController.swift): By default, this class launches a web view containing a survey. You could show a local survey instead.
