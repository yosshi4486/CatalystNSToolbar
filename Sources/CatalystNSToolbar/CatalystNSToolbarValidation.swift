//
//  CatalystNSToolbarValidation.swift
//  CatalystNSToolbar
//
//  Created by yosshi4486 on 2021/01/10.
//

#if targetEnvironment(macCatalyst)
import UIKit

/// Validation for Catalyst toolbar item.
open protocol CatalystNSToolbarItemValidation {

    /// If this method is implemented and returns false, NSToolbar will disable theItem; returning true causes theItem to be enabled.Required
    func validateToolbarItem(_ item: CatalystNSToolbarItem) -> Bool
    
}

#endif
