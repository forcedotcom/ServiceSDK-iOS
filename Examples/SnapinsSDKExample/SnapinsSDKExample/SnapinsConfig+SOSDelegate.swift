//
//  ViewController+SOSDelegate.swift
//  SnapinsSDKExample
//

import Foundation

import ServiceCore
import ServiceSOS

/**
 Adds an SOS delegate to the View Controller.
 This delegate handles events related to an SOS session.
 */
extension SnapinsConfig : SOSDelegate {

  /**
   Called when an SOS session ends.
   */
  func sos(_ sos: SOSSessionManager!, didStopWith reason: SOSStopReason,
           error: Error!) {
    
    var title = ""
    var description = ""
    
    // If there's an error...
    if (error != nil) {
      
      switch (error as NSError).code {
        
      // No agents available
      case SOSErrorCode.SOSNoAgentsAvailableError.rawValue:
        title = "SOS Session Failed"
        description = "It looks like there are no agents available. Try again later."
        
      // Insufficient network error
      case SOSErrorCode.SOSInsufficientNetworkError.rawValue:
        title = "SOS Session Failed"
        description = "Insufficient network. Check network quality and try again."
        
      // Can't create a session
      case SOSErrorCode.SOSServerSessionCreationError.rawValue:
        title = "SOS Session Failed"
        description = "Unable to create a session. Check your configuration values."
        
      // TO DO: Use SOSErrorCode to check for ALL other error conditions
      //        in order to give a more clear explanation of the error.
      default:
        title = "Session Error"
        description = "Unknown session error. \((error as NSError).code)"
      }
      
      // Else if session stopped without an error condition...
    } else {
      
      switch reason {
        
      // Handle the agent disconnect scenario
      case .agentDisconnected:
        title = "SOS Session Ended"
        description = "The agent has ended the session."
        
        // TO DO: Use SOSStopReason to check for
      //        other reasons for session ending...
      default:
        break
      }
    }
    
    // Display dialog if we have something to say...
    if (title != "") {
      
      let alert = UIAlertController(title: title,
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
