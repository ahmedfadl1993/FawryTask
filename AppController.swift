//
//  AppController.swift
//  FawryTask
//
//  Created by Ahmed Fadl on 03/12/2021.
//

import Foundation
import UIKit

class AppController {
    
    static let shared = AppController()
    var window: UIWindow?
    
    private var rootViewController: UIViewController? {
        didSet {
            if let vc = rootViewController {
                window?.rootViewController = vc
            }
        }
    }
    
    func launch() {
        self.initializeWindow()
        self.handleAppState()
        self.window?.makeKeyAndVisible()
    }
    
    private func initializeWindow() {
        self.window = AppDelegate().window
        
        // Disable DarkMode
        if #available(iOS 13.0, *) {
            self.window?.overrideUserInterfaceStyle = .light
        }
    }
    
    func handleAppState() {
        showLoginViewController()
    }
    
    func showLoginViewController() {
        let navigationController  = LightContentBarNavigationController(rootViewController: LoginViewController.loadFromNib())
        navigationController.setNavigationBarHidden(true, animated: true)
        rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

class LightContentBarNavigationController: UINavigationController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
}

extension UIViewController {
    static func loadFromNib() -> Self {
        func instantiateFromNib<T: UIViewController>() -> T {
            return T.init(nibName: String(describing: T.self), bundle: nil)
        }

        return instantiateFromNib()
    }
}
