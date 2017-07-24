//
//  ViewController.swift
//  SnapinsChatSurvey
//

import UIKit
import ServiceCore
import ServiceChat

class ViewController: UIViewController {

  // TO DO: Fill in these org configuration settings.
  // See the Snap-ins Developer's Guide for more info:
  // https://developer.salesforce.com/docs/atlas.en-us.service_sdk_ios.meta/service_sdk_ios/servicesdk_ios_dev_guide.htm
  // In production, you probably wouldn't initialize
  // your org in the UIViewController class...
  static let CHAT_POD_NAME = "d.la.<#pod_name#>.salesforce.com"
  static let CHAT_ORG_ID = "<#org_id#>"
  static let CHAT_DEPLOYMENT_ID = "<#deployment_id#>"
  static let CHAT_BUTTON_ID = "<#button_id#>"
  
  // Chat configuration instance
  var chatConfig: SCSChatConfiguration?

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Initalize the chat session
    // (See method below)
    initializeChat()
  }

  @IBAction func chatButtonTapped(_ sender: Any) {
    if (!orgConfigured()) {
      return
    }

    // Start a session with the configuration information
    SCServiceCloud.sharedInstance().chat.startSession(with: chatConfig)
  }
  
  /**
   One time configuration for Live Agent Chat.
   */
  func initializeChat() {
    if (!orgConfigured()) {
      return
    }
    
    // Get the service cloud shared instance
    let serviceCloud = SCServiceCloud.sharedInstance()
    
    // Create a configuration object for Chat
    self.chatConfig =
      SCSChatConfiguration(liveAgentPod: ViewController.CHAT_POD_NAME,
                           orgId: ViewController.CHAT_ORG_ID,
                           deploymentId: ViewController.CHAT_DEPLOYMENT_ID,
                           buttonId: ViewController.CHAT_BUTTON_ID)
    
    // Add self as a chat delegate
    // (See ViewController+ChatDelegate.swift for the implementation)
    serviceCloud.chat.add(self)
  }
  
  /**
   Checks if we've initialized the org.
   */
  func orgConfigured() -> Bool {
    
    // Check whether any of the org settings have not been configured yet...
    let snippetPrefix = "<#"
    if (ViewController.CHAT_POD_NAME.contains(snippetPrefix) ||
      ViewController.CHAT_ORG_ID.contains(snippetPrefix) ||
      ViewController.CHAT_DEPLOYMENT_ID.contains(snippetPrefix) ||
      ViewController.CHAT_BUTTON_ID.contains(snippetPrefix)) {
      
      // Show an alert
      self.showSimpleChatAlert(title: "Invalid Org Settings",
                               message: "Update your org settings in the ViewController class.")
      return false
    }
    
    return true
  }
  
}

