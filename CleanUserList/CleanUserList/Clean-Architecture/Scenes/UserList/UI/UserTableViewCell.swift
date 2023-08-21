//
//  UserTableViewCell.swift
//  CleanUserList
//
//  Created by Aravind Kavin on 20/08/23.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userEmail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
 
    func set(user: User) {
        self.userName.text = user.name
        self.userEmail.text = user.email
        
    }
}
