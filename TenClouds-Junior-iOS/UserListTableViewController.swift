//
//  UserListTableViewController.swift
//  TenClouds-Junior-iOS
//
//  Created by Joanna Kubiak on 09.06.2016.
//  Copyright © 2016 joannakubiak. All rights reserved.
//

import UIKit
import RealmSwift

class UserListTableViewController: UITableViewController {

    private var viewModel: UsersViewModel!
    var notificationToken: NotificationToken?
    func initializeViewModel() {
        self.viewModel = UsersViewModel()
        self.viewModel.delegate = self
        self.viewModel.initializeData()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
        self.navigationItem.hidesBackButton = true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupResultsNotification()
    }
    
    @IBAction func addButton(sender: AnyObject) {
        self.viewModel.createNewUser()
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.results.count
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 100.0
    }
  
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("UserCell", forIndexPath: indexPath) as! UserTableViewCell

        cell.supplement(indexPath, results: viewModel.results)
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == MainStoryboardSegues.segueToUserDetails{
            let destinationController = segue.destinationViewController as! UserDetailsViewController
            let user = viewModel.results[(tableView.indexPathForSelectedRow?.row)!]
            destinationController.user = user
            destinationController.initializeViewModel(user.id)
        }
    }
    
    private func setupResultsNotification(){
        
        self.notificationToken = viewModel.results.addNotificationBlock { (changes: RealmCollectionChange) in
            switch changes {
            case .Initial:
                // Results are now populated and can be accessed without blocking the UI
                self.tableView.reloadData()
                break
            case .Update(_, let deletions, let insertions, let modifications):
                // Query results have changed, so apply them to the TableView
                self.tableView.beginUpdates()
                self.tableView.insertRowsAtIndexPaths(insertions.map { NSIndexPath(forRow: $0, inSection: 0) },
                    withRowAnimation: .Automatic)
                self.tableView.deleteRowsAtIndexPaths(deletions.map { NSIndexPath(forRow: $0, inSection: 0) },
                    withRowAnimation: .Automatic)
                self.tableView.reloadRowsAtIndexPaths(modifications.map { NSIndexPath(forRow: $0, inSection: 0) },
                    withRowAnimation: .Automatic)
                self.tableView.endUpdates()
                break
            case .Error(let err):
                // An error occurred while opening the Realm file on the background worker thread
                fatalError("\(err)")
                break
            }
        }
    }
    
}

extension UserListTableViewController: UsersViewModelDelegate {
    func addUser() {
        debugPrint("Added - User")
    }
}
