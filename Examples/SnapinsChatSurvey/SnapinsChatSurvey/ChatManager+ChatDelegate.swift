//
//  ChatManager+ChatDelegate.swift
//  SnapinsChatSurvey
//

import Foundation
import ServiceCore
import ServiceChat

/**
 Adds a chat delegate to `ChatManager`.
 This delegate handles events related to a Live Agent Chat session.
 */
extension ChatManager : SCSChatDelegate {
  
  /**
   Called when a chat session ends.
   */
  func chat(_ chat: SCSChat!, didEndWith reason: SCSChatEndReason, error: Error!) {
    
    switch reason {
      
    // If the agent ended the session...
    case .agent:
      
      // Show an alert and then send a notification (handled by view controller)
      self.showSimpleChatAlert(title: "Chat Session Ended",
        message: "The agent has ended the session.",
        handler: { action in
          NotificationCenter.default.post(name: Notification.Name(rawValue: ChatManager.CHAT_SESSION_COMPLETED_NOTIFICATION), object: self)
      })

    // If the user ended the session...
    case .user:
      
      // Send a notification (handled by view controller)
      NotificationCenter.default.post(name: Notification.Name(rawValue: ChatManager.CHAT_SESSION_COMPLETED_NOTIFICATION), object: self)
      break

    // If the session ended in an error...
    case .sessionError:
      
      // If there were no available agents, then show a special message...
      if (error as NSError).code == SCSChatErrorCode.noAgentsAvailableError.rawValue {
        self.showSimpleChatAlert(title: "Chat Session Ended",
          message: "It looks like there are no agents available. Try again later.")
        
      // Otherwise, show a generic error message
      } else {
        self.showSimpleChatAlert(title: "Chat Session Ended",
                                 message: "Session error.")
      }
      break
      
    // If there was a session timeout...
    case .timeout:
      self.showSimpleChatAlert(title: "Chat Session Ended",
                               message: "Session timeout.")
      break
    }
  }
}
