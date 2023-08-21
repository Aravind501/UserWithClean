//
//  CreateUserRouter.swift
//  CleanUserList
//
//  Created by Aravind Kavin on 21/08/23.
//

import UIKit

class CreateUserRouter {
    
    weak var viewController: UserCreateViewController!
    
    init(viewController: UserCreateViewController) {
        self.viewController = viewController
    }
    
    // MARK: Navigation
    
    func navigateToUserCreateScene()
    {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "UserCreateViewController") as? UserCreateViewController
        viewController.navigationController?.pushViewController(vc!, animated: true)
    }
}
