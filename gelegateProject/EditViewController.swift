//
//  EditViewController.swift
//  gelegateProject
//
//  Created by admin on 01.08.2018.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit

protocol EditProfileDelegate: class {
    func userDidChange(firstname: String, lastname: String)
    func userDidResetInfo()
}

class EditViewController: UIViewController {
    
    weak var delegate: EditProfileDelegate?
    @IBOutlet private weak var ageSwitchPosition: UISwitch!
    @IBOutlet private weak var nameField: UITextField!
    @IBOutlet private weak var surnameField: UITextField!
    @IBOutlet private weak var greetingLabel: UILabel!
    var nameValue: String?
    var surnameValue: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        greetingLabel.text = ""
        nameField.text = nameValue ?? ""
        surnameField.text = surnameValue ?? ""
    }

    func hideKeyboard() {
        view.endEditing(true)
    }

   @IBAction private func confirmButtonPressed(_ sender: Any) {
        if ageSwitchPosition.isOn {
            greetingLabel.text = "Hello mr. " + surnameField.text! + "!"
        } else {
            greetingLabel.text = "Hi " + nameField.text! + "!"
        }
        if nameField.text == "" {
        nameField.text = "Undefined"
        }
        if surnameField.text == "" {
        surnameField.text = "Undefined"
        }
        delegate?.userDidChange(firstname: nameField.text ?? "", lastname: surnameField.text ?? "")
        hideKeyboard()
    }
    
    @IBAction private func resetButtonPressed(_ sender: Any) {
        userDidResetInfo()
        hideKeyboard()
    }
/*
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
*/
}

extension EditViewController: EditProfileDelegate {
    func userDidChange(firstname: String, lastname: String) {
        nameField.text = firstname
        surnameField.text = lastname
    }
    
    func userDidResetInfo() {
        nameField.text = ""
        surnameField.text = ""
        greetingLabel.text = ""
        ageSwitchPosition.isOn = false
        
    }
}

extension EditViewController: UITextFieldDelegate {
   
     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboard()
        return true
    }
}
