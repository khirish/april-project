//
//  CreateAccountViewController.swift
//  AprilProject
//
//  Created by Khirish Meshram on 13/04/20.
//  Copyright © 2020 GumiViet. All rights reserved.
//

import UIKit

class CreateAccountViewController: UIViewController {

    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var firstNameText: UITextField!
    @IBOutlet weak var emailAddressText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var contactNumberText: UITextField!
    @IBOutlet weak var countryText: UITextField!
    @IBOutlet weak var countryPickerView: UIPickerView!
    
    var countryPickerData : [String] = ["Vietnam", "Japan", "India", " Australia", "New Ziland", "China", "Rusia"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countryPickerView.isHidden = true
    }

    @IBAction func nameInfoButton(_ sender: UIButton) {
        contentLabel.textColor = UIColor.systemBlue
        contentLabel.text = "AT LEAST FOUR CHARACTERS!"
    }
    @IBAction func emailInfoButton(_ sender: UIButton) {
        contentLabel.textColor = UIColor.systemBlue
        contentLabel.text = "someone@example.com"
    }
    @IBAction func passwordInfoButton(_ sender: UIButton) {
        contentLabel.textColor = UIColor.systemBlue
        contentLabel.text = "Aa-Zz, 0-9 & Symbols Only"
    }
    @IBAction func contactNumberInfoButton(_ sender: UIButton) {
        contentLabel.textColor = UIColor.systemBlue
        contentLabel.text = "ONLY NUMBERS!"
    }
    @IBAction func countryPickerButton(_ sender: UIButton) {
        countryPickerView.isHidden = false
    }
    
    @IBAction func submitButton(_ sender: UIButton) {
        
        if (firstNameText.text!.isEmpty && emailAddressText.text!.isEmpty && passwordText.text!.isEmpty && contactNumberText.text!.isEmpty && countryText.text!.isEmpty){
            contentLabel.textColor = UIColor.red
            contentLabel.text = "ALL FIELDS ARE REQUIRED!"
        }
        else{
            guard let name = firstNameText.text, firstNameText.text?.count != 0
            else {
                contentLabel.text = "Name Required"
                return
            }
            if isValidName(nameID: name) == false{
                contentLabel.text = "Invalid Name"
                return
            }
            guard let email = emailAddressText.text, emailAddressText.text?.count != 0
            else {
                contentLabel.text = "Email Required"
                return
            }
            if isValidEmail(emailID: email) == false{
                contentLabel.text = "Invalid Email Address"
                return
            }
            guard let password = passwordText.text, passwordText.text?.count != 0
            else {
                contentLabel.text = "Password Required"
                return
            }
            if isValidPassword(passwordID: password) == false{
                contentLabel.text = "Invalid Password Type"
                return
            }
            guard let securityKey = contactNumberText.text, contactNumberText.text?.count != 0
            else {
                contentLabel.text = "Contact No Required"
                return
            }
            if isValidsecurityKey(securityKeyID: securityKey) == false && contactNumberText.text?.count != 8{
                contentLabel.text = "Invalid Contact No"
                return
            }
            guard countryText.text?.count != 0
            else {
                contentLabel.text = "Select Country"
                return
            }
            contentLabel.text = "LOGIN SUCESSFULL!"
            contentLabel.textColor = UIColor.systemGreen
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginViewController
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
        }
    }
    func isValidName(nameID : String) -> Bool {
           let nameTest = NSPredicate(format: "SELF MATCHES %@", "[A-Za-z]{4,}")
           return nameTest.evaluate(with: nameID)
    }
    func isValidEmail(emailID:String) -> Bool {
            let emailTest = NSPredicate(format:"SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")
            return emailTest.evaluate(with: emailID)
    }
    func isValidPassword(passwordID : String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{10}")
        return passwordTest.evaluate(with: passwordID)
    }
    func isValidsecurityKey(securityKeyID : String) -> Bool {
        let securityKeyTest = NSPredicate(format: "SELF MATCHES %@", "[0-9]{8}")
        return securityKeyTest.evaluate(with: securityKeyID)
    }
}

extension CreateAccountViewController: UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return countryPickerData.count
    }
}

extension CreateAccountViewController: UIPickerViewDataSource {
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        countryText.text = countryPickerData[row]
        countryPickerView.isHidden = true
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return countryPickerData[row]
    }
}
