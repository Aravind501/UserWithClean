//
//  UserListInteractor.swift
//  CleanUserList
//
//  Created by Aravind Kavin on 20/08/23.
//

protocol UserListInteractorInput {
    func getUser(request: UserListScene.GetUser.Request)
}

protocol UserListInteractorOutput {
    func presentUser(response: UserListScene.GetUser.Response)
}


class UserListInteractor: UserListInteractorInput {
    
    var output: UserListInteractorOutput?
    var worker: UserListWorker?
    
    var users: [User] = []
    var selectedUser: User!
    
    // MARK: Business logic
    
    func getUser(request: UserListScene.GetUser.Request)
    {
        worker = UserListWorker(store: UserNetworkStore())
        
        worker?.getUser {(result: UserStoreResult<[User]>) -> Void in
            
            switch result {
                case .success(let user):
                self.users = user
                    let response = UserListScene.GetUser.Response(newUser: user)
                    self.output?.presentUser(response: response)
                case .failure(let error):
                    print(error)
            }
        }
        
    }
}
