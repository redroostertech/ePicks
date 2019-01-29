//
//  UIViewController+Ext.swift
//  Gumbo
//
//  Created by Michael Westbrooks on 5/19/18.
//  Copyright © 2018 RedRooster Technologies Inc. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD
import ChameleonFramework

extension UIViewController {
    func hideNavigationBarHairline() {
        if let navController = self.navigationController {
            navController.hidesNavigationBarHairline = true
        }
    }
    func hideNavigationBar() {
        if let navController = self.navigationController {
            navController.navigationBar.isHidden = true
        }
    }
    
    func showNavigationBar() {
        if let navController = self.navigationController {
            navController.navigationBar.isHidden = false
        }
    }
    
    func clearNavigationBackButtonText() {
        if (self.navigationController != nil) {
            self.navigationItem.title = ""
        }
    }
    
    func updateNavigationBar(title: String) {
        if (self.navigationController != nil) {
            self.navigationItem.title = title
        }
    }
    
    func updateNavigationBar(withBackgroundColor bgColor: UIColor, andTintColor tintColor: UIColor) {
        if (self.navigationController != nil) {
            self.navigationController?.navigationBar.isTranslucent = false
            self.navigationController?.navigationBar.barTintColor = bgColor
            self.navigationController?.navigationBar.tintColor = tintColor
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: tintColor]
        }
    }
    
    func updateNavigationBar(title: String, andColor color: UIColor) {
        if (self.navigationController != nil) {
            self.navigationItem.title = title
        }
    }
    
    func navigateToView(withID vid: String, fromStoryboard sid: String = "Main") {
        let storyboard = UIStoryboard(name: sid, bundle: nil)
        let viewcontroller = storyboard.instantiateViewController(withIdentifier: vid)
        UIApplication.shared.keyWindow?.rootViewController = viewcontroller
    }
    
    func pushToView(withID vid: String, fromStoryboard sid: String = "Main") {
        let storyboard = UIStoryboard(name: sid, bundle: nil)
        let viewcontroller = storyboard.instantiateViewController(withIdentifier: vid)
        if (self.navigationController != nil) {
            self.navigationController!.pushViewController(viewcontroller, animated: true)
        } else {
            self.present(viewcontroller, animated: true, completion: nil)
        }
    }
    
    func pushToView(withViewController viewcontroller: UIViewController) {
        if (self.navigationController != nil) {
            self.navigationController!.pushViewController(viewcontroller, animated: true)
        } else {
            self.present(viewcontroller, animated: true, completion: nil)
        }
    }
    
    func popViewController(to vid: String? = nil, fromStoryboard sid: String? = nil){
        guard let idForViewController = vid, let idForStoryboard = sid else {
            if (self.navigationController != nil) {
                self.navigationController!.popViewController(animated: true)
            }
            return
        }
        let storyboard = UIStoryboard(name: idForStoryboard, bundle: nil)
        let viewcontroller = storyboard.instantiateViewController(withIdentifier: idForViewController)
        if (self.navigationController != nil) {
            self.navigationController!.popToViewController(viewcontroller,
                                                           animated: true)
        }
    }
    
    func dismissViewController() {
        if (self.navigationController != nil) {
            self.navigationController!.popViewController(animated: true)
        } else {
            self.dismiss(animated: true,
                         completion: nil)
        }
    }
    
    func showHUD() {
        SVProgressHUD.show()
        UIApplication.shared.beginIgnoringInteractionEvents()
        SVProgressHUD.setBackgroundColor(UIColor.orange)
        SVProgressHUD.setForegroundColor(UIColor.white)
    }
    
    func hideHUD() {
        if SVProgressHUD.isVisible() {
            SVProgressHUD.dismiss()
        }
        UIApplication.shared.endIgnoringInteractionEvents()
    }
    
    func scrollToTop(of tableView: UITableView, completion: @escaping () -> Void) {
        DispatchQueue.main.async {
            if tableView.visibleCells.count > 0 {
                tableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: true)
            }
            completion()
        }
    }
    
    func scrollToBottom(of tableView: UITableView, completion: @escaping () -> Void) {
        DispatchQueue.main.async {
            if tableView.visibleCells.count > 0 {
                if
                    let lastCell = tableView.visibleCells.last,
                    let lastRow = tableView.visibleCells.index(of: lastCell) {
                    tableView.scrollToRow(at: IndexPath(row: lastRow, section: 0), at: .bottom, animated: true)
                }
            }
            completion()
        }
    }
    
    func setBackground(_ imageName: String, onView view: UIView) {
        if let view = self.view {
            let image = UIImage(named: imageName)
            let imageView = UIImageView(frame: view.frame)
            imageView.contentMode = .scaleAspectFill
            imageView.image = image
            view.addSubview(imageView)
            view.sendSubview(toBack: imageView)
        }
    }
    
    func setBackground(_ color: UIColor, onView view: UIView) {
        if let view = self.view {
            view.backgroundColor = color
        }
    }
    
    func setBackgroundWithPrimaryGradient() {
        if let view = self.view {
            view.addPrimaryGradientToBackground()
        }
    }
    
    func setBackgroundWithSecondaryGradient() {
        if let view = self.view {
            view.addSecondaryGradientToBackground()
        }
    }
    
    func showSuccess(withMessage message: String = "", andOptionalDelay delay: TimeInterval?) {
        SVProgressHUD.showSuccess(withStatus: message)
        guard let delay = delay else {
            return
        }
        SVProgressHUD.dismiss(withDelay: delay)
    }
    
    func showError(withMessage message: String = "", andOptionalDelay delay: TimeInterval?) {
        SVProgressHUD.showError(withStatus: message)
        guard let delay = delay else {
            return
        }
        SVProgressHUD.dismiss(withDelay: delay)
    }
    
    
}
