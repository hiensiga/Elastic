//
//  CompanyViewController.swift
//  Elastic
//
//  Created by Doan Phuc Hien on 12/5/18.
//  Copyright © 2018 HSG. All rights reserved.
//

import UIKit

class CompanyViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var companies : [Company]
    let cellReuseIdentifier = "companyCellReuseIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        loadData()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: Views
extension CompanyViewController {
    
    func setupView() {
        
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
    }
}

// MARK: Data
extension CompanyViewController {
    
    func loadData() {
        
    }
}

extension CompanyViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell
        
        let company = companies[indexPath.row]
        
        cell.textLabel?.text = company.name
        cell.detailTextLabel?.text = company.desc
        
        return cell
    }
    
}
