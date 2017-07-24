//
//  ViewController+ SCSChatDelegate.swift
//  SnapinsSDKExample
//

import Foundation
import ServiceCore
import ServiceChat

/**
 Adds a chat delegate to `ViewController`.
 This delegate handles events related to a Live Agent Chat session.
 */
extension ViewController : SCSChatDelegate {
  
  /**
   Called when a chat session ends.
   */
  func chat(_ chat: SCSChat!, didEndWith reason: SCSChatEndReason, error: Error!) {
    
    switch reason {
      
    // If the agent ended the session...
    case .agent:
      
      // Show an alert and then segue to the view with the survey
      showSimpleChatAlert(title: "Chat Session Ended",
                          message: "The agent has ended the session.",
                          handler: { action in
                            self.performSegue(withIdentifier: "SurveyViewSegue", sender: self)
      })

    // If the user ended the session...
    case .user:
      // Launch a view with the survey!
      self.performSegue(withIdentifier: "SurveyViewSegue", sender: self)
      break

    // If the session ended in an error...
    case .sessionError:
      
      // If there were no available agents, then show a special message...
      if (error as NSError).code == SCSChatErrorCode.noAgentsAvailableError.rawValue {
        showSimpleChatAlert(title: "Chat Session Ended",
                            message: "It looks like there are no agents available. Try again later.")
      // Otherwise, show a generic error message
      } else {
        showSimpleChatAlert(title: "Chat Session Ended",
                            message: "Session error.")
      }
      break
      
    // If there was a session timeout...
    case .timeout:
      showSimpleChatAlert(title: "Chat Session Ended",
                          message: "Session timeout.")
      break
    }
  }
 
  /**
   Helper method that just shows an alert.
   */
  func showSimpleChatAlert(title: String, message: String, handler: ((UIAlertAction) -> Void)? = nil) {
    let alert = UIAlertController(title: title,
                                  message: message,
                                  preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK",
                                 style: .default,
                                 handler: handler)
    alert.addAction(okAction)
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    appDelegate.window?.rootViewController?.present(alert, animated: true, completion: nil)
  }
}
