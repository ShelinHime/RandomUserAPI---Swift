//
//  UserTableViewCell.swift
//  TenClouds-Junior-iOS
//
//  Created by Joanna Kubiak on 10.06.2016.
//  Copyright © 2016 joannakubiak. All rights reserved.
//

import Foundation
import UIKit
import RealmSwift

class UserTableViewCell: UITableViewCell {
    
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    @IBOutlet weak var userImage: UIImageView!

    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func supplement(indexPath: NSIndexPath, results: Results<(User)>){
    
        let user = results[indexPath.row]
        self.firstNameLabel.text = user.name
        self.userImage.layer.backgroundColor = UIColor.blackColor().CGColor
        self.lastNameLabel.text = user.surname
        
        if let url = NSURL(string: user.imageURL) {
            if let data = NSData(contentsOfURL: url) {
                self.userImage.image = UIImage(data: data)
                self.userImage.clipsToBounds = true
                self.userImage.layer.cornerRadius = 30
                self.userImage.layer.borderWidth = 2
                self.userImage.layer.borderColor = UIColor.whiteColor().CGColor
            }
        }
    }

}
