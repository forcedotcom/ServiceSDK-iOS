//
//  ChatConfig.swift
//  SnapinsChatSurvey
//

import Foundation
import ServiceCore
import ServiceChat

/**
 This is a helper class that configures Snap-ins chat and launches a chat session.
 */
class ChatConfig : NSObject {
  
  // TO DO: Fill in these org configuration settings.
  // See the Snap-ins Developer's Guide for more info:
  // https://developer.salesforce.com/docs/atlas.en-us.service_sdk_ios.meta/service_sdk_ios/servicesdk_ios_dev_guide.htm
  static let CHAT_POD_NAME = "d.la.<#pod_name#>.salesforce.com"
  static let CHAT_ORG_ID = "<#org_id#>"
  static let CHAT_DEPLOYMENT_ID = "<#deployment_id#>"
  static let CHAT_BUTTON_ID = "<#button_id#>"

  
  static var configInstance: ChatConfig?
  var chatConfigSettings: SCSChatConfiguration?
  var viewController: UIViewController?
  
  /**
   Gets the singleton ChatConfig instance.
   */
  static var instance: ChatConfig {
    if (configInstance == nil) {
      configInstance = ChatConfig()
    }
    return configInstance!
  }
  
  /**
   One time configuration for Live Agent Chat.
   */
  func initialize(viewController: UIViewController) {

    // Keep view controller so that we can perform segues...
    self.viewController = viewController
    
    // Check if we configured org properly
    if (!isOrgConfigured()) {
      return
    }
    
    // Get the service cloud shared instance
    let serviceCloud = SCServiceCloud.sharedInstance()
    
    // Create a configuration object for Chat
    self.chatConfigSettings =
      SCSChatConfiguration(liveAgentPod: ChatConfig.CHAT_POD_NAME,
                           orgId: ChatConfig.CHAT_ORG_ID,
                           deploymentId: ChatConfig.CHAT_DEPLOYMENT_ID,
                           buttonId: ChatConfig.CHAT_BUTTON_ID)
    
    // Add self as a chat delegate
    // (See ViewController+ChatDelegate.swift for the implementation)
    serviceCloud.chat.add(self)
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
    SCServiceCloud.sharedInstance().chat.startSession(with: chatConfigSettings)
  }
  
  /**
   Checks if we've initialized the org.
   */
  func isOrgConfigured(showAlert: Bool = true) -> Bool {
    
    // Check whether any of the org settings have not been configured yet...
    let snippetPrefix = "<#"
    if (ChatConfig.CHAT_POD_NAME.contains(snippetPrefix) ||
      ChatConfig.CHAT_ORG_ID.contains(snippetPrefix) ||
      ChatConfig.CHAT_DEPLOYMENT_ID.contains(snippetPrefix) ||
      ChatConfig.CHAT_BUTTON_ID.contains(snippetPrefix)) {
      
      // Show an alert
      if (showAlert) {
        self.showSimpleChatAlert(title: "Invalid Org Settings",
          message: "Update your org settings in the ViewController class.")
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
   Handle deallocation of object.
   */
  deinit {
    if (isOrgConfigured(showAlert: false)) {
      // Remove ourselves as a chat delegate
      let serviceCloud = SCServiceCloud.sharedInstance()
      serviceCloud.chat.remove(self)
    }
  }
}
