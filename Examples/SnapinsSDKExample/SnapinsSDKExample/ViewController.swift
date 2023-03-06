//
//  ViewController.swift
//  SnapinsSDKExample
//

import UIKit

import ServiceCore
import ServiceChat

class ViewController: UIViewController {

  @IBOutlet weak var chatButton: UIButton!
  @IBOutlet weak var nothingEnabledLabel: UILabel!

  /**
   Determines whether any Snap-ins features are enabled.
   */
  let somethingIsEnabled = SnapinsConstants.ENABLE_CHAT
  
  override func viewDidLoad() {
    super.viewDidLoad()

    // Enable the relevant Snap-ins buttons and labels
    nothingEnabledLabel.isHidden = somethingIsEnabled
    chatButton.isHidden = !SnapinsConstants.ENABLE_CHAT
  }

  /**
   Starts Live Agent Chat.
   */
  @IBAction func startChat(_ sender: Any) {
    
    ServiceCloud.shared().chatUI.showChat(with: SnapinsConfig.instance.chatConfig!,
                                          showPrechat: SnapinsConstants.ENABLE_PRECHAT_FIELDS)
    
    // Use this command instead of above if you never need to show a pre-chat form...
    // ServiceCloud.shared().chatUI.showChat(with: SnapinsConfig.instance.chatConfig!)
  }
}

