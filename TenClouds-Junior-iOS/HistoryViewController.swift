//
//  HistoryViewController.swift
//  TenClouds-Junior-iOS
//
//  Created by Joanna Kubiak on 11.06.2016.
//  Copyright © 2016 joannakubiak. All rights reserved.
//

import UIKit
import RealmSwift

class HistoryViewController: UITableViewController {

    var userid: Int!
    let realm = try! Realm()
    var results: Results<(UserHistory)>!
    var userEdits: [HistoryViewModel] = [HistoryViewModel]()
    var noHistoryView = UIView()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        results = realm.objects(UserHistory).filter("userid = %@", userid)
        if results.count > 0 {
        for result in results{
            userEdits.append(HistoryViewModel.init(name: result.name, surname: result.surname, gender: result.gender, email: result.email, cellPhone: result.cellPhone))
        }
        }
        else{
            self.noHistoryView.addNoHistoryView(self.view.frame)
            self.view.addSubview(self.noHistoryView)
        }
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        self.noHistoryView.removeFromSuperview()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let count = userEdits.count
        return userEdits.count
    }
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200.0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("historyCell", forIndexPath: indexPath) as! EditHistoryTableViewCell
        
        cell.supplementCell(indexPath, historyUser: userEdits)
        return cell
    }

}
