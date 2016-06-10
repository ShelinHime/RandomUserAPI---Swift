//
//  UserModel.swift
//  TenClouds-Junior-iOS
//
//  Created by Joanna Kubiak on 09.06.2016.
//  Copyright © 2016 joannakubiak. All rights reserved.
//

import RealmSwift
import Foundation

enum Gender : String {
    case Male = "male"
    case Female = "female"
    case Uknown = "uknown"
}

class User: Object{
    dynamic var id: String = "0"
    dynamic var name: String = ""
    dynamic var surname: String = ""
    dynamic var imageURL: String = ""
    dynamic var gender: String = ""
    dynamic var email: String = ""
    dynamic var cellPhone: String = ""
    dynamic var date: NSDate = NSDate()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}