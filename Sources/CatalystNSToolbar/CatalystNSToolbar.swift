//
//  CatalystNSToolbar.swift
//  CatalystNSToolbar
//
//  Created by yosshi4486 on 2021/01/10.
//

#if targetEnvironment(macCatalyst)
import UIKit

/// A specialized toolbar for Mac Catalyst.
class CatalystNSToolbar: NSToolbar {

    /// The UIResponder object which is staring point of searching responder chain.
    ///
    /// In AppKit, ToolbarItem use `validateToolbarItem(_:)` to validate itself, but, it can not be used in UIKit.
    /// This API supports the lack of that validation.
    ///
    /// Please use like bellows:
    ///
    ///     func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    ///
    ///        \#if targetEnvironment(macCatalyst)
    ///        guard let windowScene = scene as? UIWindowScene else { return }
    ///
    ///        let toolbar = CatalystToolbar(identifier: "main")
    ///        toolbar.delegate = toolbarDelegate
    ///        toolbar.displayMode = .iconOnly
    ///        toolbar.startingPointOfSearchingResponderChain = topViewController // you want to start with.
    ///
    ///        if let titlebar = windowScene.titlebar {
    ///            titlebar.toolbar = toolbar
    ///        }
    ///        \#endif
    ///
    ///     }
    ///
    var startingPointOfSearchingResponderChain: UIResponder?

}

#endif
