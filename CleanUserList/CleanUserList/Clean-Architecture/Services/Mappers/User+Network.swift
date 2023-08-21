//
//  User+API.swift
//  CleanUserList
//
//  Created by Aravind Kavin on 20/08/23.
//

import Foundation
import SwiftyJSON

extension User: ResponseObjectSerializable {
    
    init?(fromJSON json: JSON) {
        let userData = json
        
        guard let email = userData["email"].string
                ,let gender = userData["gender"].string
                ,let id = userData["id"].int
                ,let status = userData["status"].string
                ,let name = userData["name"].string else {
                    
                    return nil
                }
        
        self.id = id
        self.email = email
        self.gender = gender
        self.status = status
        self.name = name
    }
}
