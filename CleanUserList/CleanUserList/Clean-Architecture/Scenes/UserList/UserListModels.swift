//
//  UserListModels.swift
//  CleanUserList
//
//  Created by Aravind Kavin on 20/08/23.
//

struct UserListScene {
    
    struct GetUser {
        
        struct Request {
        
        }
        
        struct Response {
            var newUser: [User]
        }
        
        struct ViewModel {
            let userList: [User]
        }
    }
    
}
