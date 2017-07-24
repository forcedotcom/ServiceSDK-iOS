//
//  WebViewController.swift
//  SnapinsChatSurvey
//

import UIKit

class SurveyViewController: UIViewController {
  
  @IBOutlet weak var webView: UIWebView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // TO DO: If you want to show a web-based survey, here is where you
    // would launch the web page for your survey. Update the URL accordingly.
    // Alternatively, you can remove the UIWebView entirely and display a
    // local survey.
    let url = URL(string: "https://github.com/forcedotcom/ServiceSDK-iOS/blob/master/Examples/SnapinsChatSurvey/SurveyPlaceholderPage.md#survey-placeholder")
    
    if (url != nil) {
      let urlRequest = URLRequest(url: url!)
      webView.loadRequest(urlRequest)
    }
  }
}
