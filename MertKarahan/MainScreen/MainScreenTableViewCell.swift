//
//  MainScreenTableViewCell.swift
//  MertKarahan
//
//  Created by Mert Karahan on 9.09.2022.
//

import UIKit

class MainScreenTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        applyRadius(10.0)
    }
    
    func configure(registerInstance: RegisterModel) {
        nameLabel.text = "Name: \(registerInstance.name)"
        surnameLabel.text = "Surname: \(registerInstance.surname)"
        ageLabel.text = "Age: \(registerInstance.age)"
        genderLabel.text = "Gender: \(registerInstance.gender)"
    }
    
//    UITableViewCell properties.
    func applyRadius(_ radius: CGFloat) {
        containerView.layer.cornerRadius = radius
        containerView.layer.masksToBounds = true
    }
}
