//
//  UserListViewController.swift
//  CleanUserList
//
//  Created by Aravind Kavin on 20/08/23.
//

import UIKit

protocol UserListViewControllerInput {
    func displayUser(viewModel: UserListScene.GetUser.ViewModel)
}

protocol UserListViewControllerOutput {
    func getUser(request: UserListScene.GetUser.Request)
}

class UserListViewController: UIViewController, UserListViewControllerInput, UserListPresenterOutput {
    
    var output: UserListViewControllerOutput?
    var router: UserListRouter?
    var users: [User] = []
    
    @IBOutlet weak var userListTableView: UITableView!
    
    struct cellIdentifiers {
        static let userCell = "userCell"
    }
    
    // MARK: Object lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        UserListConfigurator.sharedInstance.configure(viewController: self)
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableViewOnLoad()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        requestGetUser()
    }
    // MARK: Requests
    
    func requestGetUser() {
        let request = UserListScene.GetUser.Request()
        output?.getUser(request: request)
    }
    
    // MARK: Display logic
    
    func displayUser(viewModel: UserListScene.GetUser.ViewModel) {
        users = viewModel.userList
        userListTableView.reloadData()
    }
    
    // MARK: UI events
    @IBAction func addUserButtonClicked(_ sender: UIBarButtonItem) {
        router?.navigateToUserCreateScene()
    } 
}
