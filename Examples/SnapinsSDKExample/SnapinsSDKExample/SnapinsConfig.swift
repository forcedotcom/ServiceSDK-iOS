//
//  SnapinsConfig.swift
//  SnapinsSDKExample
//

import Foundation
import ServiceCore
import ServiceChat

/**
 This is a helper class that configures all the features for Snap-ins.
 */
class SnapinsConfig : NSObject {
    
    private static var config: SnapinsConfig?
    
    var chatConfig: SCSChatConfiguration?

    /**
     Gets the singleton SnapinsConfig instance.
     */
    static var instance: SnapinsConfig {
        if (config == nil) {
            config = SnapinsConfig()
        }
        return config!
    }
    
    /**
     One time setup for the Snapins configuration.
     This is called from the AppDelegate.
     */
    func initialize() {
        initializeChat()
    }

    /**
     One time configuration for Chat.
     */
    func initializeChat() {
        let serviceCloud = ServiceCloud.shared()
        
        if SnapinsConstants.ENABLE_CHAT {
            
            // Create a configuration object for Chat
            chatConfig = SCSChatConfiguration(liveAgentPod: SnapinsConstants.CHAT_POD_NAME,
                                              orgId: SnapinsConstants.CHAT_ORG_ID,
                                              deploymentId: SnapinsConstants.CHAT_DEPLOYMENT_ID,
                                              buttonId: SnapinsConstants.CHAT_BUTTON_ID)
            
            // Add support for pre-chat fields
            if (SnapinsConstants.ENABLE_PRECHAT_FIELDS) {
                configurePrechat(config: chatConfig)
            }
            
            // Add self as a chat delegate
            serviceCloud.chatCore.add(delegate: self)
        }
    }
    
    /**
     Configures pre-chat data for Chat.
     */
    func configurePrechat(config: SCSChatConfiguration?) {
        
        // Create some basic pre-chat fields (with user input)
        let firstNameField = SCSPrechatTextInputObject(label: "First Name")
        firstNameField!.isRequired = true
        let lastNameField = SCSPrechatTextInputObject(label: "Last Name")
        lastNameField!.isRequired = true
        let emailField = SCSPrechatTextInputObject(label: "Email")
        emailField!.isRequired = true
        emailField!.keyboardType = .emailAddress
        emailField!.autocorrectionType = .no
        
        // Create a pre-chat field without user input
        // (This illustrates a good way to directly send data to your org.)
        let subjectField = SCSPrechatObject(label: "Subject", value: "Chat case created by app")
        
        // Update config object with the pre-chat fields
        config?.prechatFields =
            [firstNameField, lastNameField, emailField, subjectField] as? [SCSPrechatObject]

        // Create an entity mapping for a Contact record type
        // (All this entity stuff is only required if you
        // want to map transcript fields to other Salesforce records.)
        let contactEntity = SCSPrechatEntity(entityName: "Contact")
        contactEntity.saveToTranscript = "Contact"
        contactEntity.linkToEntityName = "Case"
        contactEntity.linkToEntityField = "ContactId"
        
        // Add some field mappings to our Contact record
        let firstNameEntityField = SCSPrechatEntityField(fieldName: "FirstName", label: "First Name")
        firstNameEntityField.doFind = true
        firstNameEntityField.isExactMatch = true
        firstNameEntityField.doCreate = true
        contactEntity.entityFieldsMaps.add(firstNameEntityField)
        let lastNameEntityField = SCSPrechatEntityField(fieldName: "LastName", label: "Last Name")
        lastNameEntityField.doFind = true
        lastNameEntityField.isExactMatch = true
        lastNameEntityField.doCreate = true
        contactEntity.entityFieldsMaps.add(lastNameEntityField)
        let emailEntityField = SCSPrechatEntityField(fieldName: "Email", label: "Email")
        emailEntityField.doFind = true
        emailEntityField.isExactMatch = true
        emailEntityField.doCreate = true
        contactEntity.entityFieldsMaps.add(emailEntityField)
        
        // Create an entity mapping for a Case record type
        let caseEntity = SCSPrechatEntity(entityName: "Case")
        caseEntity.saveToTranscript = "Case"
        caseEntity.showOnCreate = true
        
        // Add one field mappings to our Case record
        let subjectEntityField = SCSPrechatEntityField(fieldName: "Subject", label: "Subject")
        subjectEntityField.doCreate = true
        caseEntity.entityFieldsMaps.add(subjectEntityField)
        
        // Update config object with the entity mappings
        // (This is only required if you want to map transcript
        // fields to other Salesforce records.)
        config?.prechatEntities = [contactEntity, caseEntity]
    }
}
