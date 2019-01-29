//
//  MyTeamsTableViewController.swift
//  ePicks
//
//  Created by Michael Westbrooks on 10/7/18.
//  Copyright © 2018 RedRooster Technologies Inc. All rights reserved.
//

import UIKit

class MyTeamsTableViewController: UITableViewController {

    @IBOutlet var btnCreateATeam: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTable()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func createATeamAction(_ sender: UIButton) {
        self.createATeam()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

}

extension MyTeamsTableViewController {
    func setupTable() {
        self.tableView.estimatedRowHeight = 66
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.reloadData()
    }
    
    func createATeam() {
        print("Creating a team")
    }
}
