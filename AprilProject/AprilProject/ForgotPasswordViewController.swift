//
//  ForgotPasswordViewController.swift
//  AprilProject
//
//  Created by Khirish Meshram on 23/04/20.
//  Copyright © 2020 GumiViet. All rights reserved.
//

import UIKit

class ForgotPasswordViewController: UIViewController {

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var msgLBL: UILabel!
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginButton.layer.borderWidth = 3
        loginButton.layer.cornerRadius = 7
        loginButton.layer.borderColor = UIColor(red: 0.72, green: 0.00, blue: 0.00, alpha: 1.00).cgColor
    }
    
    @IBAction func submitButton(_ sender: UIButton) {
        
        if (emailTextField.text!.isEmpty ){
            msgLBL.text = "Enter Email Address!"
        }
        else{
            guard let email = emailTextField.text, emailTextField.text?.count != 0
            else {
                msgLBL.text = "Email Address Required!"
                return
            }
            if isValidEmail(emailID: email) == false{
                msgLBL.textColor = UIColor.systemRed
                msgLBL.text = "Invalid Email Address!"
                return
            }
            
            msgLBL.textColor = UIColor.systemGreen
            msgLBL.text = "Account recovery email sent to \(emailTextField.text!)"
        }
    }
    func isValidEmail(emailID:String) -> Bool {
        let emailTest = NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")
        return emailTest.evaluate(with: emailID)
    }
}
