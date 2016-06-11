//
//  UserModel.swift
//  TenClouds-Junior-iOS
//
//  Created by Joanna Kubiak on 09.06.2016.
//  Copyright © 2016 joannakubiak. All rights reserved.
//

import RealmSwift
import Foundation

enum Gender :Int, CustomStringConvertible {
    case Male = 0
    case Female = 1
    case Uknown = 2
    static var count: Int { return Gender.Uknown.hashValue + 1 }
    
    var description: String {
        switch self {
        case .Male: return "male"
        case .Female   : return "female"
        case .Uknown  : return "uknown"
        }
    }
    
}

class User: Object{
    dynamic var id = 0
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