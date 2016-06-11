//
//  UserDetailsViewController.swift
//  TenClouds-Junior-iOS
//
//  Created by Joanna Kubiak on 10.06.2016.
//  Copyright © 2016 joannakubiak. All rights reserved.
//

import UIKit
import RealmSwift

class UserDetailsViewController: UITableViewController{

    @IBOutlet var userDetailsConfigurator: UserDetailsViewConfigurator!
    @IBOutlet weak var genderPicker: UIPickerView!
    var user: User!
    private var viewModel: UserHistoryViewModel!
    var notificationToken: NotificationToken?
    
    func initializeViewModel(userid: Int) {
        self.viewModel = UserHistoryViewModel()
        self.viewModel.delegate = self
        self.viewModel.initializeData(userid)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        genderPicker.dataSource = self
        genderPicker.delegate = self
        
        userDetailsConfigurator.configure(user)
    }
    
    @IBAction func saveUserData(sender: AnyObject) {
        if userDetailsConfigurator.editing {
            viewModel.addEdit(user.id)
            viewModel.saveUpdate(user.id, name: userDetailsConfigurator.nameTextView.text!, surname: userDetailsConfigurator.surnameTextView.text!, gender: userDetailsConfigurator.genderLabel.text!, email: userDetailsConfigurator.emailTextView.text!, cellPhone: userDetailsConfigurator.cellPhoneTextView.text!, imageURL: user.imageURL)
            if let navController = self.navigationController {
                navController.popViewControllerAnimated(true)
            }
        }
        userDetailsConfigurator.editing = !userDetailsConfigurator.editing
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == MainStoryboardSegues.segueToHistory{
            let destinationController = segue.destinationViewController as! HistoryViewController
            destinationController.userid = user.id
        }
    }
    

}

extension UserDetailsViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        userDetailsConfigurator.genderLabel.text = Gender(rawValue: row)?.description
    }
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Gender.count.hashValue
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Gender(rawValue: row)?.description
    }

}

extension UserDetailsViewController: UserHistoryViewModelDelegate{
    func updateUser(user: User){
        self.user = user
    }
}
