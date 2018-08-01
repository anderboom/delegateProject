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
    @IBOutlet private weak var ageSwitchPosition: UISwitch!
    @IBOutlet private weak var nameField: UITextField!
    @IBOutlet private weak var surnameField: UITextField!
    @IBOutlet private weak var greetingLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greetingLabel.text = ""
        nameField.delegate = self
        surnameField.delegate = self
        }

    func didResetInfo() {
        greetingLabel.text = ""
        ageSwitchPosition.isOn = false
        nameField.text = ""
        surnameField.text = ""
    }
    
    private func hideKeyboard() {
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
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        didResetInfo()
        hideKeyboard()
    }
    
    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        }
   }

extension EditViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        hideKeyboard()
        return true
    }
}
