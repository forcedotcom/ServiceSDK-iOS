//
//  ChatManager.swift
//  SnapinsChatSurvey
//

import Foundation
import ServiceCore
import ServiceChat

/**
 This is a helper class that configures Snap-ins chat and launches a chat session.
 */
class ChatManager : NSObject {
  
  // TO DO: Fill in these org configuration settings.
  // See the Snap-ins Developer's Guide for more info:
  // https://developer.salesforce.com/docs/atlas.en-us.service_sdk_ios.meta/service_sdk_ios/servicesdk_ios_dev_guide.htm
  static let CHAT_POD_NAME = "d.la.<#pod_name#>.salesforce.com"
  static let CHAT_ORG_ID = "<#org_id#>"
  static let CHAT_DEPLOYMENT_ID = "<#deployment_id#>"
  static let CHAT_BUTTON_ID = "<#button_id#>"
  
  /**
   Key for the notification sent when a chat session successfully ends.
   (Currently used by ViewController to show survey.)
   */
  static let CHAT_SESSION_COMPLETED_NOTIFICATION = "com.salesforce.snapinssdk.chatCompletedKey"

  /**
   Static instance of the chat manager.
   */
  static var chatInstance: ChatManager?
  
  /**
   Chat config object.
   */
  var chatConfig: SCSChatConfiguration?
  
  /**
   Gets the singleton ChatManager instance.
   */
  static var instance: ChatManager {
    if (chatInstance == nil) {
      chatInstance = ChatManager()
    }
    return chatInstance!
  }
  
  /**
   Configures chat.
   */
  func initialize() {

    // Check if we configured the org properly
    if (!isOrgConfigured()) {
      return
    }
    
    // Get the service cloud shared instance
    let serviceCloud = SCServiceCloud.sharedInstance()
    
    // Create a configuration object for chat
    self.chatConfig =
      SCSChatConfiguration(liveAgentPod: ChatManager.CHAT_POD_NAME,
                           orgId: ChatManager.CHAT_ORG_ID,
                           deploymentId: ChatManager.CHAT_DEPLOYMENT_ID,
                           buttonId: ChatManager.CHAT_BUTTON_ID)
    
    // Add self as a chat delegate
    // (See ChatManager+ChatDelegate.swift for the implementation)
    serviceCloud.chat.add(self)
  }
  
  /**
   Unsubscribes as chat delegate.
   */
  func uninitialize() {
    if (isOrgConfigured(showAlert: false)) {
      // Remove ourselves as a chat delegate
      SCServiceCloud.sharedInstance().chat.remove(self)
    }
  }
  
  /**
   Starts a chat session.
   */
  func startSession() {
    // Check if we configured org properly
    if (!isOrgConfigured()) {
      return
    }

    // Start a session with the configuration information
    SCServiceCloud.sharedInstance().chat.startSession(with: chatConfig)
  }
  
  /**
   Checks if we've initialized the org.
   */
  func isOrgConfigured(showAlert: Bool = true) -> Bool {
    
    let snippetPrefix = "<#"

    // Check whether any of the org settings have not been configured yet...
    if (ChatManager.CHAT_POD_NAME.contains(snippetPrefix) ||
        ChatManager.CHAT_ORG_ID.contains(snippetPrefix) ||
        ChatManager.CHAT_DEPLOYMENT_ID.contains(snippetPrefix) ||
        ChatManager.CHAT_BUTTON_ID.contains(snippetPrefix)) {
      
      // Show an alert
      if (showAlert) {
        self.showSimpleChatAlert(title: "Invalid Org Settings",
          message: "Update your org settings in the ChatManager class.")
      }
      
      return false
    }
    
    return true
  }
  
  /**
   Helper method that just shows an alert.
   */
  func showSimpleChatAlert(title: String,
                           message: String,
                           handler: ((UIAlertAction) -> Void)? = nil) {
    
    let alert = UIAlertController(title: title,
                                  message: message,
                                  preferredStyle: .alert)
    let okAction = UIAlertAction(title: "OK",
                                 style: .default,
                                 handler: handler)
    alert.addAction(okAction)
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    appDelegate.window?.rootViewController?.present(alert,
                                                    animated: true,
                                                    completion: nil)
  }

  /**
   Handles deallocation of object.
   */
  deinit {
    uninitialize()
  }
}
