//
//  AlertController.swift
//  UrgiDoctor
//
//  Created by Yuvraj Bharat Kale on 24/09/20.
//

import Foundation
import UIKit

 protocol alerDelegate {
    func okAction()
    func CancelAction()

}

//extension alerDelegate{
//    func okAction(){}
//    func CancelAction(){}
//}
class MBAlertController {
    
    static let sharedAlert = MBAlertController()
    private init(){
        
    }
    var delegate: alerDelegate?
    func showAlert(withTittle title:String?, message:String?,controller:UIViewController){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default) { (alert) in
            self.delegate?.okAction()
        }
        
        let Cancel = UIAlertAction(title: "Cancel", style: .default) { (alert) in
            self.delegate?.CancelAction()
        }
        alertController.addAction(ok)
        alertController.addAction(Cancel)
        DispatchQueue.main.async {
            controller.topMostViewController()?.present(alertController, animated: true, completion: nil)
        }
        
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension UIViewController {
    static func topMostViewController() -> UIViewController? {
        if #available(iOS 13.0, *) {
            let keyWindow = UIApplication.shared.windows.filter {$0.isKeyWindow}.first
            return keyWindow?.rootViewController?.topMostViewController()
        }
        
        return UIApplication.shared.keyWindow?.rootViewController?.topMostViewController()
    }
    
    func topMostViewController() -> UIViewController? {
        if let navigationController = self as? UINavigationController {
            return navigationController.topViewController?.topMostViewController()
        }
        else if let tabBarController = self as? UITabBarController {
            if let selectedViewController = tabBarController.selectedViewController {
                return selectedViewController.topMostViewController()
            }
            return tabBarController.topMostViewController()
        }
            
        else if let presentedViewController = self.presentedViewController {
            return presentedViewController.topMostViewController()
        }
        
        else {
            return self
        }
    }
}

