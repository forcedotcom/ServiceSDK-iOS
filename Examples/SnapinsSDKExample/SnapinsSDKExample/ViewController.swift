//
//  ViewController.swift
//  SnapinsSDKExample
//

import UIKit

import ServiceCore
import ServiceKnowledge
import ServiceCases
import ServiceChat
import ServiceSOS

class ViewController: UIViewController {

  @IBOutlet weak var knowledgeButton: UIButton!
  @IBOutlet weak var casesButton: UIButton!
  @IBOutlet weak var chatButton: UIButton!
  @IBOutlet weak var sosButton: UIButton!
  @IBOutlet weak var nothingEnabledLabel: UILabel!

  var customActionButton: SCSActionButton?

  /**
   Determines whether any Snap-ins features are enabled.
   */
  let somethingIsEnabled = SnapinsConstants.ENABLE_KNOWLEDGE ||
    SnapinsConstants.ENABLE_CASES ||
    SnapinsConstants.ENABLE_CHAT ||
    SnapinsConstants.ENABLE_SOS
  
  override func viewDidLoad() {
    super.viewDidLoad()

    // Enable the relevant Snap-ins buttons and labels
    nothingEnabledLabel.isHidden = somethingIsEnabled
    knowledgeButton.isHidden = !SnapinsConstants.ENABLE_KNOWLEDGE
    casesButton.isHidden = !SnapinsConstants.ENABLE_CASES
    chatButton.isHidden = !SnapinsConstants.ENABLE_CHAT
    sosButton.isHidden = !SnapinsConstants.ENABLE_SOS
  }

  /**
   Starts Knowledge.
   */
  @IBAction func startKnowledge(_ sender: AnyObject) {
    SCServiceCloud.sharedInstance().knowledge.setInterfaceVisible(true,
                                                                  animated: true,
                                                                  completion: nil)
  }
  
  /**
   Starts Case Management.
   */
  @IBAction func startCases(_ sender: Any) {
    SCServiceCloud.sharedInstance().cases.setInterfaceVisible(true,
                                                              animated: true,
                                                              completion: nil)
  }

  /**
   Starts Live Agent Chat.
   */
  @IBAction func startChat(_ sender: Any) {
    SCServiceCloud.sharedInstance().chat.startSession(with: SnapinsConfig.instance.chatConfig)
  }

  /**
   Starts SOS.
   */
  @IBAction func startSOS(_ sender: Any) {
    SCServiceCloud.sharedInstance().sos.startSession(with: SnapinsConfig.instance.sosConfig)
  }
}

