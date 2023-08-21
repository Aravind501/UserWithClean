//
//  UserCreateViewController+TextField.swift
//  CleanUserList
//
//  Created by Aravind Kavin on 21/08/23.
//

import UIKit

extension UserCreateViewController: UITextFieldDelegate {

    func textFieldDidBeginEditing(_ textField: UITextField) {    //delegate method
    print("Begin")
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {  //delegate method
        print("End")
        return true
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {   //delegate method
        textField.resignFirstResponder()
        
        return true
    }
}
extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}
