//
//  registrationViewController.swift
//  MertKarahan
//
//  Created by Mert Karahan on 9.09.2022.
//

import UIKit

class RegistrationScreenViewController: UIViewController {
    
    var onTapSubmit: ((RegisterModel) -> ())?
    var genderrType: String?

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    @IBOutlet weak var submitButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        submitButtonProperties()
    }

    @IBAction func submitButtonClicked(_ sender: Any) {
        
        if genderSegmentedControl.selectedSegmentIndex == 0 {
            self.genderrType = "Male"
        } else {
            self.genderrType = "Female"
        }
        
        let registerModel = RegisterModel(name: nameTextField.text ?? "",
                                                  surname: surnameTextField.text ?? "",
                                                  age: ageTextField.text ?? "",
                                          gender: genderrType ?? "")
        
        onTapSubmit?(registerModel)
        
        navigationController?.popViewController(animated: true)
    }
    
//    UIButton properties.
    private func submitButtonProperties() {
        submitButton.layer.cornerRadius = 10.0
        
    }
}






