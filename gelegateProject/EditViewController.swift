//
//  EditViewController.swift
//  gelegateProject
//
//  Created by admin on 01.08.2018.
//  Copyright © 2018 admin. All rights reserved.
//

import UIKit



class EditViewController: UIViewController {
    
    weak var delegate: EditProfileDelegate?
    @IBOutlet  weak var ageSwitchPosition: UISwitch!
    @IBOutlet  weak var nameField: UITextField!
    @IBOutlet  weak var surnameField: UITextField!
    @IBOutlet  weak var greetingLabel: UILabel!
    var nameValue: String?
    var surnameValue: String?

    override func viewDidLoad() {
        super.viewDidLoad()
        greetingLabel.text = ""
        if let name = nameValue {
            nameField.text = "\(name)"
        } else {
            nameField.text = ""
        }
        if let surname = surnameValue {
            surnameField.text = "\(surname)"
        } else {
            surnameField.text = ""        }
        }

    private func hideKeyboard() {
        view.endEditing(true)
    }
    
    func userResetInfo() {
        greetingLabel.text = ""
        ageSwitchPosition.isOn = false
        nameField.text = ""
        surnameField.text = ""
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
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        userResetInfo()
        hideKeyboard()
    }
/*
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    }
*/
}

extension EditViewController: UITextFieldDelegate {
   
     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboard()
        return true
    }
}
