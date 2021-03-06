//
//  CompanyViewController.swift
//  Elastic
//
//  Created by Doan Phuc Hien on 12/5/18.
//  Copyright © 2018 HSG. All rights reserved.
//

import UIKit
import AlamofireImage
import ESPullToRefresh

class CompanyViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var companies : [Company] = []
    let cellReuseIdentifier = "companyCellReuseIdentifier"
    let showMessageSegueIdentifier = "ShowMessageSegue"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        loadData()
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let selectedPath = tableView.indexPathForSelectedRow else { return }
        if segue.identifier == showMessageSegueIdentifier
        {
            if let destinationVC = segue.destination as? MessageViewController {
                let company = self.companies[selectedPath.row]
                destinationVC.company = company
            }
        }
    }
}

// MARK: Views
extension CompanyViewController {
    
    func setupView() {
        
//        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        setupTableView()
    }
    
    func setupTableView() {
        self.tableView.es.addPullToRefresh {
            [unowned self] in
            
            self.refreshData()
        }
    }
}

// MARK: Data
extension CompanyViewController {
    
    func refreshData() {
        CompanyAPI.shared.getCompanies(completion: { (companies) in
            
            self.companies = companies
            self.tableView.es.stopPullToRefresh(ignoreDate: true)
            self.tableView.reloadData()
        }) { (code, error) in
            print("getCompanies error : \(error)")
            self.tableView.es.stopPullToRefresh(ignoreDate: true)
        }
    }
    
    func loadData() {
        
        CompanyAPI.shared.getCompanies(completion: { (companies) in
            
            self.companies = companies
            self.tableView.reloadData()
        }) { (code, error) in
            print("getCompanies error : \(error)")
        }
    }
}

extension CompanyViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return companies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) else {
                return UITableViewCell(style: .subtitle, reuseIdentifier: cellReuseIdentifier)
            }
            return cell
        }()
        
        let company = companies[indexPath.row]
        
        cell.textLabel?.text = company.name
        cell.detailTextLabel?.text = company.desc
        if let url = company.avatarUrl {
            let imageURL = URL.init(string: url)!
            cell.imageView?.af_setImage(withURL: imageURL, placeholderImage: UIImage.init(named: "img_placeholder_company"), imageTransition: .crossDissolve(0.3))
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: showMessageSegueIdentifier, sender: nil)
    }
}
