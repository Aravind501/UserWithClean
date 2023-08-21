//
//  CreateUserModels.swift
//  CleanUserList
//
//  Created by Aravind Kavin on 21/08/23.
//



struct CreateUserScene {
    
    struct createNewUser {
        
        struct Request {
            let createUser: CreateUser
        }
        
        struct Response {
            var newUser: User
        }
        
        struct ViewModel {
            let userCreated: User
    
        }
    }    
}
