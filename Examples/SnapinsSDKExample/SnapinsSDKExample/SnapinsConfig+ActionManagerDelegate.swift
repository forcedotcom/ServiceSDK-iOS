//
//  ViewController+ActionManagerDelegate.swift
//  SnapinsSDKExample
//

import Foundation
import ServiceCore

/**
 Adds an action manager delegate to the View Controller.
 This delegate handles events related to the action button API.
 */
extension SnapinsConfig : SCSActionManagerDelegate {
  
    /**
     Determines which actions to show for a given controller.
     */
    func actionManager(_ actionManager: SCSActionManager,
                       actionsToShowFor controller: UIViewController?,
                       withDefaultActions defaultActions: Set<String>) -> Set<String>?
    {
        var mySet = defaultActions

        // Add our custom action button
        if (SnapinsConstants.ENABLE_CUSTOM_ACTION_BUTTONS) {
            mySet.insert(SnapinsConstants.CUSTOM_ACTION_NAME)
        }

        return mySet
    }

    /**
     Shows the button for a given action.
     */
    func actionManager(_ actionManager: SCSActionManager,
                       viewForActionItemWithName name: String) -> UIView?
    {
        // Show our custom action button
        if name == SnapinsConstants.CUSTOM_ACTION_NAME {

            // Create the button if we haven't already
            let customActionButton = SCSActionButton()
            customActionButton.setTitle(SnapinsConstants.CUSTOM_ACTION_TITLE, for: .normal)
            customActionButton.addTarget(self, action: #selector(myCustomButtonHandler), for: .touchUpInside)

            return customActionButton
        }

        return nil
    }

    /**
     Handler for the custom action.
     */
    func myCustomButtonHandler(sender: UIButton!) {
        SCServiceCloud.sharedInstance().knowledge.setInterfaceVisible(false, animated: true, completion: nil)

        let alert = UIAlertController(title: "Custom Action",
                                      message: "Here is where you can provide a custom action!",
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                                     style: .default,
                                     handler: nil)
        alert.addAction(okAction)

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController?.present(alert, animated: true, completion: nil)
    }
}
