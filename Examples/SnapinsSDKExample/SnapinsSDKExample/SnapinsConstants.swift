//
//  ConfigurationSettings.swift
//  SnapinsSDKExample
//

import Foundation
import ServiceCore

/**
 Snap-ins constant values used throughout this app.
 Update these values with your org settings.
 Be sure to set the appropriate ENABLE_ values to true.
 See the Snap-ins Developer's Guide for more info:
 https://developer.salesforce.com/docs/atlas.en-us.service_sdk_ios.meta/service_sdk_ios/servicesdk_ios_dev_guide.htm
 */
class SnapinsConstants {

  // Live Agent Chat Config
  // TO DO: These variables are required for Chat...
  static let ENABLE_CHAT = false
  static let ENABLE_PRECHAT_FIELDS = false
  static let CHAT_POD_NAME = "d.<#pod_name#>.com"
  static let CHAT_ORG_ID = "<#org_id#>"
  static let CHAT_DEPLOYMENT_ID = "<#deployment_id#>"
  static let CHAT_BUTTON_ID = "<#button_id#>"
}

