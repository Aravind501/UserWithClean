//
//  UserCreateViewController.swift
//  CleanUserList
//
//  Created by Aravind Kavin on 21/08/23.
//

import UIKit


protocol CreateUserViewControllerInput {
    func createUser(viewModel: CreateUserScene.createNewUser.ViewModel)
}

protocol CreateUserViewControllerOutput {
    func createUser(createUser:CreateUser, request: CreateUserScene.createNewUser.Request)
}

class UserCreateViewController: UIViewController, CreateUserViewControllerInput {
    func createUser(viewModel: CreateUserScene.createNewUser.ViewModel) {
        
    }
    
    @IBOutlet weak var createBtn: UIButton!
    @IBOutlet weak var emailValidateLbl: UILabel!
    @IBOutlet weak var nameValidateLbl: UILabel!
    @IBOutlet weak var nameTxtFld: UITextField!
    @IBOutlet weak var emailTxtFld: UITextField!
    @IBOutlet weak var genderSegment: UISegmentedControl!
    
    var output: CreateUserViewControllerOutput?
    var router: CreateUserRouter?

    // MARK: Object lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        CreateUserConfigurator.sharedInstance.configure(viewController: self)
    }
    
    func uiSetup() {
        
        self.nameTxtFld.layer.borderWidth = 1
        self.nameTxtFld.layer.borderColor = UIColor.lightGray.cgColor
        self.nameTxtFld.layer.cornerRadius = 5
        self.nameTxtFld.setLeftPaddingPoints(10)
        self.nameTxtFld.delegate = self
        
        self.emailTxtFld.layer.borderWidth = 1
        self.emailTxtFld.layer.borderColor = UIColor.lightGray.cgColor
        self.emailTxtFld.layer.cornerRadius = 5
        self.emailTxtFld.setLeftPaddingPoints(10)
        self.emailTxtFld.delegate = self
        
        self.createBtn.layer.cornerRadius = 10
        self.applyValidations()
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSetup()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
    }
    @IBAction func createUser(_ sender: Any) {
        
        if self.nameTxtFld.isEmpty() {
            self.displayError(errorMsg: "Please enter your name")
        }
        else if self.emailTxtFld.isEmpty() {
            self.displayError(errorMsg: "Please enter your email address")
        }
        else if checkValidation() {
                print("Success")
                requestCreateUser()
        }
    }
    // MARK: Requests
    
    func requestCreateUser() {
        let gender = self.genderSegment.selectedSegmentIndex == 0 ? "Male" : "Female"
        let user = CreateUser(name: self.nameTxtFld.text ?? "", email: self.emailTxtFld.text ?? "", gender: gender)
        
        let request = CreateUserScene.createNewUser.Request(createUser: user)
        output?.createUser(createUser: user, request: request)
    }
    

    // MARK: UI events

}

extension UserCreateViewController: CreateUserPresenterOutput {
    func displayError(errorMsg: String) {
        let alertController = UIAlertController(title: "FAILED", message: errorMsg, preferredStyle: .alert)

            // Create the actions
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                UIAlertAction in
            }
           
            alertController.addAction(okAction)
            
        self.present(alertController, animated: true, completion: nil)
    }
    

    func displayUser() {
        let alertController = UIAlertController(title: "SUCCESS", message: "User created successfully", preferredStyle: .alert)

            // Create the actions
        let okAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.default) {
                UIAlertAction in
                self.navigationController?.popViewController(animated: true)
            }
           
            alertController.addAction(okAction)
            
        self.present(alertController, animated: true, completion: nil)
    }
}

extension UserCreateViewController {
    
    fileprivate func applyValidations(){
        self.nameTxtFld.validations = [Validation.letter(message: "Name can only allow alphabetic characters.")]
        self.emailTxtFld.validations = [Validation.email(message: "Invalid email address")]
    }
    
    fileprivate func checkValidation() -> Bool{
        do {
            try nameTxtFld.validate()
            try emailTxtFld.validate()
            return true
        }
        catch{
            print(error.localizedDescription)
            self.displayError(errorMsg: error.localizedDescription)
            return false
        }
    }
}
