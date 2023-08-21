//
//  CreateUserPresenter.swift
//  CleanUserList
//
//  Created by Aravind Kavin on 21/08/23.
//

protocol CreateUserPresenterInput {
    func presentUser()
    func presentError(errorMsg:String)
}

protocol CreateUserPresenterOutput: class {
    func displayUser()
    func displayError(errorMsg:String)
}

class CreateUserPresenter: CreateUserPresenterInput {
    
    weak var output: CreateUserPresenterOutput?
    
    // MARK: Presentation logic
    
    func presentUser()
    {
         output?.displayUser()
    }
    func presentError(errorMsg:String)
    {
        output?.displayError(errorMsg: errorMsg)
    }
    
}
