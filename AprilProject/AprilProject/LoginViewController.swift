//
//  LoginViewController.swift
//  AprilProject
//
//  Created by Khirish Meshram on 08/04/20.
//  Copyright © 2020 GumiViet. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailInfoImage: UIImageView!
    @IBOutlet weak var passwordInfoImage: UIImageView!
    @IBOutlet weak var loginEmail: UITextField!
    @IBOutlet weak var loginPassword: UITextField!
    @IBOutlet weak var validationField: UILabel!
    @IBOutlet weak var hideButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideButton.isHidden = true
    }

    @IBAction func emailInfoGesture(_ sender: UITapGestureRecognizer) {
        validationField.textColor = UIColor.systemBlue
        validationField.text = "someone@example.com"
    }

    @IBAction func hideButton(_ sender: UIButton) {
        loginPassword.isSecureTextEntry = true
        hideButton.isHidden = true
        passwordInfoImage.isHidden = false
    }
    
    @IBAction func passwordTapGesture(_ sender: UITapGestureRecognizer) {
        validationField.textColor = UIColor.systemBlue
        validationField.text = "Aa-Zz, 0-9 & Symbols Only"
        loginPassword.isSecureTextEntry = false
        hideButton.isHidden = false
        passwordInfoImage.isHidden = true
    }
    
    @IBAction func loginButton(_ sender: UIButton) {
        
        if(loginEmail.text!.isEmpty && loginPassword.text!.isEmpty) {
            validationField.textColor = UIColor.red
            validationField.text = "ALL FIELDS REQUIRED!"
        }
        else {
            guard let email = loginEmail.text, loginEmail.text?.count != 0
            else {
                validationField.textColor = UIColor.red
                validationField.text = "EMAIL REQUIRED!"
                return
            }
            if isValidEmail(emailID: email) == false {
                validationField.textColor = UIColor.red
                validationField.text = "INCORRECT EMAIL ID!"
                return
            }
            guard let password = loginPassword.text, loginPassword.text?.count != 0
            else {
                validationField.textColor = UIColor.red
                validationField.text = "PASSWORD REQUIRED!"
                return
            }
            if isValidPassword(passwordID: password) == false {
                validationField.textColor = UIColor.red
                validationField.text = "INCORRECT PASSWORD!"
                return
            }
            validationField.textColor = UIColor.systemGreen
            validationField.text = "LOGIN SUCCESSFULL!"
            
            let vc = UIStoryboard(name: "Main", bundle: nil)
            if let viewC = vc.instantiateViewController(identifier: "notificationMessagesVC") as? UINavigationController{
                viewC.modalPresentationStyle = .fullScreen
                present(viewC, animated: true, completion: nil)
            }
        }
    }
        
    func isValidEmail(emailID:String) -> Bool {
        let emailTest = NSPredicate(format:"SELF MATCHES %@", "[0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")
        return emailTest.evaluate(with: emailID)
    }
    
    func isValidPassword(passwordID : String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{6,}")
        return passwordTest.evaluate(with: passwordID)
    }
}

