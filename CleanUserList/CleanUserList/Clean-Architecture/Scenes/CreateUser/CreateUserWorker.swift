//
//  CreateUserWorker.swift
//  CleanUserList
//
//  Created by Aravind Kavin on 21/08/23.
//



class CreateUserWorker {
    // MARK: Business Logic
    
    let store: UserStore
    
    init(store: UserStore) {
        self.store = store
    }
    
    func createUser(creatUser: CreateUser, completionHandler: @escaping (UserStoreResult<User>) -> Void){
        store.createUser(createUser: creatUser, completion: completionHandler)
    }
}
