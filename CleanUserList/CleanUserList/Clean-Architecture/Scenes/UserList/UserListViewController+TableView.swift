//
//  UserListViewController+TableView.swift
//  CleanUserList
//
//  Created by Aravind Kavin on 20/08/23.
//

import UIKit

extension UserListViewController: UITableViewDelegate, UITableViewDataSource {

    func configureTableViewOnLoad() {
        userListTableView.register(UINib(nibName: "UserTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: cellIdentifiers.userCell)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let displayUser = users[indexPath.row]
        
        if let userCell = tableView.dequeueReusableCell(withIdentifier: cellIdentifiers.userCell) as? UserTableViewCell {
            userCell.set(user: displayUser)
            
            return userCell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
