//
//  UsernameCell.swift
//  ePicks
//
//  Created by Michael Westbrooks on 10/6/18.
//  Copyright © 2018 RedRooster Technologies Inc. All rights reserved.
//

import UIKit

enum FormCellType: String {
    case username = "username"
    case password = "password"
    case email = "email"
}

@IBDesignable class FormCell: UITableViewCell {

    @IBOutlet private var lblTitle: UILabel!
    @IBOutlet private var textField: UITextField!
    
    var type: FormCellType? {
        didSet {
            guard let type = self.type else {
                return
            }
            self.type = type
            self.key = type.rawValue
            switch type {
            case .email:
                self.textField.keyboardType = .emailAddress
            case .username:
                self.textField.keyboardType = .default
            case .password:
                self.textField.keyboardType = .default
                self.textField.isSecureTextEntry = true
            }
        }
    }
    
    private var key: String?
    
    public var title: String? {
        didSet {
            guard let title = self.title else {
                return
            }
            self.lblTitle.text = title
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func getValue() -> String? {
        guard let value = self.textField.text, value != "" else {
            return nil
        }
        return value
    }
    
    func getKey() -> String {
        guard let value = self.key else {
            return ""
        }
        return value
    }
    
    func getDictionary() -> [String: Any]? {
        let key = self.getKey()
        return [key : self.getValue() ]
    }
    
}
