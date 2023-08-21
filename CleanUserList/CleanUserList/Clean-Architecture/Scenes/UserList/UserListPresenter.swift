//
//  UserListPresenter.swift
//  CleanUserList
//
//  Created by Aravind Kavin on 20/08/23.
//

protocol UserListPresenterInput {
    func presentUser(response: UserListScene.GetUser.Response)
}

protocol UserListPresenterOutput: class {
    func displayUser(viewModel: UserListScene.GetUser.ViewModel)
}

class UserListPresenter: UserListPresenterInput {
    
    weak var output: UserListPresenterOutput?
    
    // MARK: Presentation logic
    
    func presentUser(response: UserListScene.GetUser.Response)
    {
        // NOTE: Format the response from the Interactor and pass the result back to the View Controller
        
        let viewModel = UserListScene.GetUser.ViewModel(userList: response.newUser)
//
         output?.displayUser(viewModel: viewModel)
    }
    
}
