//
//  CatalystNSToolbarItem.swift
//  CatalystNSToolbar
//
//  Created by yosshi4486 on 2021/01/10.
//

#if targetEnvironment(macCatalyst)
import UIKit

/// A specialized toolbar item for Catalyst.
class CatalystNSToolbarItem: NSToolbarItem {

    /// If the target is not nil, send message to it, otherwise start to seach validation object from responder chain.
    override func validate() {

        if let validation = target as? CatalystNSToolbarItemValidation {
            isEnabled = validation.validateToolbarItem(self)
            return
        }

        guard let catalystToolbar = toolbar as? CatalystNSToolbar else {
            super.validate()
            return
        }

        var responder: UIResponder? = catalystToolbar.startingPointOfSearchingResponderChain

        // Find a object which adopt CatalystToolbarItemValidation.
        while responder != nil {
            if let validation = responder as? CatalystNSToolbarItemValidation {
                isEnabled = validation.validateToolbarItem(self)
                return
            }
            responder = responder?.next
        }

        super.validate()
    }

}

#endif
