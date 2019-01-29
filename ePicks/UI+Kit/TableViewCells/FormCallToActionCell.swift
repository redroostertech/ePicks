//
//  FormCallToActionCell.swift
//  ePicks
//
//  Created by Michael Westbrooks on 10/6/18.
//  Copyright © 2018 RedRooster Technologies Inc. All rights reserved.
//

import UIKit

protocol FormDelegate {
    func primaryCallToAction()
    func secondaryCallToAction()
}

extension FormDelegate {
    func primaryCallToAction() { }
    func secondaryCallToAction() { }
}

class FormCallToActionCell: UITableViewCell {

    @IBOutlet private var btnPrimary: UIButton!
    @IBOutlet private var btnSecondary: UIButton!
    
    var delegate: FormDelegate?
    var primaryButtonAction: (() -> Void)?
    var secondaryButtonAction: (() -> Void)?
    
    var primaryButtonTitle: String? {
        didSet {
            guard let title = self.primaryButtonTitle else {
                return
            }
            self.btnPrimary.setTitleWithAttributes(title)
        }
    }
    
    var secondaryButtonTitle: String? {
        didSet {
            guard let title = self.secondaryButtonTitle else {
                return
            }
            self.btnSecondary.setTitleWithAttributes(title)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func primaryButtonAction(_ sender: UIButton) {
        self.primaryButtonAction?()
    }
    
    @IBAction func secondaryButtonAction(_ sender: UIButton) {
        self.secondaryButtonAction?()
    }
    
}
