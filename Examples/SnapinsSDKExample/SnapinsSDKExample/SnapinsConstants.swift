//
//  ConfigurationSettings.swift
//  SnapinsSDKExample
//

import Foundation
import ServiceCore

/**
 Snap-ins constant values used through this app.
 */
class SnapinsConstants {

  // Community URL used by Knowledge and Case Management
  // TO DO: This variable is required if you're using Knowledge or Cases...
  static let COMMUNITY_URL = "https://<#community_prefix#>.force.com"
  
  // Knowledge Config
  // TO DO: These variables are required for Knowledge...
  static let ENABLE_KNOWLEDGE = false
  static let KNOWLEDGE_CATEGORY_GROUP = "<#category_group#>"
  static let KNOWLEDGE_ROOT_CATEGORY = "<#root_category#>"
  
  // Case Management Config
  // TO DO: These variables are required for Cases...
  static let ENABLE_CASES = false
  static let CASES_QUICK_ACTION = "NewCase"
  
  // Live Agent Chat Config
  // TO DO: These variables are required for Chat...
  static let ENABLE_CHAT = false
  static let CHAT_POD_NAME = "d.la.<#pod_name#>.salesforce.com"
  static let CHAT_ORG_ID = "<#org_id#>"
  // e.g. "00BC00000003Lqz"
  static let CHAT_DEPLOYMENT_ID = "<#deployment_id#>"
  // e.g. "0BNW0000000003F"
  static let CHAT_BUTTON_ID = "<#button_id#>"
  // e.g. "357200000009MCq"

  // SOS Config
  // TO DO: These variables are required for SOS...
  static let ENABLE_SOS = false
  static let SOS_POD_NAME = "d.la.<#pod_name#>.salesforce.com"
  static let SOS_ORG_ID = "<#org_id#>"
  // e.g. "00BC00000003Lqz"
  static let SOS_DEPLOYMENT_ID = "<#deployment_id#>"
  // e.g. "0BNW0000000003F"
  
  // Action Button Config
  // TO DO: These variables are used for the custom
  //        action button...
  static let ENABLE_CUSTOM_ACTION_BUTTONS = true
  static let CUSTOM_ACTION_NAME = "MyCustomAction"
  static let CUSTOM_ACTION_TITLE = "👾"
}
