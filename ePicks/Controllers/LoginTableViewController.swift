//
//  LoginTableViewController.swift
//  ePicks
//
//  Created by Michael Westbrooks on 10/6/18.
//  Copyright © 2018 RedRooster Technologies Inc. All rights reserved.
//

import UIKit

class LoginMiscCell: UITableViewCell {
    @IBOutlet var viewMain: UIView!
    @IBOutlet var viewMainConstant: NSLayoutConstraint!
}

class LoginTableViewController: UITableViewController {
    var firAuthenticationController = FIRAuthenticationController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "LoginMiscCell") as! LoginMiscCell
            cell.viewMain.backgroundColor = .softBlack
            cell.viewMainConstant.constant = kHeightOfScreen - 212
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "EmailCell") as! FormCell
            cell.type = FormCellType.email
            cell.title = "Email"
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PasswordCell") as! FormCell
            cell.type = FormCellType.password
            cell.title = "Password"
            return cell
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CTACell") as! FormCallToActionCell
            cell.primaryButtonTitle = "Login"
            cell.secondaryButtonTitle = "Create an Account"
            cell.primaryButtonAction = {
                self.loginAction()
            }
            cell.secondaryButtonAction = {
                self.createAnAccountAction()
            }
            return cell
        default:
            return UITableViewCell()
        }
    }
    
}

extension LoginTableViewController {
    
    func setupTable() {
        self.tableView.estimatedRowHeight = 66
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.register(UINib(nibName: "FormCell", bundle: nil), forCellReuseIdentifier: "EmailCell")
        self.tableView.register(UINib(nibName: "FormCell", bundle: nil), forCellReuseIdentifier: "PasswordCell")
        self.tableView.register(UINib(nibName: "FormCallToActionCell", bundle: nil), forCellReuseIdentifier: "CTACell")
        self.tableView.reloadData()
    }
    
    func loginAction() {
        //  Think about refactoring this out later.
        var params = [String: Any]()
        for row in 0..<self.tableView.numberOfRows(inSection: 0) {
            if let cell = self.tableView.cellForRow(at: IndexPath(row: row, section: 0)) as? FormCell {
                params[cell.getKey()] = cell.getValue()
            }
        }
        self.firAuthenticationController.beginLogin(params) {
            (success, error) in
            if let error = error {
                print(error.localizedDescription)
            } else {
                print("Login was successful")
                self.pushToView(withID: "CustomTabBarViewController")
            }
        }
    }
    
    func createAnAccountAction() {
        self.pushToView(withID: "ViewController")
    }
    
    func uploadAction() {
        print("Upload photo began")
    }

}
