//
//  UserHistoryModel.swift
//  TenClouds-Junior-iOS
//
//  Created by Joanna Kubiak on 09.06.2016.
//  Copyright © 2016 joannakubiak. All rights reserved.
//

import Foundation
import RealmSwift


class UserHistory: Object{
    dynamic var id = 0
    dynamic var userid = 0
    dynamic var name: String = ""
    dynamic var surname: String = ""
    dynamic var gender: String = ""
    dynamic var email: String = ""
    dynamic var cellPhone: String = ""
    dynamic var date: NSDate = NSDate()
    
    
    override static func primaryKey() -> String? {
        return "id"
    }
}