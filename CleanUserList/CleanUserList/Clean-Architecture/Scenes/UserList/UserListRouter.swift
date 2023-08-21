//
//  UserListRouter.swift
//  CleanUserList
//
//  Created by Aravind Kavin on 20/08/23.
//

import UIKit

protocol UserListRouterInput {
    func navigateToUserCreateScene()
}

protocol UserListRouterDataSource: class {
    var selectedUser: User! { get }
}

protocol UserListRouterDataDestination: class {
    
}

class UserListRouter {
    
    weak var viewController: UserListViewController!
    weak private var dataSource: UserListRouterDataSource!
    weak var dataDestination: UserListRouterDataDestination!
    
    init(viewController: UserListViewController, dataSource: UserListRouterDataSource, dataDestination: UserListRouterDataDestination) {
        self.viewController = viewController
        self.dataSource = dataSource
        self.dataDestination = dataDestination
    }
    
    // MARK: Navigation
    
    func navigateToUserCreateScene()
    {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "UserCreateViewController") as? UserCreateViewController
        viewController.navigationController?.pushViewController(vc!, animated: true)
    }
}
