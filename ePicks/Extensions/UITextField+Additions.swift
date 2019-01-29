//
//  UITextField+Additions.swift
//  Gumbo
//
//  Created by Michael Westbrooks on 7/18/18.
//  Copyright © 2018 RedRooster Technologies Inc. All rights reserved.
//

import UIKit

extension UITextField {
    func addLeftPadding(withWidth width: CGFloat) {
        let padding = UIView(frame: CGRect(x: 0,
                                               y: 0,
                                               width: width,
                                               height: self.bounds.height))
        self.leftView = padding
        self.leftViewMode = .always
    }
    
    func addRightPadding(withWidth width: CGFloat) {
        let padding = UIView(frame: CGRect(x: 0,
                                           y: 0,
                                           width: width,
                                           height: self.bounds.height))
        self.rightView = padding
        self.rightViewMode = .always
    }
}
