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

    // Add an observer to listen for chat session ended messages from ChatManager
    NotificationCenter.default.addObserver(self, selector: #selector(chatSessionCompleted), name: NSNotification.Name(rawValue: ChatManager.CHAT_SESSION_COMPLETED_NOTIFICATION), object: nil)

    // Configure chat
    ChatManager.instance.initialize()
  }
  
  @IBAction func chatButtonTapped(_ sender: Any) {
    
    // Start a chat session
    ChatManager.instance.startSession()
  }
  
  /**
   Notification handler for when the chat session completes. This method
   is called by ChatManager when a chat session successfully completes and
   it's time for us to display a survey.
   */
  @objc func chatSessionCompleted() {
    // Launch a view with the survey!
    performSegue(withIdentifier: "SurveyViewSegue", sender: self)
  }
  
  deinit {
    // Remove ourselves as an observer
    NotificationCenter.default.removeObserver(self)
  }
}

