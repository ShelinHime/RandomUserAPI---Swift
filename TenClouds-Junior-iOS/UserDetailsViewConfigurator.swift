//
//  UserDetailsViewConfigurator.swift
//  TenClouds-Junior-iOS
//
//  Created by Joanna Kubiak on 10.06.2016.
//  Copyright © 2016 joannakubiak. All rights reserved.
//

import UIKit
import RealmSwift

class UserDetailsViewConfigurator: NSObject {
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var nameTextView: UITextField!
    @IBOutlet weak var surnameTextView: UITextField!
    
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var genderPicker: UIPickerView!
    @IBOutlet weak var emailTextView: UITextField!
    @IBOutlet weak var cellPhoneTextView: UITextField!
    
    @IBOutlet weak var historyButton: UIButton!
    
    var editing = false {
        didSet{
           nameTextView.enabled = editing
           surnameTextView.enabled = editing
            emailTextView.enabled = editing
            cellPhoneTextView.enabled = editing
            if editing {
                editButton.title = "Save"
                genderLabel.hidden = true
                genderPicker.hidden = false
            }
            else {
                editButton.title = "Edit"
                genderLabel.hidden = false
                genderPicker.hidden = true
            }
            emailTextView.keyboardType = .EmailAddress
        }
    }
    
    func configure(user: User){
        editButton.title = "Edit"
        genderLabel.hidden = false
        genderPicker.hidden = true
      
        nameTextView.text = user.name
        surnameTextView.text = user.surname
        genderLabel.text = user.gender
        emailTextView.text = user.email
        cellPhoneTextView.text = user.cellPhone
        userImage.setImageWithUrl(user.imageURL)
    }

}
