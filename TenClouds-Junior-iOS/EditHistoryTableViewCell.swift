//
//  EditHistoryTableViewCell.swift
//  TenClouds-Junior-iOS
//
//  Created by Joanna Kubiak on 11.06.2016.
//  Copyright © 2016 joannakubiak. All rights reserved.
//

import UIKit

class EditHistoryTableViewCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var cellPhoneLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func supplementCell(indexPath: NSIndexPath, historyUser: [HistoryViewModel]){
        let history = historyUser[indexPath.row]
        self.nameLabel.text = history.name
        self.surnameLabel.text = history.surname
        self.genderLabel.text = history.gender
        self.emailLabel.text = history.email
        self.cellPhoneLabel.text = history.cellPhone
        self.dateLabel.text = history.date.formatDate()
    }
    


}
