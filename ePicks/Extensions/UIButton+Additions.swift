//
//  UIButton+Additions.swift
//  Gumbo
//
//  Created by Michael Westbrooks on 7/18/18.
//  Copyright © 2018 RedRooster Technologies Inc. All rights reserved.
//

import UIKit

extension UIButton {
    
    func applyPrimaryGradientStyling() {
        self.applyCornerRadius(frame.height / 2)
        self.addPrimaryGradientToBackground()
        self.setTitleWithAttributes(nil,
                                    withColor: .white)
    }
    
    func applySecondaryGradientStyling() {
        self.applyCornerRadius(frame.height / 2)
        self.addSecondaryGradientToBackground()
        self.setTitleWithAttributes(nil,
                                    withColor: .white)
    }
    
    func applyWhiteStyling() {
        self.applyCornerRadius(frame.height / 2)
        self.backgroundColor = .white
        self.setTitleWithAttributes(nil,
                                    withColor: UIColor.softBlack)
    }
    
    func setTitleWithAttributes(_ text: String?, withColor color: UIColor = UIColor.softBlack) {
        if let text = text {
            self.setTitle(text, for: .normal)
        }
        self.setTitleColor(color, for: .normal)
    }
}
