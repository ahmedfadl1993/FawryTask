//
//  Alertable.swift
//  FawryTask
//
//  Created by Ahmed Fadl on 04/12/2021.
//

import Foundation
import UIKit

public class AlertBuilderDefault {
    
    private var alertController: UIAlertController
    
    public init(title: String? = nil, message: String? = nil, preferredStyle: UIAlertController.Style) {
        alertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
    }
    
    public func setPopoverPresentationProperties(
        sourceView: UIView? = nil,
        sourceRect: CGRect? = nil,
        barButtonItem: UIBarButtonItem? = nil,
        permittedArrowDirections: UIPopoverArrowDirection? = nil) -> Self {

        if let poc = alertController.popoverPresentationController {
            if let view = sourceView {
                poc.sourceView = view
            }
            if let rect = sourceRect {
                poc.sourceRect = rect
            }
            if let item = barButtonItem {
                poc.barButtonItem = item
            }
            if let directions = permittedArrowDirections {
                poc.permittedArrowDirections = directions
            }
        }
        return self
    }

    public func addAction(title: String = "",
                          style: UIAlertAction.Style = .default,
                          tintColor: UIColor = .systemBlue,
                          handler: (() -> Void)? = { }) -> Self {
        alertController.addAction(UIAlertAction(title: title, style: style, handler: { _ in handler?() }))
        alertController.view.tintColor = tintColor
        return self
    }

    public func build() {
        alertController.show()
    }
}

extension UIAlertController {
     func show(animated: Bool = true, completionHandler: (() -> Void)? = nil) {
        guard let rootVC = UIApplication.shared.keyWindow?.rootViewController else {
            return
        }
        var forefrontVC = rootVC
        while let presentedVC = forefrontVC.presentedViewController {
            forefrontVC = presentedVC
        }

        if !(forefrontVC is UIAlertController) {
            forefrontVC.present(self, animated: animated, completion: completionHandler)
        }
    }
}

enum AlertButton {
    case ok(handler: (() -> Void)? = nil)
    case cancel(handler: (() -> Void)? = nil)
    case custom(title: String?, style: UIAlertAction.Style = .default, handler: (() -> Void)? = nil)
}
protocol AlertShowing {
    func showAlert(style: UIAlertController.Style,
                   title: String?, message: String?,
                   tintColor: UIColor, actions: AlertButton...)
    
}

extension AlertShowing {
    func showAlert(style: UIAlertController.Style, title: String?, message: String?, tintColor: UIColor, actions: AlertButton...) {
        var alertBuilder = AlertBuilderDefault(title: title, message: message, preferredStyle: style)
        actions.forEach { (action) in
            switch action {
            case .ok(let handler):
                alertBuilder = alertBuilder.addAction(title: "OK", style: .default, handler: handler)
            case .cancel(let handler):
                alertBuilder = alertBuilder.addAction(title: "Cancel", style: .cancel, tintColor: tintColor, handler: handler)
            case let .custom(title, style, handler):
                alertBuilder = alertBuilder.addAction(title: title ?? "", style: style, tintColor: tintColor, handler: handler)
            }
        }
        alertBuilder.build()
    }
    
    func showAlert(style: UIAlertController.Style, title: String?, message: String?, tintColor: UIColor, actions: [AlertButton]) {
        var alertBuilder = AlertBuilderDefault(title: title, message: message, preferredStyle: style)
        actions.forEach { (action) in
            switch action {
            case .ok(let handler):
                alertBuilder = alertBuilder.addAction(title: "OK", style: .default, handler: handler)
            case .cancel(let handler):
                alertBuilder = alertBuilder.addAction(title: "Cancel", style: .cancel, tintColor: tintColor, handler: handler)
            case let .custom(title, style, handler):
                alertBuilder = alertBuilder.addAction(title: title ?? "", style: style, tintColor: tintColor, handler: handler)
            }
        }
        alertBuilder.build()
    }
}

extension UIView: AlertShowing {}
extension UIViewController: AlertShowing {}
