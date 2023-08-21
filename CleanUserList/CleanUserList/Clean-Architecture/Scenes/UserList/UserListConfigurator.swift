//
//  UserListConfigurator.swift
//  CleanUserList
//
//  Created by Aravind Kavin on 20/08/23.
//

import UIKit

// MARK: Connect View, Interactor, and Presenter

extension UserListInteractor: UserListViewControllerOutput, UserListRouterDataSource, UserListRouterDataDestination {
}

extension UserListPresenter: UserListInteractorOutput {
    func presentUserList(response: UserListScene.GetUser.Response) {
        
    }
    
}

class UserListConfigurator {
    // MARK: Object lifecycle
    
    static let sharedInstance = UserListConfigurator()
    
    private init() {}
    
    // MARK: Configuration
    
    func configure(viewController: UserListViewController) {
        
        let presenter = UserListPresenter()
        presenter.output = viewController
        
        let interactor = UserListInteractor()
        interactor.output = presenter
        
        let router = UserListRouter(viewController: viewController, dataSource: interactor, dataDestination: interactor)
        
        viewController.output = interactor
        viewController.router = router
    }
}
