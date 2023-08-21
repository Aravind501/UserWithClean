//
//  CreateUserInteractor.swift
//  CleanUserList
//
//  Created by Aravind Kavin on 21/08/23.
//

protocol CreateUserInteractorInput {
    func createUser(createUser:CreateUser, request: CreateUserScene.createNewUser.Request)

}

protocol CreateUserInteractorOutput {
    func presentUser()
    func presentError(errorMsg:String)
}

class CreateUserInteractor: CreateUserInteractorInput {


    var output: CreateUserInteractorOutput?
    var worker: CreateUserWorker?
    
    // MARK: Business logic
    
    func createUser(createUser:CreateUser, request: CreateUserScene.createNewUser.Request) {
        worker = CreateUserWorker(store: UserNetworkStore())
        
        worker?.createUser(creatUser: createUser) {(result: UserStoreResult<User>) -> Void in
            
            switch result {
            case .success(let user):
                
                print(user)
                self.output?.presentUser()
            case .failure(let error):
                
                print(error)
                self.output?.presentError(errorMsg:error)
            }
        }
        
    }
    
}
