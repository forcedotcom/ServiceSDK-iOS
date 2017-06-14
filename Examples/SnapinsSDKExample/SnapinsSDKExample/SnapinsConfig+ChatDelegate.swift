//
//  ViewController+ SCSChatDelegate.swift
//  SnapinsSDKExample
//

import Foundation
import ServiceCore
import ServiceChat

/**
 Adds a chat delegate to the View Controller.
 This delegate handles events related to a Live Agent Chat session.
 */
extension SnapinsConfig : SCSChatDelegate {
  
  /**
   Called when a chat session ends.
   */
  func chat(_ chat: SCSChat!, didEndWith reason: SCSChatEndReason, error: Error!) {
    var description = ""
    
    // Here we'll handle the situation where the agent ends the session
    // and when there are no agents available...
    if (reason == .agent) {
      description = "The agent has ended the session."
    } else if (reason == .sessionError &&
      (error as NSError).code == SCSChatErrorCode.noAgentsAvailableError.rawValue) {
      description = "It looks like there are no agents available. Try again later."
    }
    
    if (description != "") {
      let alert = UIAlertController(title: "Chat Session Ended",
                                    message: description,
                                    preferredStyle: .alert)
      let okAction = UIAlertAction(title: "OK",
                                   style: .default,
                                   handler: nil)
      alert.addAction(okAction)


      let appDelegate = UIApplication.shared.delegate as! AppDelegate
      appDelegate.window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
  }
}
