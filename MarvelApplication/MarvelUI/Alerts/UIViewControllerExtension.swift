//
//  UIViewControllerExtension.swift
//  MarvelUI
//
//  Created by Carlos Fontes on 19/03/21.
//

import Foundation


public extension UIViewController {
    
    func showAlert(withTitle title: String?, withMessage message: String?, withColor color: UIColor?, andWithStyle style: UIAlertController.Style) {
        
        let alert = UIAlertController(title: title ?? "", message: message, preferredStyle: style)
        
        let attributedString = NSAttributedString(string: alert.title ?? "", attributes: [NSAttributedString.Key.foregroundColor : color ?? .black])
        
        alert.setValue(attributedString, forKey: "attributedTitle")
        
        alert.overrideUserInterfaceStyle = .light
    
        let ok = UIAlertAction(title: "Ok", style: .default)
        alert.view.tintColor = .link
        alert.addAction(ok)
        present(alert, animated: true)
    }
}
