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
    let edits = List<User>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}