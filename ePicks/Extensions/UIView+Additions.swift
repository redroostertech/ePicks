//
//  UIView+Additions.swift
//  Gumbo
//
//  Created by Michael Westbrooks on 7/18/18.
//  Copyright © 2018 RedRooster Technologies Inc. All rights reserved.
//

import UIKit

extension UIView {
    func addGradientLayer(using colors: [CGColor]) {
        self.clipsToBounds = true
        self.backgroundColor = .clear
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = colors
        gradientLayer.locations = [0.0, 1.0]
        guard let button = self as? UIButton else {
            self.layer.insertSublayer(gradientLayer,
                                      at: 0)
            return
        }
        button.layer.insertSublayer(gradientLayer,
                                   below: button.imageView?.layer)
        
        
    }
    
    func addRoundCorners(_ radius: CGFloat = 0.50) {
        self.clipsToBounds = true
        self.layer.cornerRadius = self.frame.height * radius
    }
    
    func applyCornerRadius(_ radius: CGFloat) {
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
    }
    
    func addPrimaryGradientToBackground() {
        self.addGradientLayer(using: UIColor.primaryGradientColors)
    }
    
    func addSecondaryGradientToBackground() {
        self.addGradientLayer(using: UIColor.secondaryGradientColors)
    }
}
