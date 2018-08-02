//
//  ProfileViewController.swift
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
class ProfileViewController: UIViewController {
  
    @IBOutlet weak var nameLabelReturn: UILabel!
    @IBOutlet weak var surnameLabelReturn: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "moveToEdit" else { return }
        guard let editVC = segue.destination as? EditViewController else { return }
        editVC.nameValue = nameLabelReturn.text
        editVC.surnameValue = surnameLabelReturn.text
        editVC.delegate = self
    }
}

extension ProfileViewController: EditProfileDelegate {
    func userDidChange(firstname: String, lastname: String) {
        nameLabelReturn.text = firstname
        surnameLabelReturn.text = lastname
    }
    
    func userDidResetInfo() {
        nameLabelReturn.text = ""
        surnameLabelReturn.text = ""
    }
}
