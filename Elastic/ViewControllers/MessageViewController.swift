//
//  MessageViewController.swift
//  Elastic
//
//  Created by Doan Phuc Hien on 12/6/18.
//  Copyright © 2018 HSG. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController {

    public var company: Company?
    @IBOutlet weak var tableView: UITableView!
    var messages : [Message] = []
    let cellReuseIdentifier = "messageCellReuseIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(">> viewDidLoad: \(company?.id)")
        
        setupView()
        if let companyId = company?.id {
            loadData(companyId: companyId)
        }
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
extension MessageViewController {
    
    func setupView() {
        
        //        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
    }
}

// MARK: Data
extension MessageViewController {
    
    func loadData(companyId: String) {
        
        CompanyAPI.shared.getMessages(companyId: companyId, completion: { (messages) in
            
            self.messages = messages
            print(">> getMessages: \(messages.count)")
            self.tableView.reloadData()
        }) { (code, error) in
            print("getMessages error : \(error)")
        }
        
    }
}

// MARK: UITableViewDataSource
extension MessageViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell = {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) else {
                return UITableViewCell(style: .subtitle, reuseIdentifier: cellReuseIdentifier)
            }
            return cell
        }()
        
        let message = messages[indexPath.row]
        
//        cell.textLabel?.text = message.name
//        cell.detailTextLabel?.text = company.desc
//        if let url = company.avatarUrl {
//            let imageURL = URL.init(string: url)!
//            cell.imageView?.af_setImage(withURL: imageURL, placeholderImage: UIImage.init(named: "img_placeholder_company"), imageTransition: .crossDissolve(0.3))
//        }
        
        return cell
    }
}

// MARK: UITableViewDelegate
extension MessageViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
