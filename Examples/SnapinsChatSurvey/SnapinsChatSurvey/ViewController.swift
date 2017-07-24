//
//  ViewController.swift
//  SnapinsChatSurvey
//

import UIKit
import ServiceCore
import ServiceChat

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Configure chat
    ChatConfig.instance.initialize(viewController: self)
  }
  
  @IBAction func chatButtonTapped(_ sender: Any) {
    
    // Start a chat session
    ChatConfig.instance.startSession()
  }
}

