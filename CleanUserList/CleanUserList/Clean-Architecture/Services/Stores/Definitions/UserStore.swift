//
//  UserStore.swift
//  CleanUserList
//
//  Created by Aravind Kavin on 20/08/23.
//

protocol UserStore {
    func getUser(completion: @escaping UserStoreGetUserCompletionHandler)
    func createUser(createUser: CreateUser, completion: @escaping UserStoreCreateUserCompletionHandler)
}

typealias UserStoreGetUserCompletionHandler = (UserStoreResult<[User]>) -> Void
typealias UserStoreCreateUserCompletionHandler = (UserStoreResult<User>) -> Void

enum UserStoreResult<U> {
    case success(result: U)
    case failure(error: String)
}
