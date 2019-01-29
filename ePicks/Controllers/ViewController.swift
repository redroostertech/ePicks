//
//  ViewController.swift
//  ePicks
//
//  Created by Michael Westbrooks on 10/4/18.
//  Copyright © 2018 RedRooster Technologies Inc. All rights reserved.
//

import UIKit

class MiscCell: UITableViewCell {
    
    @IBOutlet var viewMain: UIView!
    @IBOutlet var btnUpload: UIButton!
    @IBOutlet var viewMainConstant: NSLayoutConstraint!
    
    var uploadBtnAction: (() -> Void)?
    
    @IBAction func uploadAction(_ sender: UIButton) {
        self.uploadBtnAction?()
    }
    
    override func awakeFromNib() {
        self.btnUpload.setTitleWithAttributes("+")
        self.btnUpload.addRoundCorners()
    }
}

class ViewController: UITableViewController {

    var firAuthenticationController = FIRAuthenticationController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MiscCell") as! MiscCell
            cell.viewMain.backgroundColor = .softBlack
            cell.viewMainConstant.constant = kHeightOfScreen - 280
            cell.uploadBtnAction = {
                self.uploadAction()
            }
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "UsernameCell") as! FormCell
            cell.type = FormCellType.username
            cell.title = "Create a username"
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "EmailCell") as! FormCell
            cell.type = FormCellType.email
            cell.title = "Email"
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PasswordCell") as! FormCell
            cell.type = FormCellType.password
            cell.title = "Password"
            return cell
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CTACell") as! FormCallToActionCell
            cell.primaryButtonTitle = "Create Account"
            cell.secondaryButtonTitle = "Go to Login"
            cell.primaryButtonAction = {
                self.registrationAction()
            }
            cell.secondaryButtonAction = {
                self.signInAction()
            }
            return cell
        default:
            return UITableViewCell()
        }
    }

}

extension ViewController {
    
    func setupTable() {
        self.tableView.estimatedRowHeight = 66
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.register(UINib(nibName: "FormCell", bundle: nil), forCellReuseIdentifier: "UsernameCell")
        self.tableView.register(UINib(nibName: "FormCell", bundle: nil), forCellReuseIdentifier: "EmailCell")
        self.tableView.register(UINib(nibName: "FormCell", bundle: nil), forCellReuseIdentifier: "PasswordCell")
        self.tableView.register(UINib(nibName: "FormCallToActionCell", bundle: nil), forCellReuseIdentifier: "CTACell")
        self.tableView.reloadData()
    }
    
    func registrationAction() {
        //  Think about refactoring this out later.
        var params = [String: Any]()
        for row in 0..<self.tableView.numberOfRows(inSection: 0) {
            if let cell = self.tableView.cellForRow(at: IndexPath(row: row, section: 0)) as? FormCell {
                params[cell.getKey()] = cell.getValue()
            }
        }
        
        self.firAuthenticationController.beginRegistration(params) {
            (success, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Registration was successful")
                self.pushToView(withID: "CustomTabBarViewController")
            }
        }
    }
    
    func signInAction() {
        self.pushToView(withID: "LoginTableViewController")
    }
    
    func uploadAction() {
        print("Upload photo began")
    }
}
