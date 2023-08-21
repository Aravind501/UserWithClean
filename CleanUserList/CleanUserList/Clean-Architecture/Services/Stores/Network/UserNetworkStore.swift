//
//  UserNetworkStore.swift
//  CleanUserList
//
//  Created by Aravind Kavin on 20/08/23.
//

import Foundation
import Alamofire

class UserNetworkStore: UserStore {

    func getUser(completion: @escaping UserStoreGetUserCompletionHandler) {
                _ = Alamofire.request(UserNetworkRouter.getUser)
                    .validate()
                    .responseListObject { (response: DataResponse<[User]>) in
                        switch response.result {
                        case .success(let user):
                            completion(.success(result: user))
                        case .failure(let error):
                            completion(.failure(error: "Cannot get user \(error)"))
                        }
                }
    }
    
    func createUser(createUser: CreateUser, completion: @escaping UserStoreCreateUserCompletionHandler) {
        
                _ = Alamofire.request(UserNetworkRouter.creatUser(createUser: createUser))
                    .validate()
                    .responseCreateObject { (response: DataResponse<User>) in
                        switch response.result {
                        case .success(let user):
                            completion(.success(result: user))
                        case .failure(let error):
                            let errorMsg : NSError = error as NSError
                            completion(.failure(error: "\(errorMsg.domain)"))
                        }
                }
    }
}
