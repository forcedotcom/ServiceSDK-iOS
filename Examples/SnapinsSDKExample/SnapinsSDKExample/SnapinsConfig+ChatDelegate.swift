//
//  ViewController+ SCSChatDelegate.swift
//  SnapinsSDKExample
//

import Foundation
import ServiceCore
import ServiceChat

/**
 Adds a chat delegate to `SnapinsConfig`.
 This delegate handles events related to a Live Agent Chat session.
 */
extension SnapinsConfig : SCSChatSessionDelegate {
    /**
     Called when a chat session ends.
     */
    func session(_ session: SCSChatSession!, didEnd endEvent: SCSChatSessionEndEvent!) {
        
        var description = ""
        
        // Here we'll handle the situation where the agent ends the session
        // and when there are no agents available...
        switch (endEvent.reason) {
        case .agent:
            description = "The agent ended the session."
        case .noAgentsAvailable:
            description = "It looks like there are no agents available. Try again later."
        default:
            break
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
    
    /**
     Called when an error occurs.
     */
    func session(_ session: SCSChatSession!, didError error: Error!, fatal: Bool) {
        // TO DO: Handle error conditions
    }

}
