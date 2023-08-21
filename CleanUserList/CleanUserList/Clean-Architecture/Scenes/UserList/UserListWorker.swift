//
//  UserListWorker.swift
//  CleanUserList
//
//  Created by Aravind Kavin on 20/08/23.
//

class UserListWorker {
    // MARK: Business Logic
    
    let store: UserStore
    
    init(store: UserStore) {
        self.store = store
    }
    func getUser(completionHandler: @escaping (UserStoreResult<[User]>) -> Void){
        store.getUser(completion: completionHandler)
    }
}

