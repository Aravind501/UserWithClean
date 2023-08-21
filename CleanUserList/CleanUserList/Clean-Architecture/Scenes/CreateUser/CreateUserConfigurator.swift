//
//  CreateUserConfigurator.swift
//  CleanUserList
//
//  Created by Aravind Kavin on 21/08/23.
//

import UIKit

// MARK: Connect View, Interactor, and Presenter

extension CreateUserInteractor: CreateUserViewControllerOutput {
    
}

extension CreateUserPresenter: CreateUserInteractorOutput {
    
    func presentUserList(response: CreateUserScene.createNewUser.Response) {
        
    }
    
}

class CreateUserConfigurator {
    // MARK: Object lifecycle
    
    static let sharedInstance = CreateUserConfigurator()
    
    private init() {}
    
    // MARK: Configuration
    
    func configure(viewController: UserCreateViewController) {
        
        let presenter = CreateUserPresenter()
        presenter.output = viewController
        
        let interactor = CreateUserInteractor()
        interactor.output = presenter
        
        let router = CreateUserRouter(viewController: viewController)
        
        viewController.output = interactor
        viewController.router = router
    }
}
